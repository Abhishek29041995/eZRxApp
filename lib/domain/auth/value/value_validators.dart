import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';

Either<ValueFailure<String>, String> validateJWT(String token) {
  try {
    getJWTPayload(token);

    return right(token);
  } catch (error) {
    return left(ValueFailure.invalidJWT(failedValue: token));
  }
}

Either<ValueFailure<String>, String> validateNewAndConfirmPassword(
  String confirmPassword,
  String newPassword,
) {
  return confirmPassword == newPassword
      ? right(confirmPassword)
      : left(ValueFailure.mustMatchNewPassword(failedValue: confirmPassword));
}

Either<ValueFailure<String>, String> validateOldAndNewPassword(
  String newPassword,
  String oldPassword,
) {
  return newPassword != oldPassword
      ? right(newPassword)
      : left(ValueFailure.mustNotMatchOldPassword(failedValue: newPassword));
}
