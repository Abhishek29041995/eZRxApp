import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password.freezed.dart';

@freezed
class ResetPassword with _$ResetPassword {
  const ResetPassword._();

  const factory ResetPassword({
    required bool success,
    required String status,
  }) = _ResetPassword;

  factory ResetPassword.empty() => const ResetPassword(
        success: false,
        status: '',
      );
}
