import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/repository/i_change_password_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';

class ChangePasswordRepository implements IChangePasswordRepository {
  final Config config;
  final ChangePasswordLocalDataSource localDataSource;
  final ChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ResetPassword>> changePassword({
    required Password newPassword,
    required Password oldPassword,
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final resetPasswordEntities = await localDataSource.changePassword();

        return Right(resetPasswordEntities);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final resetPasswordEntities = await remoteDataSource.changePassword(
        user.username.getOrCrash(),
        oldPassword.getOrCrash(),
        newPassword.getOrCrash(),
      );

      return Right(resetPasswordEntities);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ResetPassword>> resetPassword({
    required String token,
    required Password newPassword,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final resetPasswordEntities = await localDataSource.resetPassword();

        return Right(resetPasswordEntities);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final resetPasswordEntities = await remoteDataSource.resetPassword(
        resetPasswordToken: token,
        newPassword: newPassword.getOrCrash(),
      );

      return Right(resetPasswordEntities);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ResetPassword>> changePasswordForFirstTime({
    required Password newPassword,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final changePasswordForFirstTimeEntities =
            await localDataSource.changePasswordForFirstTime();

        return Right(changePasswordForFirstTimeEntities);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final resetPasswordEntities =
          await remoteDataSource.changePasswordForFirstTime(
        newPassword: newPassword.getOrCrash(),
      );

      return Right(resetPasswordEntities);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
