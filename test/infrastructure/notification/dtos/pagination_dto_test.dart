import 'dart:convert';

import 'package:ezrxmobile/infrastructure/notification/dtos/pagination_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test pagination dto', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/get_clevertap_notifications/getClevertapNotificationsResponse.json'),
      );
    });

    test('Test toJson', () {
      final paginationDto = PaginationDto.fromJson(
        data['data']['getClevertapNotifications'],
      ).toDomain();
      expect(paginationDto.totalPage, 0);
    });
  });
}
