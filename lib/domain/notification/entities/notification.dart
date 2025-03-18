import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/domain/notification/entities/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class Notifications with _$Notifications {
  const Notifications._();

  const factory Notifications({
    required List<NotificationData> notificationData,
    required Pagination pagination,
  }) = _Notifications;

  factory Notifications.empty() => Notifications(
        pagination: Pagination.empty(),
        notificationData: <NotificationData>[],
      );

  bool get hasUnreadNotification =>
      notificationData.any((element) => !element.isRead);
}
