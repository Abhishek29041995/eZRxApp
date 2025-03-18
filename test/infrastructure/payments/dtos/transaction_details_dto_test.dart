import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> transaction details dto test', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/get_transaction/getTransactionResponse.json'),
      );
    });

    test('=>  TransactionDetailsDto fromJson and toDomain', () {
      final transactionsItems = TransactionDetailDto.fromJson(
        data['data']['getTransaction'],
      ).toDomain();

      expect(
        transactionsItems.paymentDate,
        DateTimeStringValue('2021-11-07T11:40:13'),
      );
    });
  });
}
