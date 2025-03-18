import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings_response_dto.freezed.dart';
part 'notification_settings_response_dto.g.dart';

@freezed
class NotificationSettingsResponseDto with _$NotificationSettingsResponseDto {
  const NotificationSettingsResponseDto._();
  const factory NotificationSettingsResponseDto({
    @JsonKey(name: 'orderConfirmation', defaultValue: false)
        required bool orderConfirmation,
    @JsonKey(name: 'paymentConfirmation', defaultValue: false)
        required bool paymentConfirmation,
    @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
        required bool ereturnConfirmation,
  }) = _NotificationSettingsResponseDto;

  factory NotificationSettingsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsResponseDtoFromJson(json);

  NotificationSettings get toDomain => NotificationSettings(
        orderConfirmation: NotificationSetting(orderConfirmation),
        paymentConfirmation: NotificationSetting(paymentConfirmation),
        ereturnConfirmation: NotificationSetting(ereturnConfirmation),
      );
}
