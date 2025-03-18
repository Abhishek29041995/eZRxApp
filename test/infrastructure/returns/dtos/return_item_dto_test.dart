import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  setUpAll(() async {
    data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_return_by_item/getReturnByItemsResponse.json',
      ),
    );
  });

  group('Return Item DTO ', () {
    test('Test toDomain', () {
      final item = ReturnItemDto.fromJson(
        data['data']['requestsByItems']['returnRequestsByItems'][0]
            ['requestByItems'][0],
      ).toDomain();
      expect(item.outsidePolicy, true);
    });

    test('Test fromDomain', () {
      final item = ReturnItemDto.fromDomain(
        ReturnItemDto.fromJson(
          data['data']['requestsByItems']['returnRequestsByItems'][0]
              ['requestByItems'][0],
        ).toDomain(),
      );
      expect(item.outsidePolicy, true);
    });
  });
}
