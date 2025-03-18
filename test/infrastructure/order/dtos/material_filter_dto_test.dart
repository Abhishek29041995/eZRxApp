import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Material Filter ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/get_material_filter/getMaterialFilterResponse.json'),
      );
    });
    test('Test toDomain', () {
      final configs = MaterialFilterDto.fromJson(
        data['data']['GetFilterList'],
      ).toDomain();
      expect(configs.brandList, data['data']['GetFilterList']['BrandList']);
    });
  });
}
