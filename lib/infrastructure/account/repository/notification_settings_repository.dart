import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/repository/i_notification_settings_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_remote.dart';

class NotificationSettingsRepository
    implements INotificationSettingsRepository {
  final Config config;
  final NotificationSettingsLocalDataSource localDataSource;
  final NotificationSettingsRemoteDataSource remoteDataSource;

  NotificationSettingsRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, NotificationSettings>>
      getNotificationSettings() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getNotificationSettings();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final response = await remoteDataSource.getNotificationSettings();

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, NotificationSettings>> setNotificationSettings({
    required NotificationSettings notificationSettings,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.setNotificationSettings();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final response = await remoteDataSource.setNotificationSettings(
        notificationSettings: notificationSettings,
      );

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
