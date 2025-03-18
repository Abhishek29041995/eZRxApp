// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactUsDtoImpl _$$ContactUsDtoImplFromJson(Map<String, dynamic> json) =>
    _$ContactUsDtoImpl(
      name: json['name'] as String? ?? '',
      contactNumber: json['contactNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactUsDtoImplToJson(_$ContactUsDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'message': instance.message,
    };
