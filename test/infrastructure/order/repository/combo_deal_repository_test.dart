import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/combo_deal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ComboDealLocalDataSourceMock extends Mock
    implements ComboDealLocalDataSource {}

class ComboDealRemoteDataSourceMock extends Mock
    implements ComboDealRemoteDataSource {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late ComboDealRepository repository;
  late Config mockConfig;
  late ComboDealLocalDataSource localDataSource;
  late ComboDealRemoteDataSource remoteDataSource;

  final fakeSaleOrg = SalesOrg('2601');
  final fakeCustomerCode =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030031512');
  final fakeComboDealQuery = PriceComboDeal.empty().copyWith(
    isEligible: true,
    flexibleGroup: FlexibleGroup('fake-group'),
    salesDeal: SalesDealNumber('fake-deal'),
  );

  final fakeComboDeals = [ComboDeal.empty()];

  setUp(() {
    localDataSource = ComboDealLocalDataSourceMock();
    remoteDataSource = ComboDealRemoteDataSourceMock();
    mockConfig = MockConfig();
    repository = ComboDealRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('Combo Deal material', () {
    test('Get successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDealList())
          .thenAnswer((invocation) async => fakeComboDeals);

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => []),
        fakeComboDeals,
      );
    });

    test('Get fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDealList())
          .thenThrow((_) async => MockException());

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('Get successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDealList(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          materialNumbers: [],
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenAnswer((invocation) async => fakeComboDeals);

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => []),
        fakeComboDeals,
      );
    });

    test('Get fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDealList(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          materialNumbers: [],
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenThrow((_) async => MockException());

      final result = await repository.getComboDealList(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });

  group('Combo Deal principle group', () {
    final fakeComboDeal = ComboDeal.empty().copyWith(
      flexiTierRule: [
        ComboDealTierRule.empty(),
      ],
    );

    test('Get successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDeal()).thenAnswer(
        (invocation) async => fakeComboDeal,
      );

      final result = await repository.getComboDeal(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => ComboDeal.empty()),
        fakeComboDeal,
      );
    });

    test('Get fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getComboDeal())
          .thenThrow((_) async => MockException());

      final result = await repository.getComboDeal(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('Get successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDeal(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenAnswer((invocation) async => fakeComboDeal);

      final result = await repository.getComboDeal(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => ComboDeal.empty()),
        fakeComboDeal,
      );
    });

    test('Get fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => remoteDataSource.getComboDeal(
          customerCode: '0030031512',
          flexibleGroup: 'fake-group',
          salesDeal: 'fake-deal',
          salesOrgCode: '2601',
        ),
      ).thenThrow((_) async => MockException());

      final result = await repository.getComboDeal(
        comboDealInfo: fakeComboDealQuery,
        customerCode: fakeCustomerCode,
        salesOrg: fakeSaleOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
