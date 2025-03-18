// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceRuleDtoImpl _$$PriceRuleDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceRuleDtoImpl(
      type: json['type'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      condition: json['conditions'] as String? ?? '',
      tieredRules: json['tieredRules'] == null
          ? TieredRulesDto.empty
          : TieredRulesDto.fromJson(
              json['tieredRules'] as Map<String, dynamic>),
      bonusEligible: json['bonusEligible'] as bool? ?? false,
      conditionNumber: json['conditionNumber'] as String? ?? '',
      overriddenBy: json['overriddenBy'] as String? ?? '',
      maxQuota: json['maxQuota'] as String? ?? '',
      remainingQuota: json['remainingQuota'] as String? ?? '',
    );

Map<String, dynamic> _$$PriceRuleDtoImplToJson(_$PriceRuleDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'rate': instance.rate,
      'conditions': instance.condition,
      'tieredRules': instance.tieredRules.toJson(),
      'bonusEligible': instance.bonusEligible,
      'conditionNumber': instance.conditionNumber,
      'overriddenBy': instance.overriddenBy,
      'maxQuota': instance.maxQuota,
      'remainingQuota': instance.remainingQuota,
    };

_$TieredRulesDtoImpl _$$TieredRulesDtoImplFromJson(Map<String, dynamic> json) =>
    _$TieredRulesDtoImpl(
      tier: json['tier'] as String? ?? '',
      ruleTier: (json['ruleTier'] as List<dynamic>?)
              ?.map((e) => RuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$TieredRulesDtoImplToJson(
        _$TieredRulesDtoImpl instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'ruleTier': instance.ruleTier.map((e) => e.toJson()).toList(),
    };

_$RuleTierDtoImpl _$$RuleTierDtoImplFromJson(Map<String, dynamic> json) =>
    _$RuleTierDtoImpl(
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$RuleTierDtoImplToJson(_$RuleTierDtoImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'quantity': instance.quantity,
    };
