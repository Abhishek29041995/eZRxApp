part of 'notification_settings_bloc.dart';

@freezed
class NotificationSettingsEvent with _$NotificationSettingsEvent {
  const factory NotificationSettingsEvent.initialized() = _Initialized;
  const factory NotificationSettingsEvent.fetch() = _Fetch;
  const factory NotificationSettingsEvent.submit() = _Submit;
  const factory NotificationSettingsEvent.clear() = _Clear;
  const factory NotificationSettingsEvent.updateOrderConfirmation({
    required bool value,
  }) = _UpdateOrderConfirmation;
  const factory NotificationSettingsEvent.updatePaymentConfirmation({
    required bool value,
  }) = _UpdatePaymentConfirmation;
  const factory NotificationSettingsEvent.updateReturnConfirmation({
    required bool value,
  }) = _UpdateReturnConfirmation;
}
