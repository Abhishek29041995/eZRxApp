part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.togglePasswordVisibility(
    PasswordFieldType fieldType,
    bool toggleValue,
  ) = _PasswordVisibility;

  const factory ResetPasswordEvent.onTextChange(
    PasswordFieldType fieldType,
    String newValue,
  ) = _PasswordTextOnChange;

  const factory ResetPasswordEvent.changePassword() = _ChangePassword;

  const factory ResetPasswordEvent.clear() = _Clear;

  const factory ResetPasswordEvent.initialize({
    required User user,
    required String resetPasswordKey,
  }) = _Initialize;

  const factory ResetPasswordEvent.resetPassword() = _ResetPasswords;
  const factory ResetPasswordEvent.changePasswordForFirstTime() =
      _ChangePasswordForFirstTime;
}

enum PasswordFieldType {
  oldPassword,
  newPassword,
  confirmPassword,
}
