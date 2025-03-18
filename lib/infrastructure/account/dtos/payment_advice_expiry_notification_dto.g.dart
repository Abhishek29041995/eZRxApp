// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_advice_expiry_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentAdviceExpiryNotificationDtoImpl
    _$$PaymentAdviceExpiryNotificationDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$PaymentAdviceExpiryNotificationDtoImpl(
          day: json['day'] as String,
          disabled: json['disabled'] as bool? ?? false,
        );

Map<String, dynamic> _$$PaymentAdviceExpiryNotificationDtoImplToJson(
        _$PaymentAdviceExpiryNotificationDtoImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'disabled': instance.disabled,
    };
