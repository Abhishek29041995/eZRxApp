// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealDtoImpl _$$ComboDealDtoImplFromJson(Map<String, dynamic> json) =>
    _$ComboDealDtoImpl(
      groupDeal: json['groupDeal'] == null
          ? ComboDealGroupDealDto.empty
          : ComboDealGroupDealDto.fromJson(
              json['groupDeal'] as Map<String, dynamic>),
      flexiSKUTier: (json['flexiSKUTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealSKUTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiQtyTier: (json['flexiQtyTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealQtyTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiAmountTier: (json['flexiAmmountTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealAmountTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materialComboDeals: (json['materialComboDeals'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealMaterialSetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiTierRule: (json['flexiTierRule'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealTierRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ComboDealDtoImplToJson(_$ComboDealDtoImpl instance) =>
    <String, dynamic>{
      'groupDeal': instance.groupDeal.toJson(),
      'flexiSKUTier': instance.flexiSKUTier.map((e) => e.toJson()).toList(),
      'flexiQtyTier': instance.flexiQtyTier.map((e) => e.toJson()).toList(),
      'flexiAmmountTier':
          instance.flexiAmountTier.map((e) => e.toJson()).toList(),
      'materialComboDeals':
          instance.materialComboDeals.map((e) => e.toJson()).toList(),
      'flexiTierRule': instance.flexiTierRule.map((e) => e.toJson()).toList(),
    };
