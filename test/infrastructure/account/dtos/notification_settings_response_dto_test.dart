import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  setUpAll(
    () async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/get_notification_settings/getNotificationSettingsResponse.json',
        ),
      );
    },
  );

  group(
    'Test Notification Settings Response DTO',
    () {
      test(
        '=> data mapping',
        () {
          final notificationSettings = NotificationSettingsResponseDto.fromJson(
            data['data']['getNotificationSettings']['settings'],
          ).toDomain;
          expect(
            notificationSettings.orderConfirmation.getOrCrash(),
            false,
          );
          expect(
            notificationSettings.ereturnConfirmation.getOrCrash(),
            true,
          );
          expect(
            notificationSettings.paymentConfirmation.getOrCrash(),
            true,
          );
        },
      );
    },
  );
}
