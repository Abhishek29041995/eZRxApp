import 'dart:convert';

import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // late dynamic data;
  late dynamic similarProductsData;
  group('Test Material Dto ', () {
    setUp(() async {
      similarProductsData = json.decode(
        await rootBundle.loadString(
          'assets/json/similar_searches/similarSearchesResponse.json',
        ),
      );
    });

    test('Test Similar Products toDomain for hidePrice', () {
      final finalData = makeResponseCamelCase(
        jsonEncode(similarProductsData['data']['GetAllProducts']['Products']),
      );

      final similarProducts = List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
      expect(similarProducts.first.hidePrice, true);
    });

    test('Test Similar Products toDomain for type material', () {
      final finalData = makeResponseCamelCase(
        jsonEncode(similarProductsData['data']['GetAllProducts']['Products']),
      );

      final similarProducts = List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
      expect(similarProducts.first.type.getValue(), 'material');
    });
  });
}
