// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingsResponseDtoImpl
    _$$NotificationSettingsResponseDtoImplFromJson(Map<String, dynamic> json) =>
        _$NotificationSettingsResponseDtoImpl(
          orderConfirmation: json['orderConfirmation'] as bool? ?? false,
          paymentConfirmation: json['paymentConfirmation'] as bool? ?? false,
          ereturnConfirmation: json['ereturnConfirmation'] as bool? ?? false,
        );

Map<String, dynamic> _$$NotificationSettingsResponseDtoImplToJson(
        _$NotificationSettingsResponseDtoImpl instance) =>
    <String, dynamic>{
      'orderConfirmation': instance.orderConfirmation,
      'paymentConfirmation': instance.paymentConfirmation,
      'ereturnConfirmation': instance.ereturnConfirmation,
    };
