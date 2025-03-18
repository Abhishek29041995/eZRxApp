// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp_remote_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MPRemoteConfigDtoImpl _$$MPRemoteConfigDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MPRemoteConfigDtoImpl(
      marketplaceConfig: MPRemoteConfigValueDto.fromJson(
          json['marketplaceConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MPRemoteConfigDtoImplToJson(
        _$MPRemoteConfigDtoImpl instance) =>
    <String, dynamic>{
      'marketplaceConfig': instance.marketplaceConfig.toJson(),
    };

_$MPRemoteConfigValueDtoImpl _$$MPRemoteConfigValueDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MPRemoteConfigValueDtoImpl(
      whiteList:
          (json['whitelist'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MPRemoteConfigValueDtoImplToJson(
        _$MPRemoteConfigValueDtoImpl instance) =>
    <String, dynamic>{
      'whitelist': instance.whiteList,
    };
