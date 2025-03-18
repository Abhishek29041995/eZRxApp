import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ICustomerLicenseRepository {
  Future<Either<ApiFailure, List<CustomerLicense>>> getCustomerLicense({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCode,
    required int offset,
    required User user,
    required int pageSize,
  });
}
