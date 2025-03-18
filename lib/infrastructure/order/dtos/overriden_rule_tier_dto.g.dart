// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overriden_rule_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverridenRuleTierDtoImpl _$$OverridenRuleTierDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OverridenRuleTierDtoImpl(
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      conditions: json['conditions'] as String? ?? '',
      tier: json['tier'] as String? ?? '',
      overrider: json['overrider'] as String? ?? '',
    );

Map<String, dynamic> _$$OverridenRuleTierDtoImplToJson(
        _$OverridenRuleTierDtoImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'quantity': instance.quantity,
      'conditions': instance.conditions,
      'tier': instance.tier,
      'overrider': instance.overrider,
    };
