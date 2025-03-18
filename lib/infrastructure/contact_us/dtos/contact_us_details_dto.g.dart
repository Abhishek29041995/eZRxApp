// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactUsDetailsDtoImpl _$$ContactUsDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactUsDetailsDtoImpl(
      content:
          JsonReadValueHelper.readValueString(json, 'content') as String? ?? '',
      preloginSendToEmail:
          JsonReadValueHelper.readValueString(json, 'preloginSendToEmail')
                  as String? ??
              '',
      postloginSendToEmail:
          JsonReadValueHelper.readValueString(json, 'postloginSendToEmail')
                  as String? ??
              '',
    );

Map<String, dynamic> _$$ContactUsDetailsDtoImplToJson(
        _$ContactUsDetailsDtoImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'preloginSendToEmail': instance.preloginSendToEmail,
      'postloginSendToEmail': instance.postloginSendToEmail,
    };
