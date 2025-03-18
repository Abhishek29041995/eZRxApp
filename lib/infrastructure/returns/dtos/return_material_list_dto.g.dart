// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_material_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnMaterialListDtoImpl _$$ReturnMaterialListDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnMaterialListDtoImpl(
      basicInformations: (json['materialBasicInformation'] as List<dynamic>?)
              ?.map((e) => MaterialBasicInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      items: json['materials'] == null
          ? []
          : _mappingReturnMaterial(json['materials']),
    );

Map<String, dynamic> _$$ReturnMaterialListDtoImplToJson(
        _$ReturnMaterialListDtoImpl instance) =>
    <String, dynamic>{
      'materialBasicInformation':
          instance.basicInformations.map((e) => e.toJson()).toList(),
      'materials': instance.items.map((e) => e.toJson()).toList(),
    };
