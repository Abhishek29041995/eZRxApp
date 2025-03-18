import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Payment Invoice Info Pdf dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/payment_invoice_info_pdf/paymentInvoiceInfoPdfResponse.json',
        ),
      );
    });

    test('PaymentInfoDto fromJson and toDomain', () {
      final paymentInvoiceInfoPdfDto =
          PaymentInvoiceInfoPdfDto.fromJson(data['data']['paymentInvoicePdf'])
              .toDomain();

      expect(paymentInvoiceInfoPdfDto.zzAdvice, '09EZ230000977801');
    });
  });
}
