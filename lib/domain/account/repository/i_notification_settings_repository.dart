import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class INotificationSettingsRepository {
  Future<Either<ApiFailure, NotificationSettings>> getNotificationSettings();

  Future<Either<ApiFailure, NotificationSettings>> setNotificationSettings({
    required NotificationSettings notificationSettings,
  });
}
