import 'dart:convert';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> All Credits And Invoices dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/customer_document_details/customerDocumentDetailsResponse.json',
        ),
      );
    });

    test('=> CustomerDocumentDetailDto fromJson and toDomain', () {
      final customerDocumentDetailDto = CustomerDocumentDetailDto.fromJson(
        data['data']['customerDocumentDetails'][0],
      ).toDomain();

      expect(customerDocumentDetailDto.billingDocumentItem, '000010');
      expect(
        customerDocumentDetailDto.principalData.principalCode,
        PrincipalCode('0000140087'),
      );
    });
  });
}
