import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_limit_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_balance_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AccountSummaryLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AccountSummaryLocalDataSource();
    },
  );

  group(
    'Account summary local data source test -',
    () {
      test('Fetch invoice summary ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/get_outstanding_balance/getOutstandingBalanceResponse.json',
          ),
        )['data']['outstandingBalance']['results'];

        final expectResult =
            OutstandingBalanceDto.fromJson(data.first).toDomain();

        final result = await localDataSource.fetchInvoiceSummary();
        expect(
          result,
          expectResult,
        );
      });

      test('Fetch invoice summary ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/get_credit_limit/getCreditLimitResponse.json',
          ),
        )['data']['creditLimit']['results'];

        final expectResult = CreditLimitDto.fromJson(data.first).toDomain;

        final result = await localDataSource.fetchCreditSummary();

        expect(
          result,
          expectResult,
        );
      });
    },
  );
}
