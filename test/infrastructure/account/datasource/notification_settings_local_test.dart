import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NotificationSettingsLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = NotificationSettingsLocalDataSource();
    },
  );

  group(
    'NotificationSettingsLocalDataSource',
    () {
      test(
        'Get Notification Settings',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_notification_settings/getNotificationSettingsResponse.json',
            ),
          );

          final result = await localDataSource.getNotificationSettings();

          expect(
            result,
            NotificationSettingsResponseDto.fromJson(
              res['data']['getNotificationSettings']['settings'],
            ).toDomain,
          );
        },
      );

      test(
        'Set Notification Settings',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/set_notification_settings/setNotificationSettingsResponse.json',
            ),
          );

          final result = await localDataSource.setNotificationSettings();

          expect(
            result,
            NotificationSettingsResponseDto.fromJson(
              res['data']['setNotificationSettings']['settings'],
            ).toDomain,
          );
        },
      );
    },
  );
}
