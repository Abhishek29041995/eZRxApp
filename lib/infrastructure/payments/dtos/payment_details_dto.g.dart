// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDetailsDtoImpl _$$PaymentDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentDetailsDtoImpl(
      vaNumber: json['vaNumber'] as String? ?? '',
      vaName: json['vaName'] as String? ?? '',
      expiresAt:
          JsonReadValueHelper.createdAtDate(json, 'expiresAt') as String? ?? '',
    );

Map<String, dynamic> _$$PaymentDetailsDtoImplToJson(
        _$PaymentDetailsDtoImpl instance) =>
    <String, dynamic>{
      'vaNumber': instance.vaNumber,
      'vaName': instance.vaName,
      'expiresAt': instance.expiresAt,
    };
