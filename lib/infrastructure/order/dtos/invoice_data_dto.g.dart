// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDataDtoImpl _$$InvoiceDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDataDtoImpl(
      orderNumber: json['orderId'] as String? ?? '',
      invoiceNumber: json['invoice'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$InvoiceDataDtoImplToJson(
        _$InvoiceDataDtoImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderNumber,
      'invoice': instance.invoiceNumber,
      'lineNumber': instance.lineNumber,
    };
