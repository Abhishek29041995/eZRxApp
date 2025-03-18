// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_open_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerOpenItemDtoImpl _$$CustomerOpenItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerOpenItemDtoImpl(
      status: json['status'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      documentDate: json['documentDate'] as String? ?? '',
      postingDate: json['postingDate'] as String? ?? '',
      documentReferenceID: json['documentReferenceID'] as String? ?? '',
      postingKeyName: json['postingKeyName'] as String? ?? '',
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0,
      transactionCurrency: json['transactionCurrency'] as String? ?? 'MYR',
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      bpCustomerNumber: json['bpCustomerNumber'] as String? ?? '',
      debitCreditCode: json['debitCreditCode'] as String? ?? '',
      cashDiscountAmountInDspCrcy:
          (json['cashDiscountAmountInDspCrcy'] as num?)?.toDouble() ?? 0,
      cashDiscountDueDate: json['cashDiscountDueDate'] as String? ?? '',
      totalAmountInDisplayCrcy:
          (json['totalAmountInDisplayCrcy'] as num?)?.toDouble() ?? 0,
      displayCurrency: json['displayCurrency'] as String? ?? '',
      openAmountInDisplayCrcy:
          (json['openAmountInDisplayCrcy'] as num?)?.toDouble() ?? 0,
      fiscalYear: json['fiscalYear'] as String? ?? '',
      isDisputed: json['isDisputed'] as String? ?? '',
      accountingDocumentItem: json['accountingDocumentItem'] as String? ?? '',
      accountingDocumentItemRef:
          json['accountingDocumentItemRef'] as String? ?? '',
      partialPaymentHistoryDesc:
          json['partialPaymentHistoryDesc'] as String? ?? '',
      paymentAmountInDisplayCrcy:
          (json['paymentAmountInDisplayCrcy'] as num?)?.toDouble() ?? 0,
      companyCode: json['companyCode'] as String? ?? '',
      billingDocument: json['billingDocument'] as String? ?? '',
      openAmountInTransCrcy:
          (json['openAmountInTransCrcy'] as num?)?.toDouble() ?? 0,
      orderId: json['orderId'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerOpenItemDtoImplToJson(
        _$CustomerOpenItemDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'accountingDocument': instance.accountingDocument,
      'netDueDate': instance.netDueDate,
      'documentDate': instance.documentDate,
      'postingDate': instance.postingDate,
      'documentReferenceID': instance.documentReferenceID,
      'postingKeyName': instance.postingKeyName,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
      'transactionCurrency': instance.transactionCurrency,
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'bpCustomerNumber': instance.bpCustomerNumber,
      'debitCreditCode': instance.debitCreditCode,
      'cashDiscountAmountInDspCrcy': instance.cashDiscountAmountInDspCrcy,
      'cashDiscountDueDate': instance.cashDiscountDueDate,
      'totalAmountInDisplayCrcy': instance.totalAmountInDisplayCrcy,
      'displayCurrency': instance.displayCurrency,
      'openAmountInDisplayCrcy': instance.openAmountInDisplayCrcy,
      'fiscalYear': instance.fiscalYear,
      'isDisputed': instance.isDisputed,
      'accountingDocumentItem': instance.accountingDocumentItem,
      'accountingDocumentItemRef': instance.accountingDocumentItemRef,
      'partialPaymentHistoryDesc': instance.partialPaymentHistoryDesc,
      'paymentAmountInDisplayCrcy': instance.paymentAmountInDisplayCrcy,
      'companyCode': instance.companyCode,
      'billingDocument': instance.billingDocument,
      'openAmountInTransCrcy': instance.openAmountInTransCrcy,
      'orderId': instance.orderId,
    };
