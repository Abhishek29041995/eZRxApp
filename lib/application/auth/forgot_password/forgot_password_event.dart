part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.initialized() = _Initialized;
  const factory ForgotPasswordEvent.usernameChanged(String usernameStr) =
      _ForgotPasswordEvent;
  const factory ForgotPasswordEvent.requestPasswordReset() =
      _RequestPasswordReset;
  const factory ForgotPasswordEvent.saveResetPasswordKey(String key) =
      _SaveResetPasswordKey;
  const factory ForgotPasswordEvent.validateResetPasswordKey(String key) =
      _ValidateResetPasswordKey;
}
