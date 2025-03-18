import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PaymentSummaryLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PaymentSummaryLocalDataSource();
    },
  );

  group(
    'Payment summary local data source test -',
    () {
      test('get Payment summary ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_summary_list/paymentSummaryListResponse.json',
          ),
        )['data']['customerPayment']['customerPaymentResponse'];

        final expectResult = List.from(data)
            .map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain())
            .toList();

        final result = await localDataSource.getPaymentSummary();

        expect(
          result,
          expectResult,
        );
      });

      test('get transactions', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/list_transactions/listTransactionsResponse.json',
          ),
        )['data']['listTransactions']['TxnSummary'];

        final expectResult = List<Map<String, dynamic>>.from(data)
            .map((e) => TransactionItemDto.fromJson(e).toDomain())
            .toList();

        final result = await localDataSource.getTransactions();

        expect(
          result,
          expectResult,
        );
      });
    },
  );
}
