import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

abstract class IPaymentInProgressRepository {
  Future<Either<ApiFailure, StringValue>> getPaymentInProgress({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required bool isMarketPlace,
  });
}
