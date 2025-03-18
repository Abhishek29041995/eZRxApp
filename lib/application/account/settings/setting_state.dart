part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required bool isBiometricEnable,
    required bool isBiometricPossible,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _SettingState;

  factory SettingState.initial() => SettingState(
        isBiometricEnable: false,
        isBiometricPossible: false,
        failureOrSuccessOption: none(),
      );
}
