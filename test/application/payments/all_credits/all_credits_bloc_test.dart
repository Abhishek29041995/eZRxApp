import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late AllCreditsAndInvoicesRepository repository;
  late List<CreditAndInvoiceItem> fakeResult;
  late AllCreditsFilter allCreditsFilter;
  late Config config;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() {
    fakeResult = [
      CreditAndInvoiceItem.empty(),
    ];
    allCreditsFilter = AllCreditsFilter.defaultFilter();
  });

  group(
    'All Credits Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => ZPAllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
        expect: () => [AllCreditsState.initial()],
      );
    },
  );

  group(
    'All Credits Bloc Fetch',
    () {
      blocTest(
        'fetch -> credits fetch fail',
        build: () => ZPAllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        seed: () => AllCreditsState.initial(),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AllCreditsBloc bloc) {
          bloc.add(
            AllCreditsEvent.fetch(
              appliedFilter: AllCreditsFilter.defaultFilter(),
            ),
          );
        },
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
      blocTest(
        'fetch -> credits fetch success for ZP',
        build: () => ZPAllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        seed: () => AllCreditsState.initial(),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            items: fakeResult,
            failureOrSuccessOption: none(),
            canLoadMore: false,
          ),
        ],
      );

      blocTest(
        'fetch -> credits fetch success for MP',
        build: () => MPAllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        seed: () => AllCreditsState.initial(),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter,
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right(fakeResult));
        },
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            items: fakeResult,
            failureOrSuccessOption: none(),
            canLoadMore: false,
          ),
        ],
      );

      blocTest(
        'fetch -> search and filter combine',
        build: () => ZPAllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        seed: () => AllCreditsState.initial().copyWith(
          appliedFilter: AllCreditsFilter.defaultFilter().copyWith(
            searchKey: SearchKey.search('fake-search-key'),
            amountValueTo: RangeValue('1'),
          ),
        ),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter.copyWith(
                searchKey: SearchKey.search('fake-search-key'),
              ),
              offset: 0,
              pageSize: config.pageSize,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter().copyWith(
              searchKey: SearchKey.search('fake-search-key'),
            ),
          ),
        ),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
            appliedFilter: allCreditsFilter.copyWith(
              searchKey: SearchKey.search('fake-search-key'),
            ),
          ),
          AllCreditsState.initial().copyWith(
            items: fakeResult,
            failureOrSuccessOption: none(),
            canLoadMore: false,
            appliedFilter: allCreditsFilter.copyWith(
              searchKey: SearchKey.search('fake-search-key'),
            ),
          ),
        ],
      );
    },
  );

  group('All Credits Bloc load more', () {
    blocTest(
      'fetch -> credits load more fail',
      build: () => ZPAllCreditsBloc(
        allCreditsAndInvoicesRepository: repository,
        config: config,
      ),
      seed: () => AllCreditsState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          config.pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterCredits(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allCreditsFilter,
            offset: config.pageSize,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AllCreditsBloc bloc) => bloc.add(
        const AllCreditsEvent.loadMore(),
      ),
      expect: () => [
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'fetch -> credits load more success for ZP',
      build: () => ZPAllCreditsBloc(
        allCreditsAndInvoicesRepository: repository,
        config: config,
      ),
      seed: () => AllCreditsState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          config.pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterCredits(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allCreditsFilter,
            offset: config.pageSize,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            List.filled(
              config.pageSize,
              fakeResult.first,
            ),
          ),
        );
      },
      act: (AllCreditsBloc bloc) => bloc.add(
        const AllCreditsEvent.loadMore(),
      ),
      expect: () => [
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            fakeResult.first,
          ),
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize * 2,
            fakeResult.first,
          ),
        ),
      ],
    );

    blocTest(
      'fetch -> credits load more success for MP',
      build: () => MPAllCreditsBloc(
        allCreditsAndInvoicesRepository: repository,
        config: config,
      ),
      seed: () => AllCreditsState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          config.pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterCredits(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allCreditsFilter,
            offset: config.pageSize,
            pageSize: config.pageSize,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (_) async => Right(List.filled(config.pageSize, fakeResult.first)),
        );
      },
      act: (AllCreditsBloc bloc) => bloc.add(
        const AllCreditsEvent.loadMore(),
      ),
      expect: () => [
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            fakeResult.first,
          ),
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          items: List.filled(
            config.pageSize * 2,
            fakeResult.first,
          ),
        ),
      ],
    );
  });
}
