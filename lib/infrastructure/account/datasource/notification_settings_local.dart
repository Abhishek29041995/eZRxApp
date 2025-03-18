import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:flutter/services.dart';

class NotificationSettingsLocalDataSource {
  NotificationSettingsLocalDataSource();

  Future<NotificationSettings> getNotificationSettings() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_notification_settings/getNotificationSettingsResponse.json',
      ),
    );

    return NotificationSettingsResponseDto.fromJson(
      data['data']['getNotificationSettings']['settings'],
    ).toDomain;
  }

  Future<NotificationSettings> setNotificationSettings() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/set_notification_settings/setNotificationSettingsResponse.json',
      ),
    );

    return NotificationSettingsResponseDto.fromJson(
      data['data']['setNotificationSettings']['settings'],
    ).toDomain;
  }
}
