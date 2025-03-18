// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnItemDetailsDtoImpl _$$ReturnItemDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnItemDetailsDtoImpl(
      returnQuantity: (json['returnQuantity'] as num?)?.toInt() ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      returnReason: json['returnReason'] as String? ?? '',
      url: (json['url'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      returnType: json['returnType'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
      priceOverride: json['priceOverride'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnItemDetailsDtoImplToJson(
        _$ReturnItemDetailsDtoImpl instance) =>
    <String, dynamic>{
      'returnQuantity': instance.returnQuantity,
      'materialNumber': instance.materialNumber,
      'lineNumber': instance.lineNumber,
      'batch': instance.batch,
      'returnReason': instance.returnReason,
      'url': instance.url,
      'returnType': instance.returnType,
      'remarks': instance.remarks,
      'outsidePolicy': instance.outsidePolicy,
      'priceOverride': instance.priceOverride,
    };
