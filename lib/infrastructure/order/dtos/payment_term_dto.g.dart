// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_term_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentTermDtoImpl _$$PaymentTermDtoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentTermDtoImpl(
      paymentTermCode: json['paymentTermCode'] as String? ?? '',
      paymentTermRanking: (json['paymentTermRanking'] as num?)?.toInt() ?? 0,
      paymentTermDescription: json['paymentTermDescription'] as String? ?? '',
      paymentTermSubranking:
          (json['paymentTermSubranking'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PaymentTermDtoImplToJson(
        _$PaymentTermDtoImpl instance) =>
    <String, dynamic>{
      'paymentTermCode': instance.paymentTermCode,
      'paymentTermRanking': instance.paymentTermRanking,
      'paymentTermDescription': instance.paymentTermDescription,
      'paymentTermSubranking': instance.paymentTermSubranking,
    };
