import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_suggestion_history_dto.dart';

class ProductSearchRepository implements IProductSearchRepository {
  final Config config;
final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final ProductSuggestionHistoryStorage productSuggestionHistoryStorage;
  final DeviceStorage deviceStorage;

  ProductSearchRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.productSuggestionHistoryStorage,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, MaterialResponse>> searchProductList({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SearchKey searchKey,
    required int pageSize,
    required int offset,
    required MaterialFilter materialFilter,
    required User user,
  }) async {
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final salesOrg = salesOrganization.salesOrg.getOrCrash();
    final shipToCode = shipToInfo.shipToCustomerCode;
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await materialListLocalDataSource.getProductList();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      await saveSearchHistory(searchKey);

      final materialList = await materialListRemoteDataSource.getSearchedMaterialList(
        customerCode: customerCode,
        salesOrgCode: salesOrg,
        gimmickMaterial: user.role.type.isSalesRepRole
            ? salesOrgConfig.enableGimmickMaterial
            : false,
        language: user.preferredLanguage.languageCode,
        shipToCode: shipToCode,
        searchKey: searchKey.getOrCrash(),
        offset: offset,
        pageSize: pageSize,
        eanNumber: '',
        isCovidSelected: materialFilter.isCovidSelectedFilterValue,
        market: deviceStorage.currentMarket(),
      );

      return Right(materialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ProductSuggestionHistory>> getSearchKeys() async {
    try {
      final response = productSuggestionHistoryStorage.getAllSearchKey();

      return Right(response.toDomain());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> clearSearchHistory() async {
    try {
      await productSuggestionHistoryStorage.clear();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getScanProduct({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Ean eanNumber,
    required SalesOrganisationConfigs salesOrgConfig,
    required User user,
    required MaterialFilter materialFilter,
  }) async {
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final salesOrg = salesOrganization.salesOrg.getOrCrash();
    final shipToCode = shipToInfo.shipToCustomerCode;
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await materialListLocalDataSource.getProductList();

        return Right(productList.products.first);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialList = await materialListRemoteDataSource.getSearchedMaterialList(
        customerCode: customerCode,
        salesOrgCode: salesOrg,
        gimmickMaterial: user.role.type.isSalesRepRole
            ? salesOrgConfig.enableGimmickMaterial
            : false,
        language: user.settings.languagePreference.languageCode,
        shipToCode: shipToCode,
        searchKey: '',
        offset: 0,
        pageSize: 24,
        eanNumber: eanNumber.getOrCrash(),
        isCovidSelected: materialFilter.isCovidSelectedFilterValue,
        market: deviceStorage.currentMarket(),
      );

      if (materialList.products.isEmpty) {
        return const Left(ApiFailure.scannedProductNotFound());
      }

      return Right(materialList.products.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> saveSearchHistory(
    SearchKey searchKey,
  ) async {
    try {
      final getSearchKeyResponse = await getSearchKeys();
      final storedKeys = getSearchKeyResponse.fold(
        (failure) => ProductSuggestionHistory.empty(),
        (success) => success,
      );
      final searchKeyList = ProductSuggestionHistoryDto.fromDomain(storedKeys)
          .getModifiedList(searchKey);

      final updatedObject = ProductSuggestionHistory(
        searchKeyList: searchKeyList.map((e) => SearchKey.search(e)).toList(),
      );
      await productSuggestionHistoryStorage.putSearchKey(
        searchKeyList: ProductSuggestionHistoryDto.fromDomain(updatedObject),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
