import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/account/repository/i_ez_point_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_remote.dart';

class EZPointRepository implements IEZPointRepository {
  final Config config;
  final EZPointRemoteDataSource remoteDataSource;
  final EZPointLocalDataSource localDataSource;

  EZPointRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, EZPointToken>> getEZPointToken({
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ezPointToken = await localDataSource.getEZPointToken();

        return Right(ezPointToken);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final ezPointToken = await remoteDataSource.getEZPointToken(
        customerCode: customerCode,
      );

      return Right(ezPointToken);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
