// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_invoice_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingInvoiceFilterDtoImpl _$$OutstandingInvoiceFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OutstandingInvoiceFilterDtoImpl(
      dueDateFrom: json['dueDateFrom'] as String? ?? '',
      dueDateTo: json['dueDateTo'] as String? ?? '',
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountInTransactionCurrencyFrom:
          json['amountInTransactionCurrencyFrom'] as String? ?? '',
      amountInTransactionCurrencyTo:
          json['amountInTransactionCurrencyTo'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$OutstandingInvoiceFilterDtoImplToJson(
        _$OutstandingInvoiceFilterDtoImpl instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountInTransactionCurrencyFrom':
          instance.amountInTransactionCurrencyFrom,
      'amountInTransactionCurrencyTo': instance.amountInTransactionCurrencyTo,
      'status': instance.status,
    };
