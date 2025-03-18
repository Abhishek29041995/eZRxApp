// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComboDealMaterialSetDtoImpl _$$ComboDealMaterialSetDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealMaterialSetDtoImpl(
      setNo: json['setNo'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ComboDealMaterialSetDtoImplToJson(
        _$ComboDealMaterialSetDtoImpl instance) =>
    <String, dynamic>{
      'setNo': instance.setNo,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };

_$ComboDealMaterialDtoImpl _$$ComboDealMaterialDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ComboDealMaterialDtoImpl(
      minQty: JsonReadValueHelper.handleMinQty(json, 'minQty') == null
          ? 0
          : const StringToIntConverter().fromJson(
              JsonReadValueHelper.handleMinQty(json, 'minQty') as String),
      materialNumber: json['materialNumber'] as String? ?? '',
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      type: json['type'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
      suffix: json['suffix'] as String? ?? '',
    );

Map<String, dynamic> _$$ComboDealMaterialDtoImplToJson(
        _$ComboDealMaterialDtoImpl instance) =>
    <String, dynamic>{
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'materialNumber': instance.materialNumber,
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'type': instance.type,
      'conditionNumber': instance.conditionNumber,
      'mandatory': instance.mandatory,
      'suffix': instance.suffix,
    };
