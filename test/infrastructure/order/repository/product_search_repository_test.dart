import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_suggestion_history_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_search_repository.dart';

import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import 'material_list_repository_test.dart';

class MockConfig extends Mock implements Config {}

class ProductSuggestionHistoryStorageMock extends Mock
    implements ProductSuggestionHistoryStorage {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late Config mockConfig;
  late ProductSearchRepository repository;
  late ProductSuggestionHistoryStorage storage;
  late MaterialListLocalDataSource localDataSource;
  late MaterialListRemoteDataSource remoteDataSource;
  late DeviceStorage deviceStorage;

  const fakeException = 'fake-exception';
  final fakeSearchKey = SearchKey.search('fake');
  const fakePageSize = 10;
  const fakeOffset = 10;
  final fakeMaterialResponse =
      await MaterialListLocalDataSource().getProductList();
  const fakeMarket = 'fake-market';
  const pageSize = 24;

  setUp(() async {
    mockConfig = MockConfig();
    localDataSource = MaterialListLocalDataSourceMock();
    remoteDataSource = MaterialListRemoteDataSourceMock();
    storage = ProductSuggestionHistoryStorageMock();
    deviceStorage = DeviceStorageMock();
    repository = ProductSearchRepository(
      config: mockConfig,
      productSuggestionHistoryStorage: storage,
      materialListLocalDataSource: localDataSource,
      materialListRemoteDataSource: remoteDataSource,
      deviceStorage: deviceStorage,
    );
  });

  group('Product search repository test -', () {
    group('Get search key -', () {
      test('Failure', () async {
        when(() => storage.getAllSearchKey()).thenThrow(fakeException);

        final result = await repository.getSearchKeys();

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Success', () async {
        when(() => storage.getAllSearchKey()).thenReturn(
          ProductSuggestionHistoryDto(
            searchKeyList: [fakeSearchKey.getValue()],
          ),
        );

        final result = await repository.getSearchKeys();

        expect(
          result,
          Right(ProductSuggestionHistory(searchKeyList: [fakeSearchKey])),
        );
      });
    });

    group('Clear search history -', () {
      test('Failure', () async {
        when(() => storage.clear()).thenThrow(fakeException);

        final result = await repository.clearSearchHistory();

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Success', () async {
        when(() => storage.clear()).thenAnswer((_) => Future.value());

        final result = await repository.clearSearchHistory();

        expect(result, const Right(unit));
      });
    });

    group('Scan product -', () {
      const fakeEanNumber = 'fake-ean-number';
      test('Failure in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSource.getProductList()).thenThrow(fakeException);

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Success in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSource.getProductList())
            .thenAnswer((_) async => fakeMaterialResponse);

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(result, Right(fakeMaterialResponse.products.first));
      });

      test('Failure in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: fakeEanNumber,
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.settings.languagePreference.languageCode,
            offset: 0,
            pageSize: pageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: '',
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenThrow(fakeException);

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Failure when response is empty in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: fakeEanNumber,
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.settings.languagePreference.languageCode,
            offset: 0,
            pageSize: pageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: '',
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenAnswer((_) async => fakeMaterialResponse.copyWith(products: []));

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(
          result,
          const Left(ApiFailure.scannedProductNotFound()),
        );
      });

      test('Success when response is not empty in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: fakeEanNumber,
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.settings.languagePreference.languageCode,
            offset: 0,
            pageSize: pageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: '',
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenAnswer((_) async => fakeMaterialResponse);

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(result, Right(fakeMaterialResponse.products.first));
      });

      test('Success in remote with salesrep role', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: fakeEanNumber,
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeSalesRepUser.settings.languagePreference.languageCode,
            offset: 0,
            pageSize: pageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: '',
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenAnswer((_) async => fakeMaterialResponse);

        final result = await repository.getScanProduct(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeSalesRepUser,
          eanNumber: Ean(fakeEanNumber),
          materialFilter: MaterialFilter.empty(),
        );

        expect(result, Right(fakeMaterialResponse.products.first));
      });
    });

    group('Search product list -', () {
      test('Failure in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSource.getProductList()).thenThrow(fakeException);

        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeClientUser,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Success in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSource.getProductList())
            .thenAnswer((_) async => fakeMaterialResponse);
        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeClientUser,
        );

        expect(result, Right(fakeMaterialResponse));
      });

      test('Failure in remote when get and put keyword failure', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => storage.getAllSearchKey()).thenThrow(fakeException);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => storage.putSearchKey(
            searchKeyList: ProductSuggestionHistoryDto.fromDomain(
              ProductSuggestionHistory(searchKeyList: [fakeSearchKey]),
            ),
          ),
        ).thenThrow(fakeException);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: '',
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            offset: fakeOffset,
            pageSize: fakePageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenThrow(fakeException);

        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeClientUser,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Failure in remote when get and put keyword success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => storage.getAllSearchKey()).thenReturn(
          ProductSuggestionHistoryDto(
            searchKeyList: [
              fakeSearchKey.getOrDefaultValue(''),
              fakeSearchKey.getOrDefaultValue(''),
            ],
          ),
        );
        when(
          () => storage.putSearchKey(
            searchKeyList: ProductSuggestionHistoryDto.fromDomain(
              ProductSuggestionHistory(searchKeyList: [fakeSearchKey]),
            ),
          ),
        ).thenAnswer((_) => Future.value());
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: '',
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            offset: fakeOffset,
            pageSize: fakePageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenThrow(fakeException);

        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeClientUser,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('Success in remote when get and put keyword success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => storage.getAllSearchKey()).thenReturn(
          ProductSuggestionHistoryDto(
            searchKeyList: [
              fakeSearchKey.getOrDefaultValue(''),
              fakeSearchKey.getOrDefaultValue(''),
            ],
          ),
        );
        when(
          () => storage.putSearchKey(
            searchKeyList: ProductSuggestionHistoryDto.fromDomain(
              ProductSuggestionHistory(searchKeyList: [fakeSearchKey]),
            ),
          ),
        ).thenAnswer((_) => Future.value());
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: '',
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            offset: fakeOffset,
            pageSize: fakePageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenAnswer((_) async => fakeMaterialResponse);

        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeClientUser,
        );

        expect(result, Right(fakeMaterialResponse));
      });

      test('Success in remote with salesrep role', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => storage.getAllSearchKey()).thenReturn(
          ProductSuggestionHistoryDto(
            searchKeyList: [
              fakeSearchKey.getOrDefaultValue(''),
              fakeSearchKey.getOrDefaultValue(''),
            ],
          ),
        );
        when(
          () => storage.putSearchKey(
            searchKeyList: ProductSuggestionHistoryDto.fromDomain(
              ProductSuggestionHistory(searchKeyList: [fakeSearchKey]),
            ),
          ),
        ).thenAnswer((_) => Future.value());
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => remoteDataSource.getSearchedMaterialList(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            eanNumber: '',
            gimmickMaterial: fakeMYSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            offset: fakeOffset,
            pageSize: fakePageSize,
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isCovidSelected: false,
            market: fakeMarket,
          ),
        ).thenAnswer((_) async => fakeMaterialResponse);

        final result = await repository.searchProductList(
          salesOrganization: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          searchKey: fakeSearchKey,
          pageSize: fakePageSize,
          offset: fakeOffset,
          materialFilter: MaterialFilter.empty(),
          user: fakeSalesRepUser,
        );

        expect(result, Right(fakeMaterialResponse));
      });
    });
  });
}
