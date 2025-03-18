import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PaymentInProgressLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PaymentInProgressLocalDataSource();
    },
  );

  group(
    'Payment in progress Local Datasource Test',
    () {
      test(
        'Payment in progress Local Datasource',
        () async {
          final result = await localDataSource.getPaymentInProgress();
          expect(
            result.length,
            1,
          );
        },
      );
    },
  );
}
