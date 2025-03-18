import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'BundleName': '',
        'BundleCode': 'fake-code',
        'BundleInformation': [],
      };
    });
    test('Test fromDomain', () {
      final configsDto = PriceBundleDto.fromDomain(
        PriceBundleDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain(),
      );

      expect(configsDto.code, 'fake-code');
    });

    test('Test toJson', () {
      final configsDto = PriceBundleDto.fromDomain(
        PriceBundleDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain(),
      ).toJson();

      expect(configsDto['bundleCode'], 'fake-code');
    });

    test('Test PriceBundleItemDto fromdomain', () {
      final data = {
        'Type': 'fake-type',
        'Sequence': 12,
        'Quantity': 1,
        'Rate': 10,
      };
      final configsDtoMap = PriceBundleItemDto.fromDomain(
        PriceBundleItemDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain(),
      );
      expect(configsDtoMap.sequence, 12);
    });

    test('Test PriceBundleItemDto fromdomain', () {
      final data = {
        'Type': 'fake-type',
        'Sequence': 12,
        'Quantity': 1,
        'Rate': 10,
      };
      final configsDtoMap = PriceBundleItemDto.fromDomain(
        PriceBundleItemDto.fromJson(makeResponseCamelCase(jsonEncode(data)))
            .toDomain(),
      ).toJson();
      expect(configsDtoMap['sequence'], 12);
    });
  });
}
