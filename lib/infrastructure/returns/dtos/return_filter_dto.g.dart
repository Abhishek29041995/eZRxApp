// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnFilterDtoImpl _$$ReturnFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnFilterDtoImpl(
      dateFrom: json['dateFrom'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      refundTotalFrom: json['refundTotalFrom'] as String? ?? '',
      refundTotalTo: json['refundTotalTo'] as String? ?? '',
      statusList: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      returnType: (json['returnType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReturnFilterDtoImplToJson(
    _$ReturnFilterDtoImpl instance) {
  final val = <String, dynamic>{
    'dateFrom': instance.dateFrom,
    'dateTo': instance.dateTo,
    'refundTotalFrom': instance.refundTotalFrom,
    'refundTotalTo': instance.refundTotalTo,
    'status': instance.statusList,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('returnType', instance.returnType);
  return val;
}
