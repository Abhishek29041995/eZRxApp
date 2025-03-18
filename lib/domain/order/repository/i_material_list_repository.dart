import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

abstract class IMaterialListRepository {
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
  });

  Future<Either<ApiFailure, MaterialResponse>> getComboDealMaterials({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required List<String> principles,
    required SalesOrganisationConfigs salesOrgConfig,
  });

  Future<Either<ApiFailure, MaterialInfo>> getMaterialData({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required String type,
    required Language language,
  });

  Future<Either<ApiFailure, Map<MaterialNumber, MaterialInfo>>> getBundleData({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required Language language,
  });

  Future<Either<ApiFailure, MaterialResponse>> getMaterialBonusList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required PrincipalData principalData,
    required User user,
    required bool enableGimmickMaterial,
    required SearchKey searchKey,
  });
}
