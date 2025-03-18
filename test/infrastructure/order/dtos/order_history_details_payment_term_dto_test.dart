import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_payment_term_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details payment Term ', () {
    setUp(() async {
      data = {
        'PaymentTermCode': '7615757',
        'PaymentTermDescription': 'fake-ref-desc',
      };
    });
    test('Test toDomain', () {
      final configs = OrderHistoryDetailsPaymentTermDto.fromJson(
        makeResponseCamelCase(jsonEncode(data)),
      ).toDomain();

      expect(configs.paymentTermCode.displayPaymentTermCode, '7615757');
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDetailsPaymentTermDto.fromDomain(
        OrderHistoryDetailsPaymentTermDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      );
      expect(configsDto.paymentTermCode, '7615757');
    });

    test('Test tojson', () {
      final configsDto = OrderHistoryDetailsPaymentTermDto.fromDomain(
        OrderHistoryDetailsPaymentTermDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      ).toJson();
      expect(configsDto['paymentTermCode'], '7615757');
    });
  });
}
