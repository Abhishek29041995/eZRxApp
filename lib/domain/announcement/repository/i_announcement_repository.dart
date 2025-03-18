import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';

abstract class IAnnouncementRepository {
  Future<Either<ApiFailure, Announcement>> getAnnouncements();

  Future<Either<ApiFailure, MaintenanceItem>> getMaintenanceBanners({
    required SalesOrg salesOrg,
  });

  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimeOrder();

  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimePayment();

  Future<Either<ApiFailure, DateTimeStringValue>> getClosedTimeReturns();

  Future<Either<ApiFailure, Unit>> clearClosedTime();

  Future<Either<ApiFailure, Unit>> setClosedTime({
    required DateTimeStringValue dateTime,
    required StorageType storageType,
  });
}
