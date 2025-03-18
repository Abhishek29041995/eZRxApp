part of 'notification_settings_bloc.dart';

@freezed
class NotificationSettingsState with _$NotificationSettingsState {
  const NotificationSettingsState._();
  const factory NotificationSettingsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Option<Either<ApiFailure, dynamic>> submitFailureOrSuccessOption,
    required NotificationSettings previousNotificationSettings,
    required NotificationSettings currentNotificationSettings,
  }) = _NotificationSettingsState;
  factory NotificationSettingsState.initial() => NotificationSettingsState(
        isLoading: false,
        failureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
        currentNotificationSettings: NotificationSettings.empty(),
        previousNotificationSettings: NotificationSettings.empty(),
      );

  bool get enableSubmit =>
      currentNotificationSettings != previousNotificationSettings;
}
