// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodDtoImpl _$$PaymentMethodDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodDtoImpl(
      paymentMethods: json['paymentMethods'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentMethodOptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PaymentMethodDtoImplToJson(
        _$PaymentMethodDtoImpl instance) =>
    <String, dynamic>{
      'paymentMethods': instance.paymentMethods,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };
