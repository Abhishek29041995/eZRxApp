import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NotificationLocalDataSource localDataSource;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = NotificationLocalDataSource();
  });
  group('Notification local data source test', () {
    test('getNotificationList', () async {
      final result = await localDataSource.getNotificationList();
      expect(result.pagination.totalPage, 18);
    });
    test('readNotification', () async {
      final result = await localDataSource.readNotification();
      expect(result, true);
    });
  });
}
