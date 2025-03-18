// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_sample_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BonusSampleItemDtoImpl _$$BonusSampleItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BonusSampleItemDtoImpl(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: (json['productCount'] as num?)?.toInt() ?? 0,
      principalName: json['principalName'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      itemId: json['itemId'] as String? ?? '',
      type: json['type'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$BonusSampleItemDtoImplToJson(
        _$BonusSampleItemDtoImpl instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'productCount': instance.qty,
      'principalName': instance.principalName,
      'materialDescription': instance.materialDescription,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'principalCode': instance.principalCode,
      'itemId': instance.itemId,
      'type': instance.type,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
    };
