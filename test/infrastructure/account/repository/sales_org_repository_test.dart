import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';

class SalesOrgLocalDataSourceMock extends Mock
    implements SalesOrgLocalDataSource {}

class SalesOrgRemoteDataSourceMock extends Mock
    implements SalesOrgRemoteDataSource {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;
  late String mockSalesOrgName;
  late SalesOrganisation mockSalesOrg;
  late SalesOrgRepository salesOrgRepository;
  late AccountSelectorStorage accountSelectorStorageMock;
  late SalesOrgLocalDataSource salesOrgLocalDataSourceMock;
  late SalesOrgRemoteDataSource salesOrgRemoteDataSourceMock;
  late DeviceStorage deviceStorageMock;
  const mockMarket = 'mockMarket';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    configMock = ConfigMock();
    accountSelectorStorageMock = AccountSelectorStorageMock();
    salesOrgLocalDataSourceMock = SalesOrgLocalDataSourceMock();
    salesOrgRemoteDataSourceMock = SalesOrgRemoteDataSourceMock();
    deviceStorageMock = DeviceStorageMock();

    mockSalesOrgName = 'mockSalesOrg';

    mockSalesOrg = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg(mockSalesOrgName),
    );

    salesOrgRepository = SalesOrgRepository(
      config: configMock,
      localDataSource: salesOrgLocalDataSourceMock,
      remoteDataSource: salesOrgRemoteDataSourceMock,
      accountSelectorStorage: accountSelectorStorageMock,
      deviceStorage: deviceStorageMock,
    );

    registerFallbackValue(AccountSelectorStorageDto.empty());
  });

  group('Sales Org Repository Test', () {
    test(
        'Get Sales Organisation Config from local data source successfully test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => salesOrgLocalDataSourceMock.getConfig(),
      ).thenAnswer((invocation) async => fakeSGSalesOrgConfigs);

      final result = await salesOrgRepository
          .getSalesOrganisationConfigs(fakeSalesOrganisation);

      expect(result.isRight(), true);
    });

    test('Get Sales Organisation Config from local data source failed test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => salesOrgLocalDataSourceMock.getConfig(),
      ).thenThrow((invocation) async => MockException());

      final result =
          await salesOrgRepository.getSalesOrganisationConfigs(mockSalesOrg);

      expect(result.isLeft(), true);
    });

    test(
        'Get Sales Organisation Config from remote data source successfully test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);

      when(
        () => salesOrgRemoteDataSourceMock.getConfig(
          salesOrg: fakeSGSalesOrgConfigs.salesOrg.getOrCrash(),
          market: mockMarket,
        ),
      ).thenAnswer((invocation) async => fakeSGSalesOrgConfigs);

      final result = await salesOrgRepository
          .getSalesOrganisationConfigs(fakeSGSalesOrganisation);

      expect(result.isRight(), true);
    });

    test('Get Sales Organisation Config from remote data source failed test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);
      when(
        () => salesOrgRemoteDataSourceMock.getConfig(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          market: mockMarket,
        ),
      ).thenThrow((invocation) async => Exception());

      final result =
          await salesOrgRepository.getSalesOrganisationConfigs(mockSalesOrg);

      expect(result.isLeft(), true);
    });

    test('Init sales org storage success test', () async {
      when(() => accountSelectorStorageMock.init())
          .thenAnswer((invocation) async {
        return;
      });

      final result = await salesOrgRepository.initSalesOrgStorage();

      expect(result.isRight(), true);
    });

    test('Init sales org storage failed test', () async {
      when(() => accountSelectorStorageMock.init())
          .thenThrow((invocation) => Exception());

      final result = await salesOrgRepository.initSalesOrgStorage();

      expect(result.isLeft(), true);
    });

    test('Store sales org in account storage success test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenAnswer((invocation) async {
        return;
      });

      final result = await salesOrgRepository.storeSalesOrg(
        salesOrg: mockSalesOrgName,
      );

      expect(result.isRight(), true);
    });

    test('Store sales org in account storage failure test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenThrow((invocation) => MockException());

      final result = await salesOrgRepository.storeSalesOrg(
        salesOrg: mockSalesOrgName,
      );

      expect(result.isLeft(), true);
    });

    test('Get sales org success test', () async {
      final mockAccountSelectorDto = AccountSelectorStorageDto.empty();

      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => mockAccountSelectorDto);

      final result = await salesOrgRepository.getSalesOrg();

      expect(result.isRight(), true);
    });

    test('Get sales org failed test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenThrow((invocation) => Exception());

      final result = await salesOrgRepository.getSalesOrg();

      expect(result.isLeft(), true);
    });

    test('Delete sales org success test', () async {
      when(() => accountSelectorStorageMock.delete())
          .thenAnswer((invocation) async {
        return;
      });

      final result = await salesOrgRepository.deleteSalesOrg();

      expect(result.isRight(), true);
    });

    test('Delete sales org failed test', () async {
      when(() => accountSelectorStorageMock.delete())
          .thenThrow((invocation) => Exception());

      final result = await salesOrgRepository.deleteSalesOrg();

      expect(result.isLeft(), true);
    });
  });
}
