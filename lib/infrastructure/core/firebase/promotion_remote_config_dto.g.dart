// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_remote_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotionRemoteConfigDtoImpl _$$PromotionRemoteConfigDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PromotionRemoteConfigDtoImpl(
      blacklist:
          (json['blacklist'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PromotionRemoteConfigDtoImplToJson(
        _$PromotionRemoteConfigDtoImpl instance) =>
    <String, dynamic>{
      'blacklist': instance.blacklist,
    };
