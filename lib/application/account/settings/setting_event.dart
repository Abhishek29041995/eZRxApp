part of 'setting_bloc.dart';

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.fetchBiometricFlag() = _FetchBiometricFlag;
  const factory SettingEvent.toggleBiometric({
    required bool isBiometricEnabled,
  }) = _PutBiometricEnabled;
  const factory SettingEvent.checkIfBiometricPossible() =
      _CheckIfBiometricPossible;
}
