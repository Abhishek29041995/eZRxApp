import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';

part 'credit_and_invoice_item_dto.freezed.dart';
part 'credit_and_invoice_item_dto.g.dart';

@freezed
class CreditAndInvoiceItemDto with _$CreditAndInvoiceItemDto {
  const CreditAndInvoiceItemDto._();
  factory CreditAndInvoiceItemDto({
    @JsonKey(
      name: 'bpCustomerNumber',
      defaultValue: '',
    )
        required String bpCustomerNumber,
    @JsonKey(
      name: 'fiscalYear',
      defaultValue: '',
    )
        required String fiscalYear,
    @JsonKey(
      name: 'accountingDocument',
      defaultValue: '',
    )
        required String accountingDocument,
    @JsonKey(
      name: 'accountingDocumentItem',
      defaultValue: '',
    )
        required String accountingDocumentItem,
    @JsonKey(
      name: 'accountingDocumentType',
      defaultValue: '',
    )
        required String accountingDocumentType,
    @JsonKey(
      name: 'postingKeyName',
      defaultValue: '',
    )
        required String postingKeyName,
    @JsonKey(
      name: 'netDueDate',
      defaultValue: '',
    )
        required String netDueDate,
    @JsonKey(
      name: 'postingDate',
      defaultValue: '',
    )
        required String postingDate,
    @JsonKey(
      name: 'referenceDocumentNumber',
      defaultValue: '',
    )
        required String referenceDocumentNumber,
    @JsonKey(
      name: 'documentDate',
      defaultValue: '',
    )
        required String documentDate,
    @JsonKey(
      name: 'amountInTransactionCurrency',
      defaultValue: 0.0,
    )
        required double amountInTransactionCurrency,
    @JsonKey(
      name: 'deliveryFee',
      defaultValue: 0.0,
    )
        required double deliveryFee,
    @JsonKey(
      name: 'discount',
      defaultValue: 0.0,
    )
        required double discount,
    @JsonKey(
      name: 'manualFee',
      defaultValue: 0.0,
    )
        required double manualFee,
    @JsonKey(
      name: 'taxAmount',
      defaultValue: 0.0,
    )
        required double taxAmount,
    @JsonKey(
      name: 'invoiceReference',
      defaultValue: '',
    )
        required String invoiceReference,
    @JsonKey(
      name: 'invoiceProcessingStatus',
      defaultValue: '',
    )
        required String invoiceProcessingStatus,
    @JsonKey(
      name: 'debitCreditCode',
      defaultValue: '',
    )
        required String debitCreditCode,
    @JsonKey(
      name: 'referenceId',
      defaultValue: '',
    )
        required String referenceId,
    @JsonKey(name: 'documentReferenceID', defaultValue: '')
        required String documentReferenceID,
    @JsonKey(
      name: 'grossAmount',
      defaultValue: 0.0,
    )
        required double grossAmount,
    @JsonKey(
      name: 'netAmount',
      defaultValue: 0.0,
    )
        required double netAmount,
    @JsonKey(
      name: 'orderId',
      defaultValue:'',
    )
        required String orderId,    
  }) = _CreditAndInvoiceItemDto;

  CreditAndInvoiceItem toDomain() {
    return CreditAndInvoiceItem(
      bpCustomerNumber: bpCustomerNumber,
      fiscalYear: fiscalYear,
      searchKey: StringValue(accountingDocument),
      accountingDocumentItem: accountingDocumentItem,
      accountingDocumentType: accountingDocumentType,
      postingKeyName: postingKeyName,
      netDueDate: DateTimeStringValue(netDueDate),
      postingDate: DateTimeStringValue(postingDate),
      referenceDocumentNumber: StringValue(referenceDocumentNumber),
      documentDate: DateTimeStringValue(documentDate),
      amountInTransactionCurrency: amountInTransactionCurrency,
      deliveryFee: deliveryFee,
      discount: discount,
      manualFee: manualFee,
      taxAmount: taxAmount,
      grossAmount: grossAmount,
      netAmount: netAmount,
      invoiceReference: StringValue(invoiceReference),
      invoiceProcessingStatus: StatusType(invoiceProcessingStatus),
      orderId: StringValue(orderId),
      debitCreditCode: DebitCreditCode(debitCreditCode),
      referenceId: ReferenceId(referenceId),
      documentReferenceID: StringValue(documentReferenceID),
    );
  }

  factory CreditAndInvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreditAndInvoiceItemDtoFromJson(json);
}
