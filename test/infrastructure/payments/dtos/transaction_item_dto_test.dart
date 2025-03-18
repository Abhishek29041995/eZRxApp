import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> transaction item dto test', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/list_transactions/listTransactionsResponse.json'),
      );
    });

    test('=>  TransactionItemDto fromJson and toDomain', () {
      final transactionsItems = List<Map<String, dynamic>>.from(
        data['data']['listTransactions']['TxnSummary'],
      ).map((e) => TransactionItemDto.fromJson(e).toDomain()).toList();

      expect(transactionsItems.length, 15);

      expect(
        transactionsItems.first.paymentDate,
        DateTimeStringValue('2021-11-07T11:40:13'),
      );
    });
  });
}
