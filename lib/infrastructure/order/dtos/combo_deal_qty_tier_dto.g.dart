// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_qty_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealQtyTierDtoImpl _$$ComboDealQtyTierDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealQtyTierDtoImpl(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      type: json['type'] as String? ?? '',
      suffix: json['suffix'] as String? ?? '',
    );

Map<String, dynamic> _$$ComboDealQtyTierDtoImplToJson(
        _$ComboDealQtyTierDtoImpl instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'type': instance.type,
      'suffix': instance.suffix,
    };
