import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Testprice tier dto ', () {
    setUp(() async {
      data = {
        'Tier': '',
        'PriceTier': [
          {
            'Type': '',
            'Sequence': 0,
            'ApplyBonus': true,
            'Quantity': 10,
            'Rate': 0,
          }
        ],
      };
    });
    test('Test fromDomain', () {
      final configs = PriceTierDto.fromDomain(
        PriceTierDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain().items,
      );
      expect(configs.items[0].quantity, 10);
    });

    test('Test tojson', () {
      final configs = PriceTierDto.fromDomain(
        PriceTierDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain().items,
      ).toJson();
      expect(configs['priceTier'][0]['quantity'], 10);
    });

    test('Test pricetieritem fromDomain', () {
      final configs = PriceTierItemDto.fromDomain(
        PriceTierItemDto.fromJson(
          makeResponseCamelCase(jsonEncode(data['PriceTier'][0])),
        ).toDomain(),
      );
      expect(configs.quantity, 10);
    });

    test('Test pricetieritem tojson', () {
      final configs = PriceTierItemDto.fromDomain(
        PriceTierItemDto.fromJson(
          makeResponseCamelCase(jsonEncode(data['PriceTier'][0])),
        ).toDomain(),
      ).toJson();
      expect(configs['quantity'], 10);
    });
  });
}
