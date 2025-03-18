import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EInvoiceLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = EInvoiceLocalDataSource();
    },
  );

  test('get e invoice ', () async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/listSoaResponse.json',
      ),
    )['data'];

    final expectResult = ECreditInvoiceDto.fromJson(data.first).toDomain();

    final result = await localDataSource.getEInvoice();

    expect(
      result,
      expectResult,
    );
  });
}
