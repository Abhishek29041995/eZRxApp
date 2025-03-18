// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_material_item_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitMaterialItemBonusDtoImpl _$$SubmitMaterialItemBonusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitMaterialItemBonusDtoImpl(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: (json['qty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SubmitMaterialItemBonusDtoImplToJson(
        _$SubmitMaterialItemBonusDtoImpl instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'qty': instance.qty,
    };
