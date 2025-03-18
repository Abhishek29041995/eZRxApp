import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings.freezed.dart';

@freezed
class NotificationSettings with _$NotificationSettings {
  const NotificationSettings._();

  const factory NotificationSettings({
    required NotificationSetting orderConfirmation,
    required NotificationSetting paymentConfirmation,
    required NotificationSetting ereturnConfirmation,
  }) = _NotificationSettings;

  factory NotificationSettings.empty() => NotificationSettings(
        orderConfirmation: NotificationSetting(false),
        paymentConfirmation: NotificationSetting(false),
        ereturnConfirmation: NotificationSetting(false),
      );
}
