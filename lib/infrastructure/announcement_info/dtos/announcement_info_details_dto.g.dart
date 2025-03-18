// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_info_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementInfoDetailsDtoImpl _$$AnnouncementInfoDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementInfoDetailsDtoImpl(
      id: json['id'] as String? ?? '',
      title:
          JsonReadValueHelper.readValueString(json, 'title') as String? ?? '',
      content:
          JsonReadValueHelper.readValueString(json, 'content') as String? ?? '',
      summary: json['summary'] as String? ?? '',
      thumbnail:
          JsonReadValueHelper.readSrcValue(json, 'thumbnail') as String? ?? '',
      publishedDate: JsonReadValueHelper.readValueDateISO(json, 'publishedDate')
              as String? ??
          '',
      releaseDate:
          JsonReadValueHelper.readValueDateISO(json, 'releaseDate') as String,
      manufacturer: JsonReadValueHelper.readValueString(json, 'manufacturer')
              as String? ??
          '',
      source:
          JsonReadValueHelper.readValueString(json, 'source') as String? ?? '',
      tag: JsonReadValueHelper.readTagName(json, 'tag') as String,
      documentsList: (JsonReadValueHelper.readDocumentsList(json, 'documents')
              as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AnnouncementInfoDetailsDtoImplToJson(
        _$AnnouncementInfoDetailsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'publishedDate': instance.publishedDate,
      'releaseDate': instance.releaseDate,
      'manufacturer': instance.manufacturer,
      'source': instance.source,
      'tag': instance.tag,
      'documents': instance.documentsList,
    };
