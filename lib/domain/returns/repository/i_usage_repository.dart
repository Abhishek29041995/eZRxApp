import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';

abstract class IUsageRepository {
  Future<Either<ApiFailure, List<Usage>>> getUsages({
    required SalesOrg salesOrg,
  });
}
