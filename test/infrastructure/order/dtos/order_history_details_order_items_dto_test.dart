import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Order History Details order item details Dto ', () {
    setUp(() async {
      data = {
        'Type': 'fake-type',
        'MaterialCode': 'fake-code',
        'MaterialDescription': 'fake-desc',
        'Qty': 10,
        'UnitPrice': 10.0,
        'TotalPrice': 200.0,
        'HidePrice': true,
        'Tax': 0,
        'SAPStatus': 'fake-status',
        'PlannedDeliveryDate': 'fake-date',
        'Batch': 'fake-batch',
        'ExpiryDate': 'fake-date',
        'LineReferenceNotes': '',
        'IsTenderContractMaterial': false,
        'Details': [],
        'TenderContractDetails': <String, dynamic>{},
        'TotalUnitPrice': 200.0,
        'TotalTax': 0.0,
        'TaxRate': ['0'],
        'Batches': [
          {
            'BatchNumber': 'fake-batch',
            'ExpiryDate': '20241231',
          }
        ],
      };
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsOrderItemDto.fromDomain(
        OrderHistoryDetailsOrderItemDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      );

      expect(configs.batches.first.batchNumber, 'fake-batch');
      expect(configs.batches.first.expiryDate, '20241231');
      expect(configs.hidePrice, true);
      expect(configs.totalUnitPrice, 200.0);
      expect(configs.totalTax, 0.0);
      expect(configs.taxRate, 0.0);
    });

    test('Test tojson', () {
      final configs = OrderHistoryDetailsOrderItemDto.fromDomain(
        OrderHistoryDetailsOrderItemDto.fromJson(
          makeResponseCamelCase(jsonEncode(data)),
        ).toDomain(),
      ).toJson();

      expect(configs['batches'][0]['batchNumber'], 'fake-batch');
      expect(configs['batches'][0]['expiryDate'], '20241231');
      expect(configs['hidePrice'], true);
      expect(configs['totalUnitPrice'], 200.0);
      expect(configs['totalTax'], 0.0);
      expect(configs['taxRate'], 0.0);
    });
  });
}
