// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_by_order_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceByOrderRequestDtoImpl _$$InvoiceByOrderRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceByOrderRequestDtoImpl(
      soldTo: json['soldTo'] as String? ?? '',
      pageSize: (json['first'] as num?)?.toInt() ?? 0,
      offset: (json['after'] as num?)?.toInt() ?? 0,
      language: json['language'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$InvoiceByOrderRequestDtoImplToJson(
        _$InvoiceByOrderRequestDtoImpl instance) =>
    <String, dynamic>{
      'soldTo': instance.soldTo,
      'first': instance.pageSize,
      'after': instance.offset,
      'language': instance.language,
      'orderNumber': instance.orderNumber,
    };
