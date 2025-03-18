// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_tier_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealTierRuleDtoImpl _$$ComboDealTierRuleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealTierRuleDtoImpl(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minTotalAmount: json['minTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['minTotalAmount'] as String),
      minTotalCurrency: json['minTotalCurrency'] as String? ?? '',
      maxTotalAmount: json['maxTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['maxTotalAmount'] as String),
      maxTotalCurrency: json['maxTotalCurrency'] as String? ?? '',
      type: json['type'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
    );

Map<String, dynamic> _$$ComboDealTierRuleDtoImplToJson(
        _$ComboDealTierRuleDtoImpl instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minTotalAmount':
          const StringToDoubleConverter().toJson(instance.minTotalAmount),
      'minTotalCurrency': instance.minTotalCurrency,
      'maxTotalAmount':
          const StringToDoubleConverter().toJson(instance.maxTotalAmount),
      'maxTotalCurrency': instance.maxTotalCurrency,
      'type': instance.type,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
    };
