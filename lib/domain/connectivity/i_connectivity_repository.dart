import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IConnectivityRepository {
  Future<Either<ApiFailure, Unit>> initializeConnectivity();

  Stream<bool> watchNetworkAvailability();
}
