// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodOptionDtoImpl _$$PaymentMethodOptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodOptionDtoImpl(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentMethodOptionDtoImplToJson(
        _$PaymentMethodOptionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'provider': instance.provider,
      'displayName': instance.displayName,
    };
