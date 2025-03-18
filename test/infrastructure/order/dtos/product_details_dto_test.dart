import 'package:ezrxmobile/infrastructure/order/dtos/product_detail_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test ProductDetailDto ', () {
    setUp(() async {
      data = {
        'isFavourite': true,
       
      };
    });
    test('Test toDomain', () {
      final configs = ProductDetailDto.fromJson(
        data,
      ).toDomain();
      expect(configs.isFavourite, true);
    });

    test('Test fromDomain', () {
      final configs = ProductDetailDto.fromJson(
        data,
      ).toDomain();
     expect(configs.isFavourite, true);
    });
  });
}
