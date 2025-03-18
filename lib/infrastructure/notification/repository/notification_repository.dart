import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/domain/notification/repository/i_notification_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_remote.dart';

class NotificationRepository implements INotificationRepository {
  final Config config;
  final NotificationRemoteDataSource remoteDataSource;
  final NotificationLocalDataSource localDataSource;
  final DeviceStorage deviceStorage;

  NotificationRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, Notifications>> getNotification({
    required int page,
    required int perPage,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final notification = await localDataSource.getNotificationList();

        return Right(notification);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final notification = await remoteDataSource.getNotification(
        page: page,
        perPage: perPage,
        market: deviceStorage.currentMarket(),
      );

      return Right(notification);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> deleteAllNotificationList() async {
    if (config.appFlavor == Flavor.mock) {
      return const Right(unit);
    }

    try {
      await remoteDataSource.deleteAllNotifications();

      return const Right(unit);
    } on Exception catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<NotificationData>>> readNotification({
    required int notificationId,
    required List<NotificationData> previousNotificationDataList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      final readed = await localDataSource.readNotification();
      final updatedNotificationList = _updatedNotificationList(
        readed,
        notificationId,
        previousNotificationDataList,
      );

      return Right(
        updatedNotificationList,
      );
    }

    try {
      final readed = await remoteDataSource.readNotification(
        notificationId: notificationId,
      );
      final updatedNotificationList = _updatedNotificationList(
        readed,
        notificationId,
        previousNotificationDataList,
      );

      return Right(
        updatedNotificationList,
      );
    } on Exception catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

@override
List<NotificationData> _updatedNotificationList(
  bool readed,
  int notificationId,
  List<NotificationData> previousNotificationDataList,
) {
  return readed
      ? previousNotificationDataList
          .map(
            (element) => element.id == notificationId
                ? element.copyWith(
                    isRead: true,
                  )
                : element,
          )
          .toList()
      : <NotificationData>[];
}
