import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'payment_summary_details.freezed.dart';

@freezed
class PaymentSummaryDetails with _$PaymentSummaryDetails {
  const PaymentSummaryDetails._();

  const factory PaymentSummaryDetails({
    required StringValue paymentID,
    required DateTimeStringValue paymentDate,
    required double paymentAmount,
    required Currency transactionCurrency,
    required String paymentDocument,
    required FilterStatus status,
    required PaymentMethodValue paymentMethod,
    required String iban,
    required String bankIdentification,
    required String bankCountryKey,
    required String bankKey,
    required StringValue bankAccountNumber,
    required StringValue bankName,
    required String paymentCardID,
    required String paymentCardNumber,
    required String paymentCardHolderName,
    required String paymentCardMaskedNumber,
    required String paymentCardTypeName,
    required String customId,
    required DateTimeStringValue createdDate,
    required StringValue zzAdvice,
    required AdviceExpiryValue adviceExpiry,
    required StringValue paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
    required List<PaymentItem> paymentItems,
  }) = _PaymentSummaryDetails;
  factory PaymentSummaryDetails.empty() => PaymentSummaryDetails(
        bankAccountNumber: StringValue(''),
        bankCountryKey: '',
        bankIdentification: '',
        bankKey: '',
        bankName: StringValue(''),
        customId: '',
        iban: '',
        status: FilterStatus(''),
        paymentAmount: 0.0,
        paymentCardHolderName: '',
        paymentCardID: '',
        paymentCardMaskedNumber: '',
        paymentCardNumber: '',
        paymentCardTypeName: '',
        paymentDocument: '',
        paymentID: StringValue(''),
        paymentMethod: PaymentMethodValue(''),
        transactionCurrency: Currency(''),
        paymentDate: DateTimeStringValue(''),
        createdDate: DateTimeStringValue(''),
        adviceExpiry: AdviceExpiryValue(''),
        zzAdvice: StringValue(''),
        paymentBatchAdditionalInfo: StringValue(''),
        accountingDocExternalReference: '',
        paymentItems: <PaymentItem>[],
      );

  factory PaymentSummaryDetails.fromPaymentInvoicePDF(
    PaymentInvoiceInfoPdf invoice,
  ) =>
      PaymentSummaryDetails(
        bankAccountNumber: StringValue(''),
        bankCountryKey: '',
        bankIdentification: '',
        bankKey: '',
        bankName: StringValue(''),
        customId: '',
        iban: '',
        status: FilterStatus(''),
        paymentAmount: invoice.paymentItems.totalInInvoice,
        paymentCardHolderName: '',
        paymentCardID: '',
        paymentCardMaskedNumber: '',
        paymentCardNumber: '',
        paymentCardTypeName: '',
        paymentDocument: '',
        paymentID: StringValue(invoice.paymentID),
        paymentMethod: invoice.paymentMethod,
        transactionCurrency: Currency(
          invoice.paymentItems.firstOrNull?.transactionCurrency ?? '',
        ),
        paymentDate: invoice.valueDate,
        createdDate: DateTimeStringValue(''),
        adviceExpiry: AdviceExpiryValue(''),
        zzAdvice: StringValue(invoice.zzAdvice),
        paymentBatchAdditionalInfo:
            StringValue(invoice.paymentBatchAdditionalInfo),
        accountingDocExternalReference: '',
        paymentItems: invoice.paymentItems,
      );

  factory PaymentSummaryDetails.fromCreateVirtualAccount(
    CreateVirtualAccount createVirtualAccount,
  ) =>
      PaymentSummaryDetails(
        bankAccountNumber: StringValue(''),
        bankCountryKey: '',
        bankIdentification: '',
        bankKey: '',
        bankName: StringValue(''),
        customId: '',
        iban: '',
        status: FilterStatus(''),
        paymentAmount: 0,
        paymentCardHolderName: '',
        paymentCardID: '',
        paymentCardMaskedNumber: '',
        paymentCardNumber: '',
        paymentCardTypeName: '',
        paymentDocument: '',
        paymentID: StringValue(createVirtualAccount.id),
        paymentMethod: PaymentMethodValue(''),
        transactionCurrency: Currency(''),
        paymentDate: createVirtualAccount.createdOn,
        createdDate: createVirtualAccount.createdOn,
        adviceExpiry: AdviceExpiryValue(''),
        zzAdvice: StringValue(createVirtualAccount.id),
        paymentBatchAdditionalInfo: StringValue(''),
        accountingDocExternalReference: '',
        paymentItems: <PaymentItem>[],
      );

  TRObject get adviceExpiryText => adviceExpiry.isValid()
      ? TRObject(
          'Expires in {day} day(s)',
          arguments: {'day': adviceExpiry.expiryDays.toString()},
        )
      : const TRObject('NA');

  TRObject get idAdviceExpiryText => createdDate.isValid()
      ? TRObject(
          'Expires in {day} day(s)',
          arguments: {
            'day': createdDate.paymentAttentionExpiry.toString(),
          },
        )
      : const TRObject('NA');

  bool get allIdentifierInfoValid =>
      paymentBatchAdditionalInfo.isValid() &&
      zzAdvice.isValid() &&
      paymentID.isValid();

  bool get isEmpty => this == PaymentSummaryDetails.empty();

  bool get displayPaymentDate =>
      paymentDate.isValid() && status.getIsSuccessfulOrProcessed;
}

extension PaymentSummaryListExtension on List<PaymentSummaryDetails> {
  List<PaymentSummaryGroup> get paymentSummaryGroupList {
    return List<PaymentSummaryDetails>.from(this)
        .groupListsBy((item) => item.createdDate)
        .entries
        .map(
          (entry) => PaymentSummaryGroup(
            createdDate: entry.key,
            details: entry.value,
          ),
        )
        .toList();
  }
}
