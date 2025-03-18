// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionInvoiceDtoImpl _$$TransactionInvoiceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionInvoiceDtoImpl(
      documentDate: json['documentDate'] as String? ?? '',
      documentNo: json['documentNo'] as String? ?? '',
      documentType: json['documentType'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$TransactionInvoiceDtoImplToJson(
        _$TransactionInvoiceDtoImpl instance) =>
    <String, dynamic>{
      'documentDate': instance.documentDate,
      'documentNo': instance.documentNo,
      'documentType': instance.documentType,
      'amount': instance.amount,
    };
