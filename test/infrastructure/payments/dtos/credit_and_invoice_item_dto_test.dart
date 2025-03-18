import 'dart:convert';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> All Credits And Invoices dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json'),
      );
    });

    test('=> CreditAndInvoiceItemDto fromJson and toDomain', () {
      final creditAndInvoiceItemDto = CreditAndInvoiceItemDto.fromJson(
        data['data']['customerDocumentHeaderV2']['documentHeaderList'][0],
      ).toDomain();

      expect(
        creditAndInvoiceItemDto.searchKey,
        StringValue('1100001442'),
      );
      expect(
        creditAndInvoiceItemDto.debitCreditCode,
        DebitCreditCode('S'),
      );
      expect(
        creditAndInvoiceItemDto.referenceId,
        ReferenceId(''),
      );
    });
  });
}
