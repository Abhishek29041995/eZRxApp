import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_open_item.freezed.dart';

@freezed
class CustomerOpenItem with _$CustomerOpenItem {
  const CustomerOpenItem._();

  factory CustomerOpenItem({
    required StatusType status,
    required String accountingDocument,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue documentDate,
    required double amountInTransactionCurrency,
    required StringValue documentReferenceID,
    required String postingKeyName,
    required Currency transactionCurrency,
    required String accountingDocExternalReference,
    required String bpCustomerNumber,
    required String debitCreditCode,
    required double cashDiscountAmountInDspCrcy,
    required DateTimeStringValue cashDiscountDueDate,
    required double totalAmountInDisplayCrcy,
    required Currency displayCurrency,
    required double openAmountInDisplayCrcy,
    required String fiscalYear,
    required String isDisputed,
    required String accountingDocumentItem,
    required String accountingDocumentItemRef,
    required String partialPaymentHistoryDesc,
    required double paymentAmountInDisplayCrcy,
    required String billingDocument,
    required String companyCode,
    required double openAmountInTransCrcy,
    required StringValue orderId,
    required DateTimeStringValue postingDate,
  }) = _CustomerOpenItem;

  factory CustomerOpenItem.empty() => CustomerOpenItem(
        status: StatusType(''),
        amountInTransactionCurrency: 0.0,
        accountingDocument: '',
        postingKeyName: '',
        transactionCurrency: Currency(''),
        netDueDate: DateTimeStringValue(''),
        documentDate: DateTimeStringValue(''),
        documentReferenceID: StringValue(''),
        accountingDocExternalReference: '',
        bpCustomerNumber: '',
        debitCreditCode: '',
        cashDiscountAmountInDspCrcy: 0,
        cashDiscountDueDate: DateTimeStringValue(''),
        totalAmountInDisplayCrcy: 0,
        displayCurrency: Currency(''),
        openAmountInDisplayCrcy: 0,
        fiscalYear: '',
        isDisputed: '',
        accountingDocumentItem: '',
        accountingDocumentItemRef: '',
        partialPaymentHistoryDesc: '',
        paymentAmountInDisplayCrcy: 0,
        companyCode: '',
        openAmountInTransCrcy: 0,
        orderId: StringValue(''),
        billingDocument: '',
        postingDate: DateTimeStringValue(''),
      );
}

extension CustomerOpenItemListExtension on List<CustomerOpenItem> {
  double get amountTotal => fold<double>(
        0,
        (sum, item) => sum + item.openAmountInTransCrcy,
      );

  bool isEqual(List<CustomerOpenItem> list) {
    final set1 = Set<CustomerOpenItem>.from(list);
    final set2 = Set<CustomerOpenItem>.from(this);

    return set1.containsAll(set2) && set2.containsAll(set1);
  }

  List<CustomerOpenItem> get sortWithDocumentDate {
    final customerOpenItemsSorted = [...this];
    customerOpenItemsSorted.sort(
      (a, b) => DateTime.parse(a.documentDate.getValue())
          .compareTo(DateTime.parse(b.documentDate.getValue())),
    );

    return customerOpenItemsSorted;
  }
}
