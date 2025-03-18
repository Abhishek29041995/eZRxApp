import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_license.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_remote.dart';

class CustomerLicenseRepository implements ICustomerLicenseRepository {
  final Config config;
  final CustomerLicenseRemoteDataSource remoteDataSource;
  final CustomerLicenseLocalDataSource localDataSource;

  CustomerLicenseRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<CustomerLicense>>> getCustomerLicense({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCode,
    required User user,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final customerLicense = await localDataSource.getCustomerLicense();

        return Right(customerLicense);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final customerLicense = await remoteDataSource.getCustomerLicense(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCode.customerCodeSoldTo,
        language: user.preferredLanguage.languageCode,
        offset: offset,
        pageSize: pageSize,
      );

      return Right(customerLicense);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
