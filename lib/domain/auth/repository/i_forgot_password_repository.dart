import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';

abstract class IForgotPasswordRepository {
  Future<Either<ApiFailure, ForgotPassword>> requestResetPassword({
    required Username username,
  });

  Future<Either<ApiFailure, bool>> validateResetPasswordKey({
    required String key,
  });
}
