// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_excel_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnExcelFilterDtoImpl _$$ReturnExcelFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnExcelFilterDtoImpl(
      dateFrom: json['dateFrom'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      refundTotalFrom: json['refundTotalFrom'] as String? ?? '',
      refundTotalTo: json['refundTotalTo'] as String? ?? '',
      statusList: (json['statusItem'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ReturnExcelFilterDtoImplToJson(
        _$ReturnExcelFilterDtoImpl instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'refundTotalFrom': instance.refundTotalFrom,
      'refundTotalTo': instance.refundTotalTo,
      'statusItem': instance.statusList,
    };
