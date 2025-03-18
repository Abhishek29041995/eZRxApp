// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_group_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealGroupDealDtoImpl _$$ComboDealGroupDealDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealGroupDealDtoImpl(
      minTotalAmount: json['minTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['minTotalAmount'] as String),
      maxTotalAmount: json['maxTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['maxTotalAmount'] as String),
      minTotalQuantity: json['minTotalQuantity'] == null
          ? 0
          : const StringToIntConverter()
              .fromJson(json['minTotalQuantity'] as String),
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      type: json['type'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$ComboDealGroupDealDtoImplToJson(
        _$ComboDealGroupDealDtoImpl instance) =>
    <String, dynamic>{
      'minTotalAmount':
          const StringToDoubleConverter().toJson(instance.minTotalAmount),
      'maxTotalAmount':
          const StringToDoubleConverter().toJson(instance.maxTotalAmount),
      'minTotalQuantity':
          const StringToIntConverter().toJson(instance.minTotalQuantity),
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'type': instance.type,
      'conditionNumber': instance.conditionNumber,
    };
