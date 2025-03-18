import 'dart:convert';

import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/notification/dtos/notification_dto.dart';

class NotificationLocalDataSource {
  NotificationLocalDataSource();

  Future<Notifications> getNotificationList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/get_clevertap_notifications/getClevertapNotificationsResponse.json'),
    );

    return NotificationDto.fromJson(data['data']['getClevertapNotifications'])
        .toDomain();
  }

  Future<bool> readNotification() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/change_clevertap_notification_status/changeClevertapNotificationStatusResponse.json',
      ),
    );

    return data['data']['changeClevertapNotificationStatus']['message'] ==
        'Change status done';
  }
}
