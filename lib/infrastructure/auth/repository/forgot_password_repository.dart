import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/repository/i_forgot_password_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_remote.dart';

class ForgotPasswordRepository implements IForgotPasswordRepository {
  final Config config;
  final ForgotPasswordLocalDataSource localDataSource;
  final ForgotPasswordRemoteDataSource remoteDataSource;

  ForgotPasswordRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ForgotPassword>> requestResetPassword({
    required Username username,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.requestResetPassword();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final response = await remoteDataSource.requestResetPassword(
        username: username.getOrCrash(),
      );
      if (response.success) return Right(response);

      return const Left(ApiFailure.passwordResetFail());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> validateResetPasswordKey({
    required String key,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final isKeyValid = await localDataSource.validateResetPasswordKey();

        return Right(isKeyValid);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final isKeyValid = await remoteDataSource.validateResetPasswordKey(
        key: key,
      );
      if (isKeyValid) return Right(isKeyValid);

      return const Left(ApiFailure.passwordResetKeyInvalid());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
