import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  setUpAll(() async {
    data = json.decode(
      await rootBundle.loadString(
        'assets/json/search_return_materials_v2/searchReturnMaterialsV2Response.json',
      ),
    );
  });

  group('Return Material DTO ', () {
    test('Test toDomain', () {
      final item = ReturnMaterialDto.fromJson(
        data['data']['searchReturnMaterialsV2']['materials'][0]['item'],
      ).toDomain();
      expect(item.outsidePolicy, true);
    });

    test('Test fromDomain', () {
      final item = ReturnMaterialDto.fromDomain(
        ReturnMaterialDto.fromJson(
          data['data']['searchReturnMaterialsV2']['materials'][0]['item'],
        ).toDomain(),
      );
      expect(item.outsidePolicy, true);
    });
  });
}
