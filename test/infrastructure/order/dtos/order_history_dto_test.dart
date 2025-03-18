import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test order history details shipping info ', () {
    setUp(() async {
      final response = json.decode(
        await rootBundle.loadString(
          'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
        ),
      );

      data = makeResponseCamelCase(
        jsonEncode(
          response['data']['orderHistoryFetchByItems']['OrderHistory'][0],
        ),
      );
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDto.fromDomain(
        OrderHistoryDto.fromJson(
          data,
        ).toDomain(),
      );
      expect(configsDto.orderBasicInformation.shipTo, '0070149863');
    });

    test('Test toJson', () {
      final configsDto = OrderHistoryDto.fromDomain(
        OrderHistoryDto.fromJson(
          data,
        ).toDomain(),
      ).toJson();

      expect(configsDto['orderBasicInformation']['shipTo'], '0070149863');
    });
  });
}
