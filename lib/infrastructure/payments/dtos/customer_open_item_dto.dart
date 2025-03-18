import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_open_item_dto.freezed.dart';
part 'customer_open_item_dto.g.dart';

@freezed
class CustomerOpenItemDto with _$CustomerOpenItemDto {
  const CustomerOpenItemDto._();

  factory CustomerOpenItemDto({
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'accountingDocument', defaultValue: '')
        required String accountingDocument,
    @JsonKey(name: 'netDueDate', defaultValue: '') required String netDueDate,
    @JsonKey(name: 'documentDate', defaultValue: '')
        required String documentDate,
    @JsonKey(name: 'postingDate', defaultValue: '') required String postingDate,
    @JsonKey(name: 'documentReferenceID', defaultValue: '')
        required String documentReferenceID,
    @JsonKey(name: 'postingKeyName', defaultValue: '')
        required String postingKeyName,
    @JsonKey(name: 'amountInTransactionCurrency', defaultValue: 0)
        required double amountInTransactionCurrency,
    @JsonKey(name: 'transactionCurrency', defaultValue: 'MYR')
        required String transactionCurrency,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'bpCustomerNumber', defaultValue: '')
        required String bpCustomerNumber,
    @JsonKey(name: 'debitCreditCode', defaultValue: '')
        required String debitCreditCode,
    @JsonKey(name: 'cashDiscountAmountInDspCrcy', defaultValue: 0)
        required double cashDiscountAmountInDspCrcy,
    @JsonKey(name: 'cashDiscountDueDate', defaultValue: '')
        required String cashDiscountDueDate,
    @JsonKey(name: 'totalAmountInDisplayCrcy', defaultValue: 0)
        required double totalAmountInDisplayCrcy,
    @JsonKey(name: 'displayCurrency', defaultValue: '')
        required String displayCurrency,
    @JsonKey(name: 'openAmountInDisplayCrcy', defaultValue: 0)
        required double openAmountInDisplayCrcy,
    @JsonKey(name: 'fiscalYear', defaultValue: '') required String fiscalYear,
    @JsonKey(name: 'isDisputed', defaultValue: '') required String isDisputed,
    @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
        required String accountingDocumentItem,
    @JsonKey(name: 'accountingDocumentItemRef', defaultValue: '')
        required String accountingDocumentItemRef,
    @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
        required String partialPaymentHistoryDesc,
    @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
        required double paymentAmountInDisplayCrcy,
    @JsonKey(name: 'companyCode', defaultValue: '') required String companyCode,
    @JsonKey(name: 'billingDocument', defaultValue: '')
        required String billingDocument,
    @JsonKey(name: 'openAmountInTransCrcy', defaultValue: 0)
        required double openAmountInTransCrcy,
    @JsonKey(name: 'orderId', defaultValue: '') required String orderId,
  }) = _CustomerOpenItemDto;

  CustomerOpenItem toDomain() {
    return CustomerOpenItem(
      status: StatusType(status),
      amountInTransactionCurrency: amountInTransactionCurrency,
      accountingDocument: accountingDocument,
      postingKeyName: postingKeyName,
      netDueDate: DateTimeStringValue(netDueDate),
      documentDate: DateTimeStringValue(documentDate),
      documentReferenceID: StringValue(documentReferenceID),
      transactionCurrency: Currency(transactionCurrency),
      accountingDocExternalReference: accountingDocExternalReference,
      bpCustomerNumber: bpCustomerNumber,
      debitCreditCode: debitCreditCode,
      cashDiscountAmountInDspCrcy: cashDiscountAmountInDspCrcy,
      cashDiscountDueDate: DateTimeStringValue(cashDiscountDueDate),
      totalAmountInDisplayCrcy: totalAmountInDisplayCrcy,
      displayCurrency: Currency(displayCurrency),
      openAmountInDisplayCrcy: openAmountInDisplayCrcy,
      fiscalYear: fiscalYear,
      isDisputed: isDisputed,
      accountingDocumentItem: accountingDocumentItem,
      accountingDocumentItemRef: accountingDocumentItemRef,
      partialPaymentHistoryDesc: partialPaymentHistoryDesc,
      paymentAmountInDisplayCrcy: paymentAmountInDisplayCrcy,
      companyCode: companyCode,
      openAmountInTransCrcy: openAmountInTransCrcy,
      orderId: StringValue(orderId),
      billingDocument: billingDocument,
      postingDate: DateTimeStringValue(postingDate),
    );
  }

  factory CustomerOpenItemDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerOpenItemDtoFromJson(json);
}
