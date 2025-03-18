import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Credit And Invoice Item', () {
    const fakeDebitCreditCode = 'fake-debit-credit-code';
    const fakeReferenceId = 'fake-reference-id';
    final paymentStatus = CreditAndInvoiceItem.empty().copyWith(
      debitCreditCode: DebitCreditCode(fakeDebitCreditCode),
      referenceId: ReferenceId(fakeReferenceId),
    );

    expect(paymentStatus.debitCreditCode, DebitCreditCode(fakeDebitCreditCode));
    expect(
      paymentStatus.referenceId,
      ReferenceId(fakeReferenceId),
    );
  });
}
