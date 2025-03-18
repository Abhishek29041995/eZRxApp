// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceDtoImpl _$$PriceDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceDtoImpl(
      materialNumber: json['materialNumber'] as String? ?? '',
      oldMaterialCode: json['oldMaterialCode'] as String? ?? '',
      listPrice: (json['listPrice'] as num?)?.toDouble() ?? 0,
      finalIndividualPrice:
          (json['finalIndividualPrice'] as num?)?.toDouble() ?? 0,
      finalTotalPrice: (json['finalTotalPrice'] as num?)?.toDouble() ?? 0,
      discountedValue: (json['discountedValue'] as num?)?.toDouble() ?? 0,
      rules: (json['priceRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonuses: (json['bonuses'] as List<dynamic>?)
              ?.map((e) => PriceBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tiers: (json['tieredPricing'] as List<dynamic>?)
              ?.map((e) => PriceTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['bundles'] as List<dynamic>?)
              ?.map((e) => PriceBundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isValid: json['valid'] as bool? ?? false,
      additionalBonusEligible:
          json['additionalBonusEligible'] as bool? ?? false,
      zmgDiscount: json['zMGDiscount'] as bool? ?? false,
      zdp5MaxQuota: json['zDP5MaxQuota'] as String? ?? '',
      zdp5RemainingQuota: json['zDP5RemainingQuota'] as String? ?? '',
      exceedQty: json['exceedQty'] as bool? ?? false,
      overrideRulePresent: json['overridenRulePresent'] as bool? ?? false,
      overridenRules: (json['overridenRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      overridenRuleTier: (json['overridenRuleTier'] as List<dynamic>?)
              ?.map((e) =>
                  OverridenRuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isPriceOverride: json['isPriceOverride'] as bool? ?? false,
      zdp8Override: (json['zdp8Override'] as num?)?.toDouble() ?? 0,
      priceOverride: (json['priceOverride'] as num?)?.toDouble() ?? 0,
      comboDeal: json['comboDeals'] == null
          ? PriceComboDealDto.empty
          : PriceComboDealDto.fromJson(
              json['comboDeals'] as Map<String, dynamic>),
      isDiscountOverride: json['isDiscountOverride'] as bool? ?? false,
      isMOVExclusion: json['isMOVExclusion'] as bool? ?? false,
      conditionFlags: json['conditionFlags'] == null
          ? PriceConditionFlagDto.empty
          : PriceConditionFlagDto.fromJson(
              json['conditionFlags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PriceDtoImplToJson(_$PriceDtoImpl instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'oldMaterialCode': instance.oldMaterialCode,
      'listPrice': instance.listPrice,
      'finalIndividualPrice': instance.finalIndividualPrice,
      'finalTotalPrice': instance.finalTotalPrice,
      'discountedValue': instance.discountedValue,
      'priceRules': instance.rules.map((e) => e.toJson()).toList(),
      'bonuses': instance.bonuses.map((e) => e.toJson()).toList(),
      'tieredPricing': instance.tiers.map((e) => e.toJson()).toList(),
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
      'valid': instance.isValid,
      'additionalBonusEligible': instance.additionalBonusEligible,
      'zMGDiscount': instance.zmgDiscount,
      'zDP5MaxQuota': instance.zdp5MaxQuota,
      'zDP5RemainingQuota': instance.zdp5RemainingQuota,
      'exceedQty': instance.exceedQty,
      'overridenRulePresent': instance.overrideRulePresent,
      'overridenRules': instance.overridenRules.map((e) => e.toJson()).toList(),
      'overridenRuleTier':
          instance.overridenRuleTier.map((e) => e.toJson()).toList(),
      'isPriceOverride': instance.isPriceOverride,
      'zdp8Override': instance.zdp8Override,
      'priceOverride': instance.priceOverride,
      'comboDeals': instance.comboDeal.toJson(),
      'isDiscountOverride': instance.isDiscountOverride,
      'isMOVExclusion': instance.isMOVExclusion,
      'conditionFlags': instance.conditionFlags.toJson(),
    };
