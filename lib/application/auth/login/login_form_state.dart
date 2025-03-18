part of 'login_form_bloc.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  const factory LoginFormState({
    required Username username,
    required Password password,
    required bool passwordVisible,
    required bool rememberPassword,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ApiFailure, dynamic>> authFailureOrSuccessOption,
    required AppMarket currentMarket,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        username: Username(''),
        password: Password.login(''),
        passwordVisible: false,
        rememberPassword: false,
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        currentMarket: AppMarket.defaultMarket(),
      );
}
