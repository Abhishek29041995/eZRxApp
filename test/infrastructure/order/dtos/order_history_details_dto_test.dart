import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test OrderHistoryDetailsDto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/get_order_details/getOrderDetailsResponse.json'),
      );
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsDto.fromDomain(
        OrderHistoryDetailsDto.fromJson(
          makeResponseCamelCase(
            jsonEncode(data['data']['orderHistoryV3']['orderHeaders'][0]),
          ),
        ).toDomain(),
      );

      expect(configs.type, 'ZPOR');
    });

    test('Test tojson', () {
      final configs = OrderHistoryDetailsDto.fromDomain(
        OrderHistoryDetailsDto.fromJson(
          makeResponseCamelCase(
            jsonEncode(data['data']['orderHistoryV3']['orderHeaders'][0]),
          ),
        ).toDomain(),
      ).toJson();

      expect(configs['eZRXNumber'], 'EZRX-1720e3e');
    });
  });
}
