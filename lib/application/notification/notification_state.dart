part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required Notifications notificationList,
    required bool isFetching,
    required bool canLoadMore,
    required int nextPageIndex,
    required bool isDeletedAllSuccess,
    required bool isReadNotification,


    required Option<Either<ApiFailure, dynamic>>
        notificationFailureOrSuccessOption,
  }) = _NotificationState;
  factory NotificationState.initial() => NotificationState(
        notificationList: Notifications.empty(),
        notificationFailureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: false,
        nextPageIndex: 1,
        isDeletedAllSuccess:false,
        isReadNotification:false,
      );
}
