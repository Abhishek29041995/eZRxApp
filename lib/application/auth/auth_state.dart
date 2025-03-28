part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.biometricDenied() = _BiometricDenied;
  const factory AuthState.visitedAppSettings() = _VisitedAppSettings;
}
