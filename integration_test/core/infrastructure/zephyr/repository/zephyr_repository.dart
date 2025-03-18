import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import '../../infra_core/zephyr_service/zephyr_service.dart';
import '../datasource/zephyr_remote.dart';

class ZephyrRepository {
  final ZephyrRemoteDataSource remoteDataSource;
  final ZephyrService zephyrService;

  ZephyrRepository({
    required this.remoteDataSource,
    required this.zephyrService,
  });

  Future<Either<ApiFailure, void>> zephyrUpdate({
    required CycleKeyId id,
  }) async {
    try {
      zephyrService.getTestCases;
      final zephyrUpdate = await remoteDataSource.update(
        id: id,
        testCycleKey: zephyrService.getCycleID(id),
        testCase: zephyrService.getTestCases,
      );

      return Right(zephyrUpdate);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
