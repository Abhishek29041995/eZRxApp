import 'dart:convert';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details order items tender contract details ', () {
    setUp(() async {
      data = {
        'ContractNumber': '7615757',
        'ContractReference': 'fake-referencenumber',
      };
    });
    test('Test toDomain', () {
      final configs = OrderHistoryDetailsTenderContractDto.fromJson(
        makeResponseCamelCase(jsonEncode(data)),
      ).toDomain();

      expect(
        configs.contractNumber,
        TenderContractNumber('7615757'),
      );
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDetailsTenderContractDto.fromDomain(
        OrderHistoryDetailsTenderContractDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      );
      expect(configsDto.contractNumber, '7615757');
    });

    test('Test tojson', () {
      final configsDto = OrderHistoryDetailsTenderContractDto.fromDomain(
        OrderHistoryDetailsTenderContractDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      ).toJson();
      expect(configsDto['contractNumber'], '7615757');
    });
  });
}
