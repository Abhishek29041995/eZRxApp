// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerCodeConfigDtoImpl _$$CustomerCodeConfigDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCodeConfigDtoImpl(
      customerCode: json['customerCode'] as String? ?? '',
      disableReturns: json['disableReturns'] as bool? ?? false,
      disablePayments: json['disablePayments'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomerCodeConfigDtoImplToJson(
        _$CustomerCodeConfigDtoImpl instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'disableReturns': instance.disableReturns,
      'disablePayments': instance.disablePayments,
    };
