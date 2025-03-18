import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CreditAndInvoiceDetailsLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = CreditAndInvoiceDetailsLocalDataSource();
    },
  );

  group(
    'Invoice Details Local Datasource Test',
    () {
      test(
        'get Invoice Details',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_document_details/customerDocumentDetailsResponse.json',
            ),
          );
          final details = res['data']['customerDocumentDetails'];
          final data = <CustomerDocumentDetail>[];
          for (final dynamic detail in details) {
            data.add(CustomerDocumentDetailDto.fromJson(detail).toDomain());
          }
          final result = await localDataSource.getCreditAndInvoiceDetails();
          expect(
            result,
            data,
          );
        },
      );
    },
  );
}
