import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_invoice_info_pdf.freezed.dart';

@freezed
class PaymentInvoiceInfoPdf with _$PaymentInvoiceInfoPdf {
  const PaymentInvoiceInfoPdf._();

  const factory PaymentInvoiceInfoPdf({
    required DateTimeStringValue valueDate,
    required String paymentID,
    required String zzAdvice,
    required PaymentDue paymentDue,
    required PaymentMethodValue paymentMethod,
    required String customerName,
    required String payer,
    required List<BankBeneficiary> bankBeneficiary,
    required String qrCode,
    required String paymentBatchAdditionalInfo,
    required List<PaymentItem> paymentItems,
    required String salesDistrict,
    required String footer,
    required String headerLogoPath,
    required String pleaseNote,
    required String header,
  }) = _PaymentInvoiceInfoPdf;

  factory PaymentInvoiceInfoPdf.empty() => PaymentInvoiceInfoPdf(
        valueDate: DateTimeStringValue(''),
        paymentID: '',
        zzAdvice: '',
        paymentDue: PaymentDue(''),
        paymentMethod: PaymentMethodValue(''),
        customerName: '',
        payer: '',
        bankBeneficiary: <BankBeneficiary>[],
        qrCode: '',
        paymentBatchAdditionalInfo: '',
        paymentItems: <PaymentItem>[],
        salesDistrict: '',
        footer: '',
        headerLogoPath: '',
        pleaseNote: '',
        header: '',
      );

  BankBeneficiary get firstBankBeneficiary =>
      bankBeneficiary.firstOrNull ?? BankBeneficiary.empty();

  BankBeneficiary get secondBankBeneficiary =>
      (bankBeneficiary.length > 1
          ? bankBeneficiary.elementAtOrNull(1)
          : null) ??
      BankBeneficiary.empty();

  bool get isEmpty => this == PaymentInvoiceInfoPdf.empty();
}
