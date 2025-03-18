// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceComboDealDtoImpl _$$PriceComboDealDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceComboDealDtoImpl(
      isEligible: json['eligible'] as bool? ?? false,
      flexibleGroup: json['flexibleGroup'] as String? ?? '',
      salesDeal: json['salesDeal'] as String? ?? '',
      category: json['category'] == null
          ? PriceComboDealCategoryDto.empty
          : PriceComboDealCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PriceComboDealDtoImplToJson(
        _$PriceComboDealDtoImpl instance) =>
    <String, dynamic>{
      'eligible': instance.isEligible,
      'flexibleGroup': instance.flexibleGroup,
      'salesDeal': instance.salesDeal,
      'category': instance.category.toJson(),
    };

_$PriceComboDealCategoryDtoImpl _$$PriceComboDealCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceComboDealCategoryDtoImpl(
      type: json['type'] as String? ?? '',
      value:
          (json['value'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$PriceComboDealCategoryDtoImplToJson(
        _$PriceComboDealCategoryDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
