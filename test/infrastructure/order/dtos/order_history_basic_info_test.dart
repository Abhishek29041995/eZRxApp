import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_basic_info_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'SoldTo': 'fake-soldto',
        'ShipTo': 'fake-shipto',
        'CompanyName': 'fake-companyname',
        'PaymentTerm': {
          'PaymentTermCode': 'E001',
          'PaymentTermDescription': '30 days from end-of-Month',
        },
      };
    });
    test('Test toDomain', () {
      final configs = OrderHistoryBasicInfoDto.fromJson(
        makeResponseCamelCase(jsonEncode(data)),
      ).toDomain();
      expect(configs.companyName.getOrCrash(), 'fake-companyname');
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryBasicInfoDto.fromJson(
        makeResponseCamelCase(jsonEncode(data)),
      ).toDomain();
      // final res = OrderHistoryBasicInfoDto.fromDomain(configs);
      expect(configs.companyName.getOrCrash(), 'fake-companyname');
    });
  });
}
