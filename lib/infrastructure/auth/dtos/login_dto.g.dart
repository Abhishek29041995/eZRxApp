// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDtoImpl _$$LoginDtoImplFromJson(Map<String, dynamic> json) =>
    _$LoginDtoImpl(
      access: JsonReadValueHelper.convertAccessToken(json, 'eZRxJWT') as String,
      refresh: JsonReadValueHelper.convertRefreshToken(json, 'eZRxRefreshJWT')
          as String,
      user: json['user'] == null
          ? UserDto.emptyUserDto
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginDtoImplToJson(_$LoginDtoImpl instance) =>
    <String, dynamic>{
      'eZRxJWT': instance.access,
      'eZRxRefreshJWT': instance.refresh,
      'user': instance.user.toJson(),
    };
