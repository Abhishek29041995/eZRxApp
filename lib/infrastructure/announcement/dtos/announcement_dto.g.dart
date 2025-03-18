// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementDtoImpl _$$AnnouncementDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementDtoImpl(
      active: json['active'] as bool? ?? false,
      descriptionList: (json['descriptionList'] as List<dynamic>?)
              ?.map((e) =>
                  AnnouncementMessageDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      type: json['type'] as String? ?? '',
      day: json['day'] as String? ?? '',
      functionLabel: json['functionLabel'] as String? ?? '',
      id: json['id'] as String? ?? '',
      isModuleSpecific: json['isModuleSpecific'] as bool? ?? false,
      moduleName: json['moduleName'] == null
          ? []
          : const _ModuleNameConverter().fromJson(json['moduleName'] as String),
      loginType: json['loginType'] as String? ?? '',
      isCrossButton: json['isCrossButton'] as bool? ?? false,
    );

_$AnnouncementMessageDtoImpl _$$AnnouncementMessageDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementMessageDtoImpl(
      languageCode: json['languageCode'] as String? ?? '',
      language: json['language'] as String? ?? '',
      announcement: json['announcement'] as String? ?? '',
    );

Map<String, dynamic> _$$AnnouncementMessageDtoImplToJson(
        _$AnnouncementMessageDtoImpl instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'language': instance.language,
      'announcement': instance.announcement,
    };
