// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSummaryDetailsDtoImpl _$$PaymentSummaryDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSummaryDetailsDtoImpl(
      paymentID: json['paymentID'] as String? ?? '',
      valueDate:
          JsonReadValueHelper.createdAtDate(json, 'valueDate') as String? ?? '',
      paymentAmount: (json['paymentAmount'] as num?)?.toDouble() ?? 0.0,
      transactionCurrency: json['transactionCurrency'] as String? ?? '',
      paymentDocument: json['paymentDocument'] as String? ?? '',
      status: json['status'] as String? ?? '',
      paymentMethod: json['paymentMethod'] as String? ?? '',
      iban: json['iban'] as String? ?? '',
      bankKey: json['bankKey'] as String? ?? '',
      bankCountryKey: json['bankCountryKey'] as String? ?? '',
      bankAccountNumber: json['bankAccountNumber'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      paymentCardID: json['paymentCardID'] as String? ?? '',
      paymentCardNumber: json['paymentCardNumber'] as String? ?? '',
      paymentCardHolderName: json['paymentCardHolderName'] as String? ?? '',
      paymentCardMaskedNumber: json['paymentCardMaskedNumber'] as String? ?? '',
      paymentCardTypeName: json['paymentCardTypeName'] as String? ?? '',
      customId: json['customId'] as String? ?? '',
      bankIdentification: json['bankIdentification'] as String? ?? '',
      createdDate:
          JsonReadValueHelper.createdAtDate(json, 'createdDate') as String? ??
              '',
      zzAdvice: json['zzAdvice'] as String? ?? '',
      adviceExpiry: json['adviceExpiry'] as String? ?? '',
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      filterBy: json['filterBy'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$PaymentSummaryDetailsDtoImplToJson(
        _$PaymentSummaryDetailsDtoImpl instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'valueDate': instance.valueDate,
      'paymentAmount': instance.paymentAmount,
      'transactionCurrency': instance.transactionCurrency,
      'paymentDocument': instance.paymentDocument,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'iban': instance.iban,
      'bankKey': instance.bankKey,
      'bankCountryKey': instance.bankCountryKey,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankName': instance.bankName,
      'paymentCardID': instance.paymentCardID,
      'paymentCardNumber': instance.paymentCardNumber,
      'paymentCardHolderName': instance.paymentCardHolderName,
      'paymentCardMaskedNumber': instance.paymentCardMaskedNumber,
      'paymentCardTypeName': instance.paymentCardTypeName,
      'customId': instance.customId,
      'bankIdentification': instance.bankIdentification,
      'createdDate': instance.createdDate,
      'zzAdvice': instance.zzAdvice,
      'adviceExpiry': instance.adviceExpiry,
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'filterBy': instance.filterBy,
    };
