// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleDtoImpl _$$RoleDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoleDtoImpl(
      id: JsonReadValueHelper.convertRoleId(json, 'id') as String,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$RoleDtoImplToJson(_$RoleDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
    };
