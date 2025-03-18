// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceComboDealRequestDtoImpl _$$PriceComboDealRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceComboDealRequestDtoImpl(
      isEligible: json['Eligible'] as bool? ?? false,
      flexibleGroup: json['FlexibleGroup'] as String? ?? '',
      salesDeal: json['SalesDeal'] as String? ?? '',
      category: json['Category'] == null
          ? PriceComboDealCategoryRequestDto.empty
          : PriceComboDealCategoryRequestDto.fromJson(
              json['Category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PriceComboDealRequestDtoImplToJson(
        _$PriceComboDealRequestDtoImpl instance) =>
    <String, dynamic>{
      'Eligible': instance.isEligible,
      'FlexibleGroup': instance.flexibleGroup,
      'SalesDeal': instance.salesDeal,
      'Category': instance.category.toJson(),
    };

_$PriceComboDealCategoryRequestDtoImpl
    _$$PriceComboDealCategoryRequestDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$PriceComboDealCategoryRequestDtoImpl(
          type: json['Type'] as String? ?? '',
          value: (json['Value'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$PriceComboDealCategoryRequestDtoImplToJson(
        _$PriceComboDealCategoryRequestDtoImpl instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Value': instance.value,
    };
