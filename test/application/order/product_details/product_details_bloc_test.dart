import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class FavouriteRepositoryMock extends Mock implements FavouriteRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailMockRepository;
  late FavouriteRepository favouriteMockRepository;
  late MaterialInfo mockMaterialInfo;
  late StockInfo mockStockInfo;
  late List<MaterialStockInfo> mockMaterialStockInfo;
  late ProductMetaData mockProductMetaData;
  late List<MaterialInfo> mockSimilarProducts;
  late List<MaterialInfo> finalSimilarProduct;
  late List<MaterialInfo> mockMaterialInfoWithBundleStockInfo;
  late List<MaterialInfo> fakeMaterialInfoWithBundleStockInfo;
  late MaterialResponse fakeMaterialInfoList;
  late MaterialInfo fakeMaterialInfo;
  late MaterialInfo fakeMaterialInfoWithBundleMaterial;
  final language = Language.english();
  late StockInfoRepository stockInfoRepositoryMock;

  final materialInfoType = MaterialInfoType('material');
  final bundleInfoType = MaterialInfoType('bundle');
  final productImage = ProductImages.empty().copyWith(
    image: [
      'https://ezrxdev.blob.core.windows.net/assets/21041773/21041773.png',
    ],
  );
  final mockInitialState = ProductDetailState.initial().copyWith(
    customerCodeInfo: fakeCustomerCodeInfo,
    salesOrganisation: fakeMYSalesOrganisation,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
    user: fakeUserWithLanguageCode,
  );

  setUpAll(() async {
    productDetailMockRepository = ProductDetailRepositoryMock();
    favouriteMockRepository = FavouriteRepositoryMock();
    stockInfoRepositoryMock = StockInfoRepositoryMock();
    mockMaterialInfo = await ProductDetailLocalDataSource().getProductDetails();
    mockStockInfo = (await StockInfoLocalDataSource().getStockInfoList()).first;
    fakeMaterialInfoList = await MaterialListLocalDataSource().getProductList();
    fakeMaterialInfo = fakeMaterialInfoList.products
        .where(
          (element) => element.data.isNotEmpty,
        )
        .first;
    fakeMaterialInfoWithBundleMaterial = fakeMaterialInfo.copyWith(
      bundle: fakeMaterialInfo.bundle.copyWith(
        materials: fakeMaterialInfo.data.map((e) => e.toMaterialInfo).toList(),
      ),
    );
    mockMaterialStockInfo =
        await StockInfoLocalDataSource().getMaterialStockInfoList();
    mockMaterialInfoWithBundleStockInfo =
        List<MaterialInfo>.from(mockMaterialInfo.bundle.materials)
            .map((material) {
      final stock = mockMaterialStockInfo.firstWhere(
        (element) => element.materialNumber == material.materialNumber,
        orElse: () => MaterialStockInfo.empty(),
      );

      return material.copyWithStock(stockInfos: stock.stockInfos);
    }).toList();
    fakeMaterialInfoWithBundleStockInfo = List<MaterialInfo>.from(
      fakeMaterialInfoWithBundleMaterial.bundle.materials,
    ).map((material) {
      final stock = mockMaterialStockInfo.firstWhere(
        (element) => element.materialNumber == material.materialNumber,
        orElse: () => MaterialStockInfo.empty(),
      );

      return material.copyWithStock(stockInfos: stock.stockInfos);
    }).toList();
    mockProductMetaData =
        await ProductDetailLocalDataSource().getItemProductMetaData();
    mockSimilarProducts =
        await ProductDetailLocalDataSource().getSimilarProduct();
  });

  group(
    'Product Details Bloc Test',
    () {
      blocTest<ProductDetailBloc, ProductDetailState>(
        'Product Detail Initialized',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              language: fakeUserWithLanguageCode.preferredLanguage,
              materialNumber: mockMaterialInfo.materialNumber,
              type: mockMaterialInfo.type,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) => bloc.add(
          ProductDetailEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeUserWithLanguageCode,
            materialInfo: mockMaterialInfo,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeUserWithLanguageCode,
            isDetailFetching: true,
          ),
          ProductDetailState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeUserWithLanguageCode,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Product Detail Success for material type',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              language: language,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          ).thenAnswer(
            (invocation) async => Right(mockMaterialInfo),
          );
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materials:
                  mockSimilarProducts.map((e) => e.materialNumber).toList(),
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            ),
          ).thenAnswer((invocation) async => Right(mockMaterialStockInfo));
          when(
            () => stockInfoRepositoryMock.getStockInfo(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materialNumber: mockMaterialInfo.materialNumber,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            ),
          ).thenAnswer(
            (invocation) async => Right(mockStockInfo),
          );
          when(
            () => productDetailMockRepository.getProductsMetaData(
              materialNumbers: [mockMaterialInfo.materialNumber],
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockProductMetaData,
            ),
          );
          when(
            () => productDetailMockRepository.getSimilarProduct(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              language: language,
            ),
          ).thenAnswer((invocation) async => Right(mockSimilarProducts));
          finalSimilarProduct = mockSimilarProducts.map(
            (materialInfo) {
              final materialStockInfo = mockMaterialStockInfo.firstWhere(
                (MaterialStockInfo materialStockInfo) =>
                    materialStockInfo.materialNumber ==
                    materialInfo.materialNumber,
                orElse: () => MaterialStockInfo.empty(),
              );

              return materialInfo.copyWithStock(
                stockInfos: materialStockInfo.stockInfos,
              );
            },
          ).toList();
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetch(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              user: fakeUserWithLanguageCode,
              materialInfo: mockMaterialInfo.copyWith(
                type: materialInfoType,
              ),
            ),
          );
        },
        seed: () => mockInitialState,
        expect: () => [
          mockInitialState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeUserWithLanguageCode,
            isDetailFetching: true,
          ),
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption: optionOf(Right(mockMaterialInfo)),
          ),
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          mockInitialState.copyWith(
            isRelatedProductsFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          mockInitialState.copyWith(
            isMetadataFetching: true,
            isRelatedProductsFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          mockInitialState.copyWith(
            isRelatedProductsFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              stockInfo: mockStockInfo,
              productItem: mockProductMetaData.items.isNotEmpty
                  ? mockProductMetaData.items.first
                  : ProductItem.empty(),
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              stockInfo: mockStockInfo,
              productItem: mockProductMetaData.items.isNotEmpty
                  ? mockProductMetaData.items.first
                  : ProductItem.empty(),
              similarProduct: finalSimilarProduct,
            ),
            failureOrSuccessOption: optionOf(Right(mockSimilarProducts)),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Product Detail Success for bundle type',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              language: language,
              materialNumber: mockMaterialInfo.materialNumber,
              type: bundleInfoType,
            ),
          ).thenAnswer(
            (invocation) async => Right(mockMaterialInfo),
          );
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materials: mockMaterialInfo.bundle.materials
                  .map((e) => e.materialNumber)
                  .toList(),
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer((invocation) async => Right(mockMaterialStockInfo));
          when(
            () => productDetailMockRepository.getProductsMetaData(
              materialNumbers: [mockMaterialInfo.materialNumber],
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockProductMetaData,
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetch(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              user: fakeUserWithLanguageCode,
              materialInfo: mockMaterialInfo.copyWith(
                type: bundleInfoType,
              ),
            ),
          );
        },
        seed: () => mockInitialState,
        expect: () => [
          mockInitialState.copyWith(
            isDetailFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
          ),
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption: optionOf(Right(mockMaterialInfo)),
          ),
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                bundle: mockMaterialInfo.bundle.copyWith(
                  materials: mockMaterialInfoWithBundleStockInfo,
                ),
              ),
            ),
          ),
          mockInitialState.copyWith(
            isMetadataFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                bundle: mockMaterialInfo.bundle.copyWith(
                  materials: mockMaterialInfoWithBundleStockInfo,
                ),
              ),
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                bundle: mockMaterialInfo.bundle.copyWith(
                  materials: mockMaterialInfoWithBundleStockInfo,
                ),
                productImages: mockProductMetaData.productImages.isNotEmpty
                    ? mockProductMetaData.productImages.first
                    : ProductImages.empty(),
              ),
              productItem: mockProductMetaData.items.isNotEmpty
                  ? mockProductMetaData.items.first
                  : ProductItem.empty(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Product Detail failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              language: language,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetch(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              user: fakeUserWithLanguageCode,
              materialInfo: mockMaterialInfo.copyWith(
                type: materialInfoType,
              ),
            ),
          );
        },
        seed: () => mockInitialState,
        expect: () => [
          mockInitialState.copyWith(
            isDetailFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
          ),
          mockInitialState.copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed To Fetch Stock Info',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfo(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materialNumber: mockMaterialInfo.materialNumber,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchStock(
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Stock Info List for bundles success',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materials: fakeMaterialInfoWithBundleMaterial.bundle.materials
                  .map((e) => e.materialNumber)
                  .toList(),
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(mockMaterialStockInfo),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchStockForBundle(
              materials: fakeMaterialInfoWithBundleMaterial.bundle.materials,
            ),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: fakeMaterialInfoWithBundleMaterial,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: fakeMaterialInfoWithBundleMaterial,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: fakeMaterialInfoWithBundleMaterial.copyWith(
                bundle: fakeMaterialInfoWithBundleMaterial.bundle.copyWith(
                  materials: fakeMaterialInfoWithBundleStockInfo,
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed To Fetch Stock Info List for bundles',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materials: mockMaterialInfo.bundle.materials
                  .map((e) => e.materialNumber)
                  .toList(),
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchStockForBundle(
              materials: mockMaterialInfo.bundle.materials,
            ),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Stock Info List for bundles but get empty stock',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              materials:
                  [mockMaterialInfo].map((e) => e.materialNumber).toList(),
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchStockForBundle(
              materials: [mockMaterialInfo],
            ),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isStockFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                bundle: mockMaterialInfo.bundle
                    .copyWith(materials: [mockMaterialInfo]),
              ),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed to Fetch Meta Data',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductsMetaData(
              materialNumbers: [mockMaterialInfo.materialNumber],
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchMetaData(),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
            stockInfo: mockStockInfo,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isMetadataFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch empty Meta Data',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductsMetaData(
              materialNumbers: [mockMaterialInfo.materialNumber],
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          ).thenAnswer(
            (invocation) async => Right(ProductMetaData.empty()),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchMetaData(),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
            stockInfo: mockStockInfo,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isMetadataFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: ProductImages.empty(),
              ),
              productItem: ProductItem.empty(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed To Fetch Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getSimilarProduct(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              language: language,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchSimilarProduct(),
          );
        },
        seed: () => mockInitialState.copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
          ),
        ),
        expect: () => [
          mockInitialState.copyWith(
            isRelatedProductsFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
          ),
          mockInitialState.copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Product Details Change Image',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.changeImage(2),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            selectedImageIndex: 2,
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Success Not For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: true,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Success For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: mockSimilarProducts,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: true,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Success Not For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockMaterialInfo.copyWith(
                  isFavourite: false,
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              isFavourite: true,
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Success For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: false)
                        : e,
                  )
                  .toList(),
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: true,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts
                .map(
                  (e) => e.materialNumber == mockMaterialInfo.materialNumber
                      ? e.copyWith(isFavourite: true)
                      : e,
                )
                .toList(),
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: false)
                        : e,
                  )
                  .toList(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                ),
              ],
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              isFavourite: true,
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: true,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('Fake-Error')),
            ),
          ),
        ],
      );

      test(
        'Check SelectedImage value for Product Details Bloc If Product Image Is Empty',
        () {
          final productDetailState = ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          );
          final selectedImage = productDetailState.selectedImage;
          expect(selectedImage, StringValue(''));
        },
      );

      test(
        'Check SelectedImage value for Product Details Bloc If Product Image Is Not Empty',
        () {
          final productDetailState = ProductDetailState.initial().copyWith(
            selectedImageIndex: 0,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo:
                  mockMaterialInfo.copyWith(productImages: productImage),
            ),
          );
          final selectedIndex = productDetailState.selectedImageIndex;
          final images =
              productDetailState.productDetailAggregate.materialInfo.images;
          final matcher = StringValue(images.elementAt(selectedIndex));
          final selectedImage = productDetailState.selectedImage;
          expect(selectedImage, matcher);
        },
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Item Quantity For Zdp5 Discount',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        act: (ProductDetailBloc bloc) {
          bloc.add(
            const ProductDetailEvent.fetchItemQuantityForZdp5Discount(
              quantity: 10,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo.copyWith(),
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo.copyWith(
                quantity: MaterialQty(10),
              ),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Set Exceeded Qty',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        act: (ProductDetailBloc bloc) {
          bloc.add(
            const ProductDetailEvent.setExceedQty(
              exceedQty: true,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo.copyWith(),
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              exeedQty: true,
              materialInfo: mockMaterialInfo.copyWith(),
            ),
          ),
        ],
      );

      test('displayBatchNumber getter', () {
        // Display NA when is MP material
        expect(
          ProductDetailState.initial()
              .copyWith
              .productDetailAggregate(
                materialInfo: mockMaterialInfo,
                stockInfo: mockStockInfo,
              )
              .displayBatchNumber,
          'NA',
        );

        //Display number when is ZP material
        expect(
          ProductDetailState.initial()
              .copyWith
              .productDetailAggregate(
                materialInfo: mockMaterialInfo.copyWith(isMarketPlace: false),
                stockInfo: mockStockInfo,
              )
              .displayBatchNumber,
          '199019',
        );
      });

      test('displayExpiryDate getter', () {
        final zpMaterialInfo = mockMaterialInfo.copyWith(isMarketPlace: false);
        // Display NA when is MP material
        expect(
          ProductDetailState.initial()
              .copyWith
              .productDetailAggregate(
                materialInfo: mockMaterialInfo,
                stockInfo: mockStockInfo,
              )
              .displayExpiryDate,
          'NA',
        );

        //Display NA when market is PH MDI (2501) and the product is not an Abbot material
        expect(
          ProductDetailState.initial()
              .copyWith(
                salesOrganisation: fakePhMDISalesOrganisation,
                productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                  materialInfo: mockMaterialInfo,
                  stockInfo: mockStockInfo,
                ),
              )
              .displayExpiryDate,
          'NA',
        );

        //Display date NA when market is PH MDI (2501) and the product is an Abbot material
        expect(
          ProductDetailState.initial()
              .copyWith(
                salesOrganisation: fakePhMDISalesOrganisation,
                productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                  materialInfo: zpMaterialInfo.copyWith
                      .principalData(principalCode: PrincipalCode('107381')),
                  stockInfo: mockStockInfo,
                ),
              )
              .displayExpiryDate,
          '31 Jul 2023',
        );

        //Display date when is normal ZP material
        expect(
          ProductDetailState.initial()
              .copyWith
              .productDetailAggregate(
                materialInfo: zpMaterialInfo,
                stockInfo: mockStockInfo,
              )
              .displayExpiryDate,
          '31 Jul 2023',
        );
      });

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Update Qty',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
          stockInfoRepository: stockInfoRepositoryMock,
        ),
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.updateQty(
              qty: 10,
            ),
          );
        },
        seed: () => ProductDetailState.initial(),
        expect: () => [
          ProductDetailState.initial().copyWith(
            inputQty: 10,
          ),
        ],
      );

      test('displayOOSPreorderTag getter', () {
        final state =
            ProductDetailState.initial().copyWith(isStockFetching: false);
        expect(state.displayOOSPreorderTag(false), true);
      });

      test('showTierPrice getter', () {
        final state = ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              hidePrice: true,
            ),
          ),
        );
        expect(state.showTierPrice(isMYExternalSalesRepUser: false), true);
      });

      test('displayOffers getter', () {
        final state = ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              hidePrice: true,
              principalData: PrincipalData.empty()
                  .copyWith(principalCode: PrincipalCode('105307')),
            ),
          ),
        );
        expect(
          state.displayOffers(
            isMYExternalSalesRepUser: true,
            bonusMaterialList: [BonusMaterial.empty()],
          ),
          true,
        );
      });

      test('eligibleForStockError getter', () {
        final state = ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: StockInfo.empty().copyWith(stockQuantity: 1),
          ),
          inputQty: 2,
        );
        expect(
          state.eligibleForStockError,
          true,
        );
      });

      test('showRelatedItemsLoading getter', () {
        final state = ProductDetailState.initial().copyWith(
          isRelatedProductsFetching: true,
        );
        expect(
          state.showRelatedItemsLoading,
          true,
        );
      });

      test('showRelatedItemsSection getter', () {
        final state = ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            similarProduct: [MaterialInfo.empty()],
          ),
        );
        expect(
          state.showRelatedItemsSection,
          true,
        );
      });
    },
  );
}
