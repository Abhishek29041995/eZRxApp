// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FAQInfoDtoImpl _$$FAQInfoDtoImplFromJson(Map<String, dynamic> json) =>
    _$FAQInfoDtoImpl(
      endCursor:
          JsonReadValueHelper.readEndCursorValue(json, 'pageInfo') as String? ??
              '',
      faqList: (json['results'] as List<dynamic>?)
              ?.map((e) => FAQItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FAQInfoDtoImplToJson(_$FAQInfoDtoImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.endCursor,
      'results': instance.faqList.map((e) => e.toJson()).toList(),
    };
