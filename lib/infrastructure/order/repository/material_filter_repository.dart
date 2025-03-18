import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_filter_material_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';

class MaterialFilterRepository implements IMaterialFilterRepository {
  final Config config;
  final MaterialFilterRemoteDataSource filterMaterialRemoteDataSource;
  final MaterialFilterLocalDataSource filterMaterialLocalDataSource;

  MaterialFilterRepository({
    required this.filterMaterialLocalDataSource,
    required this.config,
    required this.filterMaterialRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, MaterialFilter>> getMaterialFilterList({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final filterMaterialData =
            await filterMaterialLocalDataSource.getFilters();

        return Right(filterMaterialData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final filterMaterialData =
          await filterMaterialRemoteDataSource.getFilters(
        salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
        shipToCustomerCode: shipToInfo.shipToCustomerCode,
        soldToCustomerCode: customerCodeInfo.customerCodeSoldTo,
        language: user.preferredLanguage.languageCode,
        searchKey: searchKey,
      );

      return Right(filterMaterialData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
