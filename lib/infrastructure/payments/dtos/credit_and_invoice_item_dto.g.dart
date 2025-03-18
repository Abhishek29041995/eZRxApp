// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_and_invoice_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditAndInvoiceItemDtoImpl _$$CreditAndInvoiceItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditAndInvoiceItemDtoImpl(
      bpCustomerNumber: json['bpCustomerNumber'] as String? ?? '',
      fiscalYear: json['fiscalYear'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      accountingDocumentItem: json['accountingDocumentItem'] as String? ?? '',
      accountingDocumentType: json['accountingDocumentType'] as String? ?? '',
      postingKeyName: json['postingKeyName'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      postingDate: json['postingDate'] as String? ?? '',
      referenceDocumentNumber: json['referenceDocumentNumber'] as String? ?? '',
      documentDate: json['documentDate'] as String? ?? '',
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      manualFee: (json['manualFee'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      invoiceReference: json['invoiceReference'] as String? ?? '',
      invoiceProcessingStatus: json['invoiceProcessingStatus'] as String? ?? '',
      debitCreditCode: json['debitCreditCode'] as String? ?? '',
      referenceId: json['referenceId'] as String? ?? '',
      documentReferenceID: json['documentReferenceID'] as String? ?? '',
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
      orderId: json['orderId'] as String? ?? '',
    );

Map<String, dynamic> _$$CreditAndInvoiceItemDtoImplToJson(
        _$CreditAndInvoiceItemDtoImpl instance) =>
    <String, dynamic>{
      'bpCustomerNumber': instance.bpCustomerNumber,
      'fiscalYear': instance.fiscalYear,
      'accountingDocument': instance.accountingDocument,
      'accountingDocumentItem': instance.accountingDocumentItem,
      'accountingDocumentType': instance.accountingDocumentType,
      'postingKeyName': instance.postingKeyName,
      'netDueDate': instance.netDueDate,
      'postingDate': instance.postingDate,
      'referenceDocumentNumber': instance.referenceDocumentNumber,
      'documentDate': instance.documentDate,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'manualFee': instance.manualFee,
      'taxAmount': instance.taxAmount,
      'invoiceReference': instance.invoiceReference,
      'invoiceProcessingStatus': instance.invoiceProcessingStatus,
      'debitCreditCode': instance.debitCreditCode,
      'referenceId': instance.referenceId,
      'documentReferenceID': instance.documentReferenceID,
      'grossAmount': instance.grossAmount,
      'netAmount': instance.netAmount,
      'orderId': instance.orderId,
    };
