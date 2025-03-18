part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initialized() = _Initialized;
  const factory NotificationEvent.fetch() = _Fetch;
  const factory NotificationEvent.deleteAllNotifications() =
      _DeleteAllNotifications;
  const factory NotificationEvent.readNotifications({
    required int notificationId,
  }) = _ReadNotifications;
  const factory NotificationEvent.loadMore() = _LoadMore;
}
