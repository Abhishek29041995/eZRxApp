import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';

@freezed
class ForgotPassword with _$ForgotPassword {
  ForgotPassword._();
  factory ForgotPassword({
    required bool success,
    required String email,
  }) = _ForgotPassword;

  factory ForgotPassword.empty() => ForgotPassword(email: '', success: false);
}
