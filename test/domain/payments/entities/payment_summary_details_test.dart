import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final invoicePdf =
      await NewPaymentLocalDataSource().getPaymentInvoiceInfoPdf();

  test('Payment summary detail from invoice pdf', () {
    final paymentSummaryDetail =
        PaymentSummaryDetails.fromPaymentInvoicePDF(invoicePdf);

    expect(paymentSummaryDetail.paymentAmount, 4971.29);
  });
}
