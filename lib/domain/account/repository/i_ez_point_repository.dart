import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IEZPointRepository {
  Future<Either<ApiFailure, EZPointToken>> getEZPointToken({
    required CustomerCodeInfo customerCodeInfo,
  });
}
