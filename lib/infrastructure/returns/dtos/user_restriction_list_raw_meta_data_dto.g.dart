// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_restriction_list_raw_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRestrictionRawMetaDataDtoImpl
    _$$UserRestrictionRawMetaDataDtoImplFromJson(Map<String, dynamic> json) =>
        _$UserRestrictionRawMetaDataDtoImpl(
          usernames: (json['usernames'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$$UserRestrictionRawMetaDataDtoImplToJson(
        _$UserRestrictionRawMetaDataDtoImpl instance) =>
    <String, dynamic>{
      'usernames': instance.usernames,
    };
