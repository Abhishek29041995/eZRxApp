import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAupTcRepository {
  Future<Either<ApiFailure, TncDate>> getTncDate();
}
