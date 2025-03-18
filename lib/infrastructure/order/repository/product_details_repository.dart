import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';

class ProductDetailRepository implements IProductDetailRepository {
  final Config config;
  final ProductDetailLocalDataSource productDetailLocalDataSource;
  final ProductDetailRemoteDataSource productDetailRemoteDataSource;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final DeviceStorage deviceStorage;

  ProductDetailRepository({
    required this.config,
    required this.productDetailLocalDataSource,
    required this.productDetailRemoteDataSource,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, MaterialInfo>> getProductDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  }) async =>
      type.typeBundle
          ? await getBundleDetail(
              customerCodeInfo: customerCodeInfo,
              language: language,
              materialNumber: materialNumber,
              salesOrganisation: salesOrganisation,
              shipToInfo: shipToInfo,
              type: type,
            )
          : await getMaterialDetail(
              customerCodeInfo: customerCodeInfo,
              language: language,
              materialNumber: materialNumber,
              salesOrganisation: salesOrganisation,
              shipToInfo: shipToInfo,
              type: type,
            );

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getProductListDetail({
    required List<MaterialNumber> materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required List<MaterialInfoType> types,
  }) async {
    final materialInfoList = <MaterialInfo>[];
    for (var i = 0; i < types.length; i++) {
      final productList = await getProductDetail(
        materialNumber: materialNumber[i],
        salesOrganisation: salesOrganisation,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        language: language,
        type: types[i],
      );

      productList.fold((l) => {}, (r) => materialInfoList.add(r));
    }

    return Right(
      materialInfoList,
    );
  }

  @override
  Future<Map<MaterialNumber, MaterialInfo>> getBundleListDetail({
    required List<MaterialNumber> bundleCodes,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  }) async {
    final bundleInfoMap = <MaterialNumber, MaterialInfo>{};
    await Future.wait(
      bundleCodes.map(
        (code) async {
          final bundleProductDetail = await getBundleDetail(
            language: language,
            materialNumber: code,
            shipToInfo: shipToInfo,
            type: MaterialInfoType.bundle(),
            customerCodeInfo: customerCodeInfo,
            salesOrganisation: salesOrganisation,
          );
          bundleProductDetail.fold(
            (l) {},
            (r) => bundleInfoMap[code] = r,
          );
        },
      ),
    );

    return bundleInfoMap;
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getMaterialDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productDetail =
            await productDetailLocalDataSource.getProductDetails();

        return Right(productDetail);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final productDetail =
          await productDetailRemoteDataSource.getProductDetails(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        language: language.languageCode.toUpperCase(),
        materialNumber: materialNumber.getOrCrash(),
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        market: deviceStorage.currentMarket(),
      );

      return Right(productDetail.copyWith(type: type));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getBundleDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialInfo =
            await materialListLocalDataSource.getProductDetails();

        return Right(materialInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final materialData =
            await materialListRemoteDataSource.getProductDetails(
          code: materialNumber.getOrCrash(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          customerCode: customerCodeInfo.customerCodeSoldTo,
          shipToCode: shipToInfo.shipToCustomerCode,
          type: type.getValue(),
          language: language.languageCode,
          market: deviceStorage.currentMarket(),
        );

        return Right(
          materialData.copyWith(
            bundle: materialData.bundle.copyWith(
              materials:
                  materialData.data.map((e) => e.toMaterialInfo).toList(),
            ),
          ),
        );
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getSimilarProduct({
    required MaterialNumber materialNumber,
    required PrincipalCode principalCode,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final products = await productDetailLocalDataSource.getSimilarProduct();

        return Right(products);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final products = await productDetailRemoteDataSource.getSimilarProduct(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        language: language.languageCode,
        materialNumber: materialNumber.getOrCrash(),
        principalCode: principalCode.getOrCrash(),
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        market: deviceStorage.currentMarket(),
      );

      return Right(products);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ProductMetaData>> getProductsMetaData({
    required List<MaterialNumber> materialNumbers,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response =
            await productDetailLocalDataSource.getItemProductMetaData();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await productDetailRemoteDataSource.getProductsMetaData(
        materialIDs: materialNumbers.map((e) => e.getOrCrash()).toList(),
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
