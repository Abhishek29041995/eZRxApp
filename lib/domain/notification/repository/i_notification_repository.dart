import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';

abstract class INotificationRepository {
  Future<Either<ApiFailure, Notifications>> getNotification({
    required int page,
    required int perPage,
  });
  Future<Either<ApiFailure, Unit>> deleteAllNotificationList();
  Future<Either<ApiFailure, List<NotificationData>>> readNotification({
    required int notificationId,
    required List<NotificationData> previousNotificationDataList,
  });
}
