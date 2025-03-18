import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/bank_beneficiary_invoice_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_invoice_info_pdf_dto.freezed.dart';
part 'payment_invoice_info_pdf_dto.g.dart';

@freezed
class PaymentInvoiceInfoPdfDto with _$PaymentInvoiceInfoPdfDto {
  const PaymentInvoiceInfoPdfDto._();

  const factory PaymentInvoiceInfoPdfDto({
    @JsonKey(name: 'valueDate', defaultValue: '') required String valueDate,
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'zzAdvice', defaultValue: '') required String zzAdvice,
    @JsonKey(name: 'paymentDue', defaultValue: '') required String paymentDue,
    @JsonKey(name: 'paymentMethod', defaultValue: '')
        required String paymentMethod,
    @JsonKey(name: 'customerName', defaultValue: '')
        required String customerName,
    @JsonKey(name: 'payer', defaultValue: '') required String payer,
    @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
        required List<BankBeneficiaryInvoiceDto> bankBeneficiary,
    @JsonKey(name: 'qrCode', defaultValue: '') required String qrCode,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
        required String paymentBatchAdditionalInfo,
    @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
        required List<PaymentItemDto> paymentItems,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'footer', defaultValue: '') required String footer,
    @JsonKey(name: 'headerLogoPath', defaultValue: '')
        required String headerLogoPath,
    @JsonKey(name: 'pleaseNote', defaultValue: '') required String pleaseNote,
    @JsonKey(name: 'header', defaultValue: '') required String header,
  }) = _PaymentInvoiceInfoPdfDto;

  PaymentInvoiceInfoPdf toDomain() {
    return PaymentInvoiceInfoPdf(
      valueDate: DateTimeStringValue(valueDate),
      paymentID: paymentID,
      zzAdvice: zzAdvice,
      paymentDue: PaymentDue(paymentDue),
      paymentMethod: PaymentMethodValue(paymentMethod),
      customerName: customerName,
      payer: payer,
      bankBeneficiary: bankBeneficiary.map((e) => e.toDomain()).toList(),
      qrCode: qrCode,
      paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
      paymentItems: paymentItems.map((e) => e.toDomain()).toList(),
      salesDistrict: salesDistrict,
      footer: footer,
      headerLogoPath: headerLogoPath,
      pleaseNote: pleaseNote,
      header: header,
    );
  }

  factory PaymentInvoiceInfoPdfDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInvoiceInfoPdfDtoFromJson(json);
}
