import 'dart:convert';

import 'package:ezrxmobile/infrastructure/notification/dtos/notification_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test notification dto', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/get_clevertap_notifications/getClevertapNotificationsResponse.json'),
      );
    });

    test('Test toJson', () {
      final notificationDto = NotificationDto.fromJson(
        data['data']['getClevertapNotifications'],
      ).toDomain();
      expect(notificationDto.notificationData.first.id, 13160);
    });
  });
}
