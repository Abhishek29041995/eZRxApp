import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';

abstract class IClaimManagementRepository {
  Future<Either<ApiFailure, List<ClaimItem>>> getClaimSubmissions({
    required EmailAddress email,
  });

  Future<Either<ApiFailure, List<PrincipalData>>> getPrincipalForSalesOrg({
    required SalesOrganisation salesOrganisation,
  });

  Future<Either<ApiFailure, bool>> submitClaim({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required ClaimSubmission data,
  });
}
