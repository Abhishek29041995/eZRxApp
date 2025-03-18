import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/payment_term_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test payment term ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/common/getPaymentTermsResponse.json'),
      );
    });

    test('Test fromDomain', () {
      final configsDto = PaymentTermDto.fromDomain(
        PaymentTermDto.fromJson(data['data']['availablePaymentTerm'][0])
            .toDomain(),
      );
      expect(configsDto.paymentTermCode, '0001');
    });

    test('Test toJson', () {
      final configsDto = PaymentTermDto.fromDomain(
        PaymentTermDto.fromJson(data['data']['availablePaymentTerm'][0])
            .toDomain(),
      ).toJson();
      expect(configsDto['paymentTermCode'], '0001');
    });
  });
}
