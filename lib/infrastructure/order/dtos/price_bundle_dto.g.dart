// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bundle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceBundleDtoImpl _$$PriceBundleDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceBundleDtoImpl(
      name: json['bundleName'] as String? ?? '',
      code: json['bundleCode'] as String? ?? '',
      conditions: json['conditions'] as String? ?? '',
      bonusEligible: json['bonusEligible'] as bool? ?? false,
      information: (json['bundleInformation'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBundleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PriceBundleDtoImplToJson(
        _$PriceBundleDtoImpl instance) =>
    <String, dynamic>{
      'bundleName': instance.name,
      'bundleCode': instance.code,
      'conditions': instance.conditions,
      'bonusEligible': instance.bonusEligible,
      'bundleInformation': instance.information.map((e) => e.toJson()).toList(),
    };

_$PriceBundleItemDtoImpl _$$PriceBundleItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceBundleItemDtoImpl(
      type: json['type'] as String? ?? '',
      sequence: (json['sequence'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PriceBundleItemDtoImplToJson(
        _$PriceBundleItemDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'rate': instance.rate,
    };
