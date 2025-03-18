import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final DeviceStorage deviceStorage;

  MaterialListRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, MaterialResponse>> getMaterialList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required MaterialFilter selectedMaterialFilter,
    required User user,
    required SearchKey searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData =
            await materialListLocalDataSource.getProductList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final sortValue = selectedMaterialFilter.sortBy;
      final materialListData =
          await materialListRemoteDataSource.getProductList(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pageSize: pageSize,
        language: user.preferredLanguage.languageCode,
        isFavourite: selectedMaterialFilter.isFavourite,
        isCovidSelected: selectedMaterialFilter.isCovidSelectedFilterValue,
        type: selectedMaterialFilter.type,
        isProductOffer: selectedMaterialFilter.isProductOffer,
        principalCode: '',
        offset: offset,
        orderByName: sortValue.isAlphabetSort ? sortValue.valueRequest : '',
        orderByPrice: sortValue.isPriceSort ? sortValue.valueRequest : '',
        manufactureList: selectedMaterialFilter.manufactureListSelected,
        countryListCode: selectedMaterialFilter.countryListSelected
            .map((e) => e.code)
            .toList(),
        searchKey: searchKey.searchValueOrEmpty,
        salesDeal: customerCodeInfo.salesDeals
            .map((e) => e.getOrDefaultValue(''))
            .toList(),
        isComboOffers: selectedMaterialFilter.comboOffers,
        showSampleItem: false,
        market: deviceStorage.currentMarket(),
        isMarketPlace: selectedMaterialFilter.isMarketPlace,
        isTender: selectedMaterialFilter.isTender,
        isPoisonMaterial: selectedMaterialFilter.isPoison,
        isSampleMaterial: selectedMaterialFilter.isSample,
        isGimmickMaterial: selectedMaterialFilter.isGimmick,
      );

      final bundleData = await getBundleData(
        customerCodeInfo: customerCodeInfo,
        materials: materialListData.products,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
        language: user.preferredLanguage,
      );

      return Right(
        materialListData.copyWith(
          products: materialListData.products
              .map(
                (e) => bundleData.getOrElse(() => {}).putIfAbsent(
                      e.materialNumber,
                      () => e,
                    ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialResponse>> getComboDealMaterials({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required List<String> principles,
    required SalesOrganisationConfigs salesOrgConfig,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = await materialListLocalDataSource
            .getProductList(isComboDealMaterials: true);

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData =
          await materialListRemoteDataSource.getComboDealMaterialsPrincipalCode(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pageSize: pageSize,
        offset: offset,
        principalCodeList: principles,
        language: user.preferredLanguage.languageCode,
        market: deviceStorage.currentMarket(),
      );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, MaterialInfo>>> getBundleData({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required Language language,
  }) async {
    try {
      final materialInfoMap = <MaterialNumber, MaterialInfo>{};
      final bundles =
          materials.where((e) => e.listingDataNotAvailable).toList();

      for (final bundle in bundles) {
        final materialInfo = await getMaterialData(
          customerCodeInfo: customerCodeInfo,
          material: bundle,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
          type: 'bundle',
          language: language,
        );
        materialInfoMap.addAll(
          {bundle.materialNumber: materialInfo.getOrElse(() => bundle)},
        );
      }

      return right(materialInfoMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getMaterialData({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required String type,
    required Language language,
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
          code: material.materialNumber.getOrCrash(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          customerCode: customerCodeInfo.customerCodeSoldTo,
          shipToCode: shipToInfo.shipToCustomerCode,
          type: type,
          language: language.languageCode,
          market: deviceStorage.currentMarket(),
        );

        return Right(materialData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, MaterialResponse>> getMaterialBonusList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required PrincipalData principalData,
    required bool enableGimmickMaterial,
    required User user,
    required SearchKey searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData =
            await materialListLocalDataSource.getProductList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData =
          await materialListRemoteDataSource.getProductList(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pageSize: pageSize,
        language: user.settings.languagePreference.languageCode,
        type: '',
        countryListCode: [],
        isFavourite: false,
        isCovidSelected: false,
        isProductOffer: false,
        manufactureList: [principalData.principalName.getOrCrash()],
        offset: offset,
        orderByName: 'asc',
        orderByPrice: '',
        principalCode: principalData.principalCode.getOrCrash(),
        searchKey: searchKey.getOrCrash(),
        salesDeal: [],
        isComboOffers: false,
        showSampleItem: true,
        market: deviceStorage.currentMarket(),
        isMarketPlace: false,
        isTender: false,
        isSampleMaterial: false,
        isPoisonMaterial: false,
        isGimmickMaterial: false,
      );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
