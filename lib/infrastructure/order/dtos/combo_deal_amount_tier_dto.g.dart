// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_amount_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealAmountTierDtoImpl _$$ComboDealAmountTierDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealAmountTierDtoImpl(
      rate: json['rate'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minTotalAmount: json['minTotalAmount'] as String? ?? '',
      minTotalCurrency: json['minTotalCurrency'] as String? ?? '',
      maxTotalAmount: json['maxTotalAmount'] as String? ?? '',
      maxTotalCurrency: json['maxTotalCurrency'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$ComboDealAmountTierDtoImplToJson(
        _$ComboDealAmountTierDtoImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'conditionNumber': instance.conditionNumber,
      'minTotalAmount': instance.minTotalAmount,
      'minTotalCurrency': instance.minTotalCurrency,
      'maxTotalAmount': instance.maxTotalAmount,
      'maxTotalCurrency': instance.maxTotalCurrency,
      'type': instance.type,
    };
