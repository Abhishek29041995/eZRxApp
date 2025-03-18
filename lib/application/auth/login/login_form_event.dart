part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.loadLastSavedCred(AppMarket appMarket) = _LoadLastSavedCred;
  const factory LoginFormEvent.usernameChanged(String usernameStr) =
      _UsernameChanged;
  const factory LoginFormEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory LoginFormEvent.passwordVisibilityChanged() =
      _PasswordVisibleChanged;
  const factory LoginFormEvent.rememberCheckChanged() = _RememberCheckChanged;
  const factory LoginFormEvent.loginWithEmailAndPasswordPressed() =
      _LoginWithEmailAndPasswordPressed;
  const factory LoginFormEvent.loginWithOktaButtonPressed() =
      _LoginWithOktaButtonPressed;
  const factory LoginFormEvent.refreshOktaToken() = _RefreshOktaToken;
  const factory LoginFormEvent.exchanhgeEZRXToken(JWT oktaAccessToken) =
      _ExchanhgeEZRXToken;
  const factory LoginFormEvent.fetchCurrentMarket() = _FetchCurrentMarket;
  const factory LoginFormEvent.setCurrentMarket(AppMarket currentMarket) =
      _SetCurrentMarket;
}
