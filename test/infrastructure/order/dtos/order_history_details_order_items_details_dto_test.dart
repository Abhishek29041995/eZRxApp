import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_details_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Order History Details order item details Dto ', () {
    setUp(() async {
      data = {
        'DiscountCode': 'fake-code',
        'DiscountDescription': 'fake-desc',
        'Rate': 'fake-rate',
      };
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsOrderItemDetailsDto.fromDomain(
        OrderHistoryDetailsOrderItemDetailsDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      );

      expect(configs.rate, 'fake-rate');
    });

    test('Test tojson', () {
      final configs = OrderHistoryDetailsOrderItemDetailsDto.fromDomain(
        OrderHistoryDetailsOrderItemDetailsDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      ).toJson();

      expect(configs['rate'], 'fake-rate');
    });
  });
}
