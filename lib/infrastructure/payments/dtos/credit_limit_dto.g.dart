// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_limit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditLimitDtoImpl _$$CreditLimitDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreditLimitDtoImpl(
      customerCode: json['partner'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      creditLimit: json['creditLimit'] as String? ?? '',
      creditExposure: json['creditExposure'] as String? ?? '',
      creditBalance: json['creditBalance'] as String? ?? '',
    );

Map<String, dynamic> _$$CreditLimitDtoImplToJson(
        _$CreditLimitDtoImpl instance) =>
    <String, dynamic>{
      'partner': instance.customerCode,
      'currency': instance.currency,
      'creditLimit': instance.creditLimit,
      'creditExposure': instance.creditExposure,
      'creditBalance': instance.creditBalance,
    };
