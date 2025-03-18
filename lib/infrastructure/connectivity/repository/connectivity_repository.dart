import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/connectivity/i_connectivity_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/core/connectivity/connectivity_service.dart';

class ConnectivityRepository implements IConnectivityRepository {
  final ConnectivityService connectivityService;

  ConnectivityRepository({
    required this.connectivityService,
  });

  @override
  Stream<bool> watchNetworkAvailability() => connectivityService.getStream;

  @override
  Future<Either<ApiFailure, Unit>> initializeConnectivity() async {
    try {
      connectivityService.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
