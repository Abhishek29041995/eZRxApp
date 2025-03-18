// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_po_documents_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoDocumentsDtoImpl _$$PoDocumentsDtoImplFromJson(Map<String, dynamic> json) =>
    _$PoDocumentsDtoImpl(
      url: JsonReadValueHelper.readUrl(json, 'url') as String? ?? '',
      name: JsonReadValueHelper.readFileName(json, 'name') as String? ?? '',
      path: JsonReadValueHelper.readUrl(json, 'path') as String? ?? '',
      flags: json['flags'] == null
          ? PoDocumentFlagsDto.empty
          : PoDocumentFlagsDto.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PoDocumentsDtoImplToJson(
        _$PoDocumentsDtoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'path': instance.path,
      'flags': instance.flags.toJson(),
    };

_$PoDocumentFlagsDtoImpl _$$PoDocumentFlagsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PoDocumentFlagsDtoImpl(
      isPoison: json['isPoison'] as bool? ?? false,
    );

Map<String, dynamic> _$$PoDocumentFlagsDtoImplToJson(
        _$PoDocumentFlagsDtoImpl instance) =>
    <String, dynamic>{
      'isPoison': instance.isPoison,
    };
