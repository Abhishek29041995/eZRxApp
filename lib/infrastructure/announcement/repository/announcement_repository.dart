import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/announcement/repository/i_announcement_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';

class AnnouncementRepository implements IAnnouncementRepository {
  final AnnouncementRemoteDataSource remoteDataSource;
  final AnnouncementLocalDataSource localDataSource;
  final BannerStorage dateTimeStorage;
  final Config config;

  AnnouncementRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
    required this.dateTimeStorage,
  });

  @override
  Future<Either<ApiFailure, Unit>> setClosedTime({
    required DateTimeStringValue dateTime,
    required StorageType storageType,
  }) async {
    try {
      await dateTimeStorage.setClosedTime(
        dateTime: dateTime.dateTime.toIso8601String(),
        storageType: storageType,
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimeOrder() async {
    try {
      final currentDate = dateTimeStorage.getClosedTimeOrder();

      return Right(DateTimeStringValue(currentDate));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimePayment() async {
    try {
      final currentDate = dateTimeStorage.getClosedTimePayment();

      return Right(DateTimeStringValue(currentDate));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimeReturns() async {
    try {
      final currentDate = dateTimeStorage.getClosedTimeReturns();

      return Right(DateTimeStringValue(currentDate));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Announcement>> getAnnouncements() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcement = await localDataSource.getAnnouncements();

        return Right(announcement);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final announcement = await remoteDataSource.getAnnouncements();

      return Right(announcement);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaintenanceItem>> getMaintenanceBanners({
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final maintenanceItem = await localDataSource.getMaintenanceBanners();

        return Right(maintenanceItem);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final maintenanceItem = await remoteDataSource.getMaintenanceBanner(
        languageCode: salesOrg.announcementLocale.languageCode,
        pathId: salesOrg.maintenanceBannerPathId,
      );

      return Right(maintenanceItem);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> clearClosedTime() async {
    try {
      dateTimeStorage.clearClosedTime();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
