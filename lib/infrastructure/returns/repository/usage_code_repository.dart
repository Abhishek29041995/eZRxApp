import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/repository/i_usage_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_remote.dart';

class UsageRepository implements IUsageRepository {
  final Config config;
  final UsageCodeLocalDataSource usageLocalDataSource;
  final UsageCodeRemoteDataSource usageRemoteDataSource;

  UsageRepository({
    required this.config,
    required this.usageLocalDataSource,
    required this.usageRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<Usage>>> getUsages({
    required SalesOrg salesOrg,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final usages = await usageLocalDataSource.getUsages();

        return Right(usages);
      } else {
        final usages = await usageRemoteDataSource.getUsages(
          salesOrg: salesOrg.getOrCrash(),
        );

        return Right(usages);
      }
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
