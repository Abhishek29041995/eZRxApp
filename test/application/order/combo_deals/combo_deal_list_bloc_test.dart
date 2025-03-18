import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockComboDealReposity extends Mock implements IComboDealRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late IComboDealRepository repository;
  late List<ComboDeal> comboDeals;
  late ComboDeal principleComboDeal;
  final fakeSalesOrg = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-sales-org'),
  );
  final fakeCustomerCode = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');
  final fakeComboDealQuery = PriceComboDeal.empty().copyWith(
    flexibleGroup: FlexibleGroup('fake-group'),
    salesDeal: SalesDealNumber('fake-sales-deal'),
  );

  setUpAll(() async {
    principleComboDeal = await ComboDealLocalDataSource().getComboDeal();
    comboDeals = await ComboDealLocalDataSource().getComboDealList();
  });

  setUp(() {
    repository = MockComboDealReposity();
  });
  blocTest<ComboDealListBloc, ComboDealListState>(
    'Init',
    build: () => ComboDealListBloc(repository: repository),
    act: (bloc) => bloc.add(
      const ComboDealListEvent.initialize(),
    ),
    expect: () => [
      ComboDealListState.initial(),
    ],
  );
  group(
    'Combo Deal List',
    () {
      blocTest<ComboDealListBloc, ComboDealListState>(
        'Fetch success when state is empty',
        build: () => ComboDealListBloc(repository: repository),
        setUp: () {
          when(
            () => repository.getComboDealList(
              salesOrg: fakeSalesOrg.salesOrg,
              customerCode: fakeCustomerCode,
              comboDealInfo: fakeComboDealQuery,
            ),
          ).thenAnswer(
            (_) async => Right(comboDeals),
          );
        },
        act: (bloc) => bloc.add(
          ComboDealListEvent.fetchMaterialDeal(
            salesOrganisation: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCode,
            priceComboDeal: fakeComboDealQuery,
          ),
        ),
        expect: () => [
          ComboDealListState.initial().copyWith(isFetching: true),
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              fakeComboDealQuery.id: comboDeals,
            },
            priceComboDeal: fakeComboDealQuery,
          ),
        ],
        verify: (bloc) {
          expect(
            bloc.state.getComboDeal(comboDealId: fakeComboDealQuery.id),
            comboDeals.first,
          );
        },
      );

      blocTest<ComboDealListBloc, ComboDealListState>(
        'Fetch failure when state is empty',
        build: () => ComboDealListBloc(repository: repository),
        setUp: () {
          when(
            () => repository.getComboDealList(
              salesOrg: fakeSalesOrg.salesOrg,
              customerCode: fakeCustomerCode,
              comboDealInfo: fakeComboDealQuery,
            ),
          ).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          ComboDealListEvent.fetchMaterialDeal(
            salesOrganisation: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCode,
            priceComboDeal: fakeComboDealQuery,
          ),
        ),
        expect: () => [
          ComboDealListState.initial().copyWith(isFetching: true),
          ComboDealListState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
        verify: (bloc) {
          expect(
            bloc.state.getComboDeal(comboDealId: fakeComboDealQuery.id),
            ComboDeal.empty(),
          );
        },
      );

      blocTest<ComboDealListBloc, ComboDealListState>(
        'Fetch stop when already stayed in state',
        build: () => ComboDealListBloc(repository: repository),
        seed: () => ComboDealListState.initial().copyWith(
          comboDeals: {
            fakeComboDealQuery.id: comboDeals,
          },
        ),
        act: (bloc) => bloc.add(
          ComboDealListEvent.fetchMaterialDeal(
            salesOrganisation: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCode,
            priceComboDeal: fakeComboDealQuery,
          ),
        ),
        expect: () => [
          ComboDealListState.initial().copyWith(
            isFetching: true,
            comboDeals: {
              fakeComboDealQuery.id: comboDeals,
            },
          ),
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              fakeComboDealQuery.id: comboDeals,
            },
          ),
        ],
      );
    },
  );

  group('Principle Combo Deal', () {
    blocTest<ComboDealListBloc, ComboDealListState>(
      'Fetch success when state is empty',
      build: () => ComboDealListBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getComboDeal(
            salesOrg: fakeSalesOrg.salesOrg,
            customerCode: fakeCustomerCode,
            comboDealInfo: fakeComboDealQuery,
          ),
        ).thenAnswer(
          (_) async => Right(principleComboDeal),
        );
      },
      act: (bloc) => bloc.add(
        ComboDealListEvent.fetchPrincipleGroupDeal(
          salesOrganisation: fakeSalesOrg,
          customerCodeInfo: fakeCustomerCode,
          priceComboDeal: fakeComboDealQuery,
        ),
      ),
      expect: () => [
        ComboDealListState.initial().copyWith(isFetching: true),
        ComboDealListState.initial().copyWith(
          isFetching: false,
          comboDeals: {
            fakeComboDealQuery.id: [principleComboDeal],
          },
          priceComboDeal: fakeComboDealQuery,
        ),
      ],
      verify: (bloc) {
        expect(
          bloc.state.getComboDeal(comboDealId: fakeComboDealQuery.id),
          principleComboDeal,
        );
      },
    );

    blocTest<ComboDealListBloc, ComboDealListState>(
      'Fetch failure when state is empty',
      build: () => ComboDealListBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getComboDeal(
            salesOrg: fakeSalesOrg.salesOrg,
            customerCode: fakeCustomerCode,
            comboDealInfo: fakeComboDealQuery,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        ComboDealListEvent.fetchPrincipleGroupDeal(
          salesOrganisation: fakeSalesOrg,
          customerCodeInfo: fakeCustomerCode,
          priceComboDeal: fakeComboDealQuery,
        ),
      ),
      expect: () => [
        ComboDealListState.initial().copyWith(isFetching: true),
        ComboDealListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
      verify: (bloc) {
        expect(
          bloc.state.getComboDeal(comboDealId: fakeComboDealQuery.id),
          ComboDeal.empty(),
        );
      },
    );

    blocTest<ComboDealListBloc, ComboDealListState>(
      'Fetch stop when already stayed in state',
      build: () => ComboDealListBloc(repository: repository),
      seed: () => ComboDealListState.initial().copyWith(
        comboDeals: {
          fakeComboDealQuery.id: [principleComboDeal],
        },
      ),
      act: (bloc) => bloc.add(
        ComboDealListEvent.fetchPrincipleGroupDeal(
          salesOrganisation: fakeSalesOrg,
          customerCodeInfo: fakeCustomerCode,
          priceComboDeal: fakeComboDealQuery,
        ),
      ),
      expect: () => [
        ComboDealListState.initial().copyWith(
          isFetching: true,
          comboDeals: {
            fakeComboDealQuery.id: [principleComboDeal],
          },
        ),
        ComboDealListState.initial().copyWith(
          isFetching: false,
          comboDeals: {
            fakeComboDealQuery.id: [principleComboDeal],
          },
        ),
      ],
    );
  });
}
