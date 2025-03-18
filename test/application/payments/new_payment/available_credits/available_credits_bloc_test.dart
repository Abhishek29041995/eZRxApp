import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late NewPaymentRepository newPaymentRepositoryMock;
  late List<CustomerOpenItem> openItems;
  late Config config;
  group(
    'Available_Credit_Bloc Test => ',
    () {
      setUp(() async {
        newPaymentRepositoryMock = NewPaymentRepositoryMock();
        openItems = await NewPaymentLocalDataSource().getCustomerOpenItems();
        config = Config()..appFlavor = Flavor.mock;
      });

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "initialized" Event',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.initialized(
            salesOrganization: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
        expect: () => [AvailableCreditsState.initial()],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event with failure',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('Fake-Sales-Org'),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: 'Fake-CustomerCode',
              ),
              pageSize: config.pageSize,
              offset: 0,
              appliedFilter: AvailableCreditFilter.defaultFilter(),
              searchKey: SearchKey.search('ab'),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.search('ab'),
            isMarketPlace: true,
          ),
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            isLoading: true,
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
            searchKey: SearchKey.search('ab'),
          ),
          AvailableCreditsState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
            searchKey: SearchKey.search('ab'),
          ),
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event with success',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('Fake-Sales-Org'),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: 'Fake-CustomerCode',
              ),
              pageSize: config.pageSize,
              offset: 0,
              appliedFilter: AvailableCreditFilter.defaultFilter(),
              searchKey: SearchKey.search('ab'),
              isMarketPlace: false,
            ),
          ).thenAnswer((invocation) async => Right(openItems));
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.search('ab'),
            isMarketPlace: false,
          ),
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            isLoading: true,
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
            searchKey: SearchKey.search('ab'),
          ),
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            canLoadMore: false,
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
            searchKey: SearchKey.search('ab'),
          ),
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event not success when searchKey is invalid',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.search('a'),
            isMarketPlace: true,
          ),
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
        ),
        expect: () => [],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event not success when searchKey is similar',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.search('ab'),
            isMarketPlace: true,
          ),
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
          searchKey: SearchKey.search('ab'),
        ),
        expect: () => [],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "loadMore" Event with failure',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('Fake-Sales-Org'),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: 'Fake-CustomerCode',
              ),
              pageSize: config.pageSize,
              offset: openItems.length,
              appliedFilter: AvailableCreditFilter.defaultFilter(),
              searchKey: SearchKey.empty(),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          const AvailableCreditsEvent.loadMore(isMarketPlace: true),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            isLoading: true,
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
          ),
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
          ),
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "loadMore" Event with success',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
          config: config,
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.defaultFilter(),
          items: openItems,
          salesOrganization: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('Fake-Sales-Org'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'Fake-CustomerCode',
          ),
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('Fake-Sales-Org'),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: 'Fake-CustomerCode',
              ),
              pageSize: config.pageSize,
              offset: openItems.length,
              appliedFilter: AvailableCreditFilter.defaultFilter(),
              searchKey: SearchKey.empty(),
              isMarketPlace: false,
            ),
          ).thenAnswer((invocation) async => Right(openItems));
        },
        act: (bloc) => bloc.add(
          const AvailableCreditsEvent.loadMore(isMarketPlace: false),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            isLoading: true,
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
          ),
          AvailableCreditsState.initial().copyWith(
            canLoadMore: false,
            items: List<CustomerOpenItem>.from(openItems)..addAll(openItems),
            salesOrganization: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('Fake-Sales-Org'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'Fake-CustomerCode',
            ),
          ),
        ],
      );
    },
  );
}
