part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _AuthInit;
  const factory AuthEvent.bioCheck() = _BioCheck;
  const factory AuthEvent.authCheck() = _AuthCheck;
  const factory AuthEvent.refreshEZRXToken() = _RefreshEZRXToken;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.checkIfBiometricDenied() = _CheckIfBiometricDenied;
  const factory AuthEvent.visitedAppSettings() = _ToggleAppSettings;
}
