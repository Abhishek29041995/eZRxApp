import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ISalesOrgRepository {
  Future<Either<ApiFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(SalesOrganisation salesOrganisation);

  Future<Either<ApiFailure, Unit>> storeSalesOrg({
    required String salesOrg,
  });

  Future<Either<ApiFailure, Unit>> initSalesOrgStorage();

  Future<Either<ApiFailure, AccountSelector>> getSalesOrg();

  Future<Either<ApiFailure, Unit>> deleteSalesOrg();
}
