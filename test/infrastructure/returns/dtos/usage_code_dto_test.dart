import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/usage_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test Usage Code dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/get_usage_list/getUsageListResponse.json'),
      );
    });

    test('=> Usage Code fromDomain', () {
      final usageDto = UsageDto.fromDomain(
        UsageDto.fromJson(
          data['data']['usage'][0],
        ).toDomain(),
      );
      expect(usageDto.usageCode, 'C13');
    });

    test('=> Usage Code toJson', () {
      final usageItemMap = UsageDto.fromDomain(
        UsageDto.fromJson(
          data['data']['usage'][0],
        ).toDomain(),
      ).toJson();
      expect(usageItemMap['usageCode'], 'C13');
    });

    test('=> Usage Code toDomain', () {
      final usageItem = UsageDto.fromJson(
        data['data']['usage'][0],
      ).toDomain();
      expect(usageItem.usageCode, 'C13');
    });
  });
}
