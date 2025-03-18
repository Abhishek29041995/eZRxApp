import 'dart:convert';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> All Credits dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json'),
      );
    });

    test('=> Customer DocumentHeader fromDomain', () {
      final expectResult = <CreditAndInvoiceItem>[];
      for (final dynamic item in data['data']['customerDocumentHeaderV2']
          ['documentHeaderList']) {
        expectResult.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
      }
      expect(
        expectResult.length,
        10,
      );
    });
  });
}
