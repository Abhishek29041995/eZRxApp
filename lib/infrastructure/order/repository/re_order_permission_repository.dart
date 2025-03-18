import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/repository/i_re_order_permission_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_remote.dart';

class ReOrderPermissionRepository implements IReOrderPermissionRepository {
  final Config config;
  final ReOrderPermissionLocalDataSource localDataSource;
  final ReOrderPermissionRemoteDataSource remoteDataSource;

  ReOrderPermissionRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<ValidMaterial>>> getReorderPermission({
    required SalesOrganisation salesOrganisation,
    required List<MaterialNumber> materialNumbers,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final reOrderPermission = await localDataSource.getPermission();

        return Right(reOrderPermission.validMaterials);
      }

      final reOrderPermission = await remoteDataSource.getPermission(
        materialNumbers:
            materialNumbers.map((e) => e.getValue()).toSet().toList(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        salesOrg: salesOrganisation.salesOrg.getValue(),
        isSalesRepUser: user.role.type.isSalesRepRole,
        isEnableGimmickMaterial: salesOrganisationConfigs.enableGimmickMaterial,
        userName: user.username.getValue(),
      );
      final validMaterialNumberMap = {
        for (final e in reOrderPermission.validMaterials) e.materialNumber: e,
      };
      final validMaterials = materialNumbers
          .map(
            (e) =>
                validMaterialNumberMap[e] ??
                ValidMaterial.empty().copyWith(materialNumber: e),
          )
          .toList();

      return validMaterials.every((e) => !e.isValid)
          ? const Left(ApiFailure.allReorderItemInvalid())
          : Right(validMaterials);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, ValidMaterial>> getReorderItemPermission({
    required SalesOrganisation salesOrganisation,
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final reOrderPermission = await localDataSource.getPermission();

        return Right(reOrderPermission.validMaterials.first);
      }

      final reOrderPermission = await remoteDataSource.getPermission(
        materialNumbers: [materialNumber.getValue()],
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        salesOrg: salesOrganisation.salesOrg.getValue(),
        isSalesRepUser: user.role.type.isSalesRepRole,
        isEnableGimmickMaterial: salesOrganisationConfigs.enableGimmickMaterial,
        userName: user.username.getValue(),
      );
      final validMaterial = reOrderPermission.validMaterials.firstOrNull ??
          ValidMaterial.empty().copyWith(materialNumber: materialNumber);

      return validMaterial.isValid
          ? Right(validMaterial)
          : Left(ApiFailure.reorderItemInvalid(materialNumber.displayMatNo));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
