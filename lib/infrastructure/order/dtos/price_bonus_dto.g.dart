// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceBonusDtoImpl _$$PriceBonusDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceBonusDtoImpl(
      items: (json['bonusTiers'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBonusItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PriceBonusDtoImplToJson(_$PriceBonusDtoImpl instance) =>
    <String, dynamic>{
      'bonusTiers': instance.items.map((e) => e.toJson()).toList(),
    };

_$PriceBonusItemDtoImpl _$$PriceBonusItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceBonusItemDtoImpl(
      calculation: json['calculation'] as String? ?? '',
      qualifyingQuantity: (json['qualifyingQuantity'] as num?)?.toInt() ?? 0,
      bonusMaterials: (json['bonusMaterial'] as List<dynamic>?)
              ?.map((e) => BonusMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PriceBonusItemDtoImplToJson(
        _$PriceBonusItemDtoImpl instance) =>
    <String, dynamic>{
      'calculation': instance.calculation,
      'qualifyingQuantity': instance.qualifyingQuantity,
      'bonusMaterial': instance.bonusMaterials.map((e) => e.toJson()).toList(),
    };

_$BonusMaterialDtoImpl _$$BonusMaterialDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BonusMaterialDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      calculation: json['calculation'] as String? ?? '',
      bonusRatio: (json['bonusRatio'] as num?)?.toInt() ?? 0,
      qualifyingQuantity: (json['qualifyingQuantity'] as num?)?.toInt() ?? 0,
      bonusQuantity: (json['bonusQuantity'] as num?)?.toInt() ?? 0,
      limitPerTransaction: (json['limitPerTransaction'] as num?)?.toInt() ?? 0,
      conditionId: json['conditionId'] as String? ?? '',
      oldMaterialCode: json['oldMaterialCode'] as String? ?? '',
    );

Map<String, dynamic> _$$BonusMaterialDtoImplToJson(
        _$BonusMaterialDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'calculation': instance.calculation,
      'bonusRatio': instance.bonusRatio,
      'qualifyingQuantity': instance.qualifyingQuantity,
      'bonusQuantity': instance.bonusQuantity,
      'limitPerTransaction': instance.limitPerTransaction,
      'conditionId': instance.conditionId,
      'oldMaterialCode': instance.oldMaterialCode,
    };
