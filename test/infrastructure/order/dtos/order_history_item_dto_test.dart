import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_item_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = {
        'Status': 'NA',
        'MaterialCode': 'fake-code',
        'MaterialDescription': 'fake-desc',
        'Qty': 10,
        'UnitPrice': 10.0,
        'TotalPrice': 20.0,
        'DeliveryDate': '',
        'DeliveryTime': 'fake-time',
        'LineNumber': '1',
        'Tax': 0,
        'OrderType': 'fake-type',
        'OrderNumber': 'fake-number',
        'EZRXNumber': '',
        'CreatedDate': '20240703',
        'CreatedTime': '010101',
        'OrderBy': '',
        'PurchaseOrderType': '',
        'DefaultMaterialDescription': ' PE MAB MG HIL-7R-M21            1S',
        'WarehouseStorageCondition': 'CO',
        'Available': true,
        'Batch': '3071692',
        'ExpiryDate': '20240131',
        'IsMarketplace': false,
        'Seller': 'Zuellig Pharma',
        'POReference': '',
        'ManufactureName': 'Becton Dickinson Holdings Pte Ltd',
        'InvoiceNumber': '',
        'IsBonusMaterial': false,
        'GovernmentMaterialCode': '',
        'TelephoneNumber': '66011477',
      };
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryItemDto.fromDomain(
        OrderHistoryItemDto.fromJson(
          makeResponseCamelCase(
            jsonEncode(data),
          ),
        ).toDomain(),
      );
      expect(configsDto.materialNumber, 'fake-code');
      expect(configsDto.createdDate, '03 Jul 2024');
    });

    // test('Test toJson', () {
    //   final configsDto = OrderHistoryItemDto.fromDomain(OrderHistoryItemDto.fromJson(
    //               data)
    //           .toDomain())
    //       .toJson();

    //   expect(configsDto['MaterialCode'], 'fake-code');
    // });
  });
}
