import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/submit_order/submitOrderResponse.json'),
      );
    });
    test('Test fromDomain', () {
      final configsDto = SubmitOrderResponseDto.fromDomain(
        SubmitOrderResponseDto.fromJson(data['data']['submitOrder']).toDomain(),
      );

      expect(configsDto.salesDocument, '27faf203-62e6-43cf-a9cc-9edd3e22d032');
    });

    test('Test toJson', () {
      final configsDto = SubmitOrderResponseDto.fromDomain(
        SubmitOrderResponseDto.fromJson(data['data']['submitOrder']).toDomain(),
      ).toJson();

      expect(
        configsDto['SalesDocument'],
        '27faf203-62e6-43cf-a9cc-9edd3e22d032',
      );
    });
  });
}
