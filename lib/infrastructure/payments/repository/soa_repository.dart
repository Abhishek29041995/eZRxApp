import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/repository/i_soa_repository.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_remote.dart';

class SoaRepository extends ISoaRepository {
  final Config config;
  final SoaLocalDataSource localDataSource;
  final SoaRemoteDataSource remoteDataSource;

  SoaRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<Soa>>> fetchSoa({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final soaResponse = await localDataSource.getSoa();

        return Right(soaResponse);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final soaInput = salesOrg.isMY
          ? '${salesOrg.getOrCrash()}${customerCodeInfo.customerCodeSoldTo}'
          : customerCodeInfo.customerCodeSoldTo;

      final soaResponse =
          await remoteDataSource.getSoa(soaInput, isMarketPlace);
      final dateSortedSoaResponse = soaResponse
        ..sort(
          (a, b) => b.soaData.date.compareTo(a.soaData.date),
        );

      return Right(
        dateSortedSoaResponse,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
