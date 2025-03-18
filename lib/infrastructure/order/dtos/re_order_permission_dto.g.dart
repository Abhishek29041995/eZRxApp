// GENERATED CODE - DO NOT MODIFY BY HAND

part of 're_order_permission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReOrderPermissionDtoImpl _$$ReOrderPermissionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReOrderPermissionDtoImpl(
      validMaterials: (json['materials'] as List<dynamic>?)
              ?.map((e) => ValidMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ReOrderPermissionDtoImplToJson(
        _$ReOrderPermissionDtoImpl instance) =>
    <String, dynamic>{
      'materials': instance.validMaterials.map((e) => e.toJson()).toList(),
    };

_$ValidMaterialDtoImpl _$$ValidMaterialDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidMaterialDtoImpl(
      hidePrice: json['hidePrice'] as bool? ?? false,
      materialNumber: json['materialNumber'] as String? ?? '',
      isValid: json['isValid'] as bool? ?? false,
    );

Map<String, dynamic> _$$ValidMaterialDtoImplToJson(
        _$ValidMaterialDtoImpl instance) =>
    <String, dynamic>{
      'hidePrice': instance.hidePrice,
      'materialNumber': instance.materialNumber,
      'isValid': instance.isValid,
    };
