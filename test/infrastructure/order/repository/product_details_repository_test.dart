import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class ProductDetailLocalDataSourceMock extends Mock
    implements ProductDetailLocalDataSource {}

class ProductDetailRemoteDataSourceMock extends Mock
    implements ProductDetailRemoteDataSource {}

class MaterialListLocalDataSourceMock extends Mock
    implements MaterialListLocalDataSource {}

class MaterialListRemoteDataSourceMock extends Mock
    implements MaterialListRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailRepository;
  late Config mockConfig;
  late ProductDetailLocalDataSource productDetailLocalDataSource;
  late ProductDetailRemoteDataSource productDetailRemoteDataSource;
  late MaterialListLocalDataSource materialListLocalDataSource;
  late MaterialListRemoteDataSource materialListRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;
  late MaterialInfo fakeMaterialInfo;
  late ProductMetaData fakeProductMetaData;
  late DeviceStorage deviceStorage;

  final mockMaterialNumber = MaterialNumber('12345');
  final mockLanguage = Language.english();
  final mockPrincipalCode = PrincipalCode('fake_principalCode');
  final mockMaterialInfoTypeBundle = MaterialInfoType.bundle();
  final mockMaterialInfoTypeMaterial = MaterialInfoType.material();
  const mockMarket = 'fake-market';

  setUpAll(() async {
    mockConfig = MockConfig();
    productDetailLocalDataSource = ProductDetailLocalDataSourceMock();
    productDetailRemoteDataSource = ProductDetailRemoteDataSourceMock();
    materialListLocalDataSource = MaterialListLocalDataSourceMock();
    materialListRemoteDataSource = MaterialListRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    deviceStorage = DeviceStorageMock();
    fakeMaterialInfo = await ProductDetailLocalDataSource().getProductDetails();
    fakeProductMetaData =
        await ProductDetailLocalDataSource().getItemProductMetaData();

    productDetailRepository = ProductDetailRepository(
      config: mockConfig,
      materialListLocalDataSource: materialListLocalDataSource,
      materialListRemoteDataSource: materialListRemoteDataSource,
      productDetailLocalDataSource: productDetailLocalDataSource,
      productDetailRemoteDataSource: productDetailRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      deviceStorage: deviceStorage,
    );
  });

  group('ProductDetailRepository should - ', () {
    group('get ProductDetail (for type material)- ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => productDetailRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            materialNumber: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            market: mockMarket,
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => productDetailRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            materialNumber: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            market: mockMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });
    group('get ProductDetail (for type bundle)- ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
            market: mockMarket,
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
            market: mockMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('get ProductListDetail - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeMaterial.getValue(),
            market: mockMarket,
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeMaterial.getValue(),
            market: mockMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        if (result.isRight()) {
          result.fold((l) => {}, (r) {
            expect(
              r.length,
              0,
            );
          });
        }
      });
    });

    group('get getBundleListDetail - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.entries.first.value,
          fakeMaterialInfo,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
            market: mockMarket,
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.entries.first.value,
          fakeMaterialInfo,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          {},
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLanguage.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
            market: mockMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          {},
        );
      });
    });

    group('get SimilarProduct - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getSimilarProduct(),
        ).thenAnswer((invocation) async => [fakeMaterialInfo]);

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getSimilarProduct(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);
        final materialList = [fakeMaterialInfo];
        when(
          () => productDetailRemoteDataSource.getSimilarProduct(
            materialNumber: mockMaterialNumber.getOrCrash(),
            language: mockLanguage.languageCode,
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            principalCode: mockPrincipalCode.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            market: mockMarket,
          ),
        ).thenAnswer((invocation) async => materialList);

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(materialList));
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(() => deviceStorage.currentMarket()).thenReturn(mockMarket);

        when(
          () => productDetailRemoteDataSource.getSimilarProduct(
            materialNumber: mockMaterialNumber.getOrCrash(),
            language: mockLanguage.languageCode,
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            principalCode: mockPrincipalCode.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            market: mockMarket,
          ),
        ).thenThrow(Exception('fake-error'));

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          language: mockLanguage,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(Exception('fake-error'))),
        );
      });
    });

    group('get ItemProductMetaData - ', () {
      test('successfully - local (when response is not empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenAnswer((invocation) async => fakeProductMetaData);

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('successfully - local (when response is empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenAnswer(
          (invocation) async =>
              fakeProductMetaData.copyWith(items: [], productImages: []),
        );

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote (when response is not empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getProductsMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer((invocation) async => fakeProductMetaData);

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote (when response is empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getProductsMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer(
          (invocation) async =>
              fakeProductMetaData.copyWith(items: [], productImages: []),
        );

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getProductsMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductsMetaData(
          materialNumbers: [fakeMaterialInfo.materialNumber],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });
  });
}
