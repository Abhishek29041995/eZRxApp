import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_invoice_dto.freezed.dart';
part 'customer_invoice_dto.g.dart';

@freezed
class CustomerInvoiceDto with _$CustomerInvoiceDto {
  const CustomerInvoiceDto._();

  const factory CustomerInvoiceDto({
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'accountingDocument', defaultValue: '')
        required String accountingDocument,
    @JsonKey(name: 'bpCustomerNumber') required String bpCustomerNumber,
    @JsonKey(name: 'debitCreditFlag', defaultValue: '')
        required String debitCreditFlag,
    @JsonKey(name: 'discountAmount', defaultValue: '')
        required String discountAmount,
    @JsonKey(name: 'discountDate', defaultValue: '')
        required String discountDate,
    @JsonKey(name: 'displayAmount', defaultValue: '')
        required String displayAmount,
    @JsonKey(name: 'displayCurrency', defaultValue: '')
        required String displayCurrency,
    @JsonKey(name: 'displayOpenAmount', defaultValue: '')
        required String displayOpenAmount,
    @JsonKey(name: 'dueDate', defaultValue: '') required String dueDate,
    @JsonKey(name: 'fiscalYear', defaultValue: '') required String fiscalYear,
    @JsonKey(name: 'isDisputed', defaultValue: '') required String isDisputed,
    @JsonKey(name: 'lineItemNumber', defaultValue: '')
        required String lineItemNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
        required String partialPaymentHistoryDesc,
    @JsonKey(name: 'paymentAmount', defaultValue: '')
        required String paymentAmount,
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
  }) = _CustomerInvoiceDto;

  factory CustomerInvoiceDto.fromDomain(
    CustomerOpenItem customerOpenItem,
  ) =>
      CustomerInvoiceDto(
        accountingDocExternalReference:
            customerOpenItem.accountingDocExternalReference,
        accountingDocument: customerOpenItem.accountingDocument,
        bpCustomerNumber: customerOpenItem.bpCustomerNumber,
        debitCreditFlag: customerOpenItem.debitCreditCode,
        discountAmount:
            customerOpenItem.cashDiscountAmountInDspCrcy.toStringAsFixed(2),
        discountDate: customerOpenItem.cashDiscountDueDate.getValue(),
        displayAmount:
            customerOpenItem.totalAmountInDisplayCrcy.toStringAsFixed(2),
        displayOpenAmount:
            customerOpenItem.openAmountInDisplayCrcy.toStringAsFixed(2),
        displayCurrency: customerOpenItem.displayCurrency.code,
        dueDate: customerOpenItem.netDueDate.getValue(),
        fiscalYear: customerOpenItem.fiscalYear,
        isDisputed: customerOpenItem.isDisputed,
        lineItemNumber: customerOpenItem.accountingDocumentItem,
        lineNumber: customerOpenItem.accountingDocumentItemRef,
        partialPaymentHistoryDesc: customerOpenItem.partialPaymentHistoryDesc,
        paymentAmount:
            customerOpenItem.paymentAmountInDisplayCrcy.toStringAsFixed(2),
        salesOrg: customerOpenItem.companyCode,
      );

  factory CustomerInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerInvoiceDtoFromJson(json);
}
