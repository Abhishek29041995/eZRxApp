import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_bundle_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';

class MaterialBundleListRepository implements IMaterialBundleListRepository {
  final Config config;
  final MaterialBundleListLocalDatasource materialBundleListLocalDatasource;
  final MaterialBundleListRemoteDataSource materialBundleListRemoteDatasource;

  MaterialBundleListRepository({
    required this.config,
    required this.materialBundleListLocalDatasource,
    required this.materialBundleListRemoteDatasource,
  });

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialBundleList({
    required User user,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialBundleListData = user.role.type.isSalesRepRole
            ? await materialBundleListLocalDatasource
                .getMaterialBundleListForSalesRep()
            : await materialBundleListLocalDatasource.getMaterialBundleList();

        return Right(materialBundleListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final bundleInfo = user.role.type.isSalesRepRole
          ? await materialBundleListRemoteDatasource
              .getMaterialBundleListForSalesRep(
              userName: user.username.getOrCrash(),
              customerCode: customerCode.customerCodeSoldTo,
              shipToCode: shipToCode.shipToCustomerCode,
              salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
            )
          : await materialBundleListRemoteDatasource.getMaterialBundleList(
              customerCode: customerCode.customerCodeSoldTo,
              salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
            );

      return Right(bundleInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
