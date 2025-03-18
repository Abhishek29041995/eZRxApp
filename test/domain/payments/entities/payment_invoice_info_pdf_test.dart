import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Payment Invoice Info Pdf', () {
    final paymentStatus = PaymentInvoiceInfoPdf.empty().copyWith(
      zzAdvice: 'fake-advice',
    );

    expect(paymentStatus.zzAdvice, 'fake-advice');
  });
}
