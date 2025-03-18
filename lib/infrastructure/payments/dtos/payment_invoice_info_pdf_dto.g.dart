// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_invoice_info_pdf_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentInvoiceInfoPdfDtoImpl _$$PaymentInvoiceInfoPdfDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentInvoiceInfoPdfDtoImpl(
      valueDate: json['valueDate'] as String? ?? '',
      paymentID: json['paymentID'] as String? ?? '',
      zzAdvice: json['zzAdvice'] as String? ?? '',
      paymentDue: json['paymentDue'] as String? ?? '',
      paymentMethod: json['paymentMethod'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      payer: json['payer'] as String? ?? '',
      bankBeneficiary: (json['bankBeneficiary'] as List<dynamic>?)
              ?.map((e) =>
                  BankBeneficiaryInvoiceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qrCode: json['qrCode'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      paymentItems: (json['paymentItems'] as List<dynamic>?)
              ?.map((e) => PaymentItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      salesDistrict: json['salesDistrict'] as String? ?? '',
      footer: json['footer'] as String? ?? '',
      headerLogoPath: json['headerLogoPath'] as String? ?? '',
      pleaseNote: json['pleaseNote'] as String? ?? '',
      header: json['header'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentInvoiceInfoPdfDtoImplToJson(
        _$PaymentInvoiceInfoPdfDtoImpl instance) =>
    <String, dynamic>{
      'valueDate': instance.valueDate,
      'paymentID': instance.paymentID,
      'zzAdvice': instance.zzAdvice,
      'paymentDue': instance.paymentDue,
      'paymentMethod': instance.paymentMethod,
      'customerName': instance.customerName,
      'payer': instance.payer,
      'bankBeneficiary':
          instance.bankBeneficiary.map((e) => e.toJson()).toList(),
      'qrCode': instance.qrCode,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'paymentItems': instance.paymentItems.map((e) => e.toJson()).toList(),
      'salesDistrict': instance.salesDistrict,
      'footer': instance.footer,
      'headerLogoPath': instance.headerLogoPath,
      'pleaseNote': instance.pleaseNote,
      'header': instance.header,
    };
