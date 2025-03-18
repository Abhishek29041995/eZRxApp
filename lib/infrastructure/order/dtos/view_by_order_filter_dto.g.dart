// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_order_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewByOrdersFilterDtoImpl _$$ViewByOrdersFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewByOrdersFilterDtoImpl(
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
      orderStatus: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      orderType: (json['orderType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ViewByOrdersFilterDtoImplToJson(
    _$ViewByOrdersFilterDtoImpl instance) {
  final val = <String, dynamic>{
    'toDate': instance.dateTo,
    'fromDate': instance.dateFrom,
    'status': instance.orderStatus,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderType', instance.orderType);
  return val;
}
