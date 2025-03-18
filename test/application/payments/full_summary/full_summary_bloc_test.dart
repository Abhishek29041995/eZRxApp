import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late AllCreditsAndInvoicesRepository repository;
  late List<CreditAndInvoiceItem> fakeResult;
  late FullSummaryFilter fullSummaryFilter;
  late Config config;
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    fakeResult =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    fullSummaryFilter = FullSummaryFilter.defaultFilter();
    repository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  group(
    'Full Summary Bloc Test =>',
    () {
      blocTest(
        'Initialize',
        build: () => ZPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          FullSummaryEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest(
        'Fetch Success for ZP',
        build: () => ZPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          FullSummaryEvent.fetch(
            appliedFilter: fullSummaryFilter,
          ),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            appliedFilter: fullSummaryFilter,
            items: fakeResult,
            canLoadMore: fakeResult.length >= config.pageSize,
            failureOrSuccessOption: optionOf(Right(fakeResult)),
          ),
        ],
      );

      blocTest(
        'Fetch Success for MP',
        build: () => MPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          FullSummaryEvent.fetch(
            appliedFilter: fullSummaryFilter,
          ),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right(fakeResult));
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            appliedFilter: fullSummaryFilter,
            items: fakeResult,
            canLoadMore: fakeResult.length >= config.pageSize,
            failureOrSuccessOption: optionOf(Right(fakeResult)),
          ),
        ],
      );

      blocTest(
        'Fetch Failure',
        build: () => ZPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          FullSummaryEvent.fetch(
            appliedFilter: fullSummaryFilter,
          ),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            appliedFilter: fullSummaryFilter,
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );

      blocTest(
        'Loadmore Success for ZP',
        build: () => ZPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          const FullSummaryEvent.loadMore(),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          canLoadMore: true,
          items: fakeResult,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: fakeResult.length,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            canLoadMore: true,
            items: fakeResult,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            appliedFilter: fullSummaryFilter,
            items: [...fakeResult, ...fakeResult],
            canLoadMore: fakeResult.length >= config.pageSize,
          ),
        ],
      );

      blocTest(
        'Loadmore Success for MP',
        build: () => MPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          const FullSummaryEvent.loadMore(),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          canLoadMore: true,
          items: fakeResult,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: fakeResult.length,
              pageSize: config.pageSize,
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right(fakeResult));
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            canLoadMore: true,
            items: fakeResult,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            appliedFilter: fullSummaryFilter,
            items: [...fakeResult, ...fakeResult],
            canLoadMore: fakeResult.length >= config.pageSize,
          ),
        ],
      );

      blocTest(
        'Loadmore Failure',
        build: () => ZPFullSummaryBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (FullSummaryBloc bloc) => bloc.add(
          const FullSummaryEvent.loadMore(),
        ),
        seed: () => FullSummaryState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          canLoadMore: true,
          items: fakeResult,
        ),
        setUp: () {
          when(
            () => repository.filterFullSummary(
              salesOrganisation: fakeSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              filter: fullSummaryFilter,
              offset: fakeResult.length,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        expect: () => [
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            canLoadMore: true,
            items: fakeResult,
            isLoading: true,
            appliedFilter: fullSummaryFilter,
          ),
          FullSummaryState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            canLoadMore: true,
            items: fakeResult,
            appliedFilter: fullSummaryFilter,
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );
    },
  );
}
