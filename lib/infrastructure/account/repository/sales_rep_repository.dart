import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_rep_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';

class SalesRepRepository implements ISalesRepRepository {
  final Config config;
  final SalesRepRemoteDataSource remoteDataSource;
  final SalesRepLocalDataSource localDataSource;

  SalesRepRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, SalesRepresentativeInfo>> getSalesRepInfo({
    required User user,
  }) async {
    final usernameStr = user.username.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesRep = await localDataSource.getSalesRepInfo();

        return Right(salesRep);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final salesRepInfo = await remoteDataSource.getSalesRepInfo(
        userName: usernameStr,
      );

      return Right(salesRepInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
