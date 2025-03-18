import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AllCreditsAndInvoicesLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AllCreditsAndInvoicesLocalDataSource();
    },
  );

  group(
    'All credits and invoices Local Datasource Test',
    () {
      test(
        'get all credits and invoices',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
            ),
          );
          final result = await localDataSource.getDocumentHeaderList();

          final expectResult = <CreditAndInvoiceItem>[];
          for (final dynamic item in res['data']['customerDocumentHeaderV2']
              ['documentHeaderList']) {
            expectResult.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
          }
          expect(
            result,
            expectResult,
          );
        },
      );
    },
  );
}
