// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentInfoDtoImpl _$$PaymentInfoDtoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentInfoDtoImpl(
      paymentID: json['paymentID'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      valueDate: json['valueDate'] as String? ?? '',
      transactionCurrency: json['transactionCurrency'] as String? ?? '',
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      zCcpPaymentQRCode: json['zCcpPaymentQRCode'] as String? ?? '',
      zzAdvice: json['zzAdvice'] as String? ?? '',
      zzHtmcs: json['zzHtmcs'] as String? ?? '',
      adviceExpiry: json['adviceExpiry'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentInfoDtoImplToJson(
        _$PaymentInfoDtoImpl instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'valueDate': instance.valueDate,
      'transactionCurrency': instance.transactionCurrency,
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'zCcpPaymentQRCode': instance.zCcpPaymentQRCode,
      'zzAdvice': instance.zzAdvice,
      'zzHtmcs': instance.zzHtmcs,
      'adviceExpiry': instance.adviceExpiry,
    };
