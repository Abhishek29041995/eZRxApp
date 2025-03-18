import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IDeviceRepository {
  Future<Either<ApiFailure, bool>> getDeviceData();

  Future<Either<ApiFailure, Unit>> setDeviceData({
    required bool isAppFirstLaunch,
  });

  Future<Either<ApiFailure, Unit>> initDeviceStorage();

  Future<Either<ApiFailure, String>> getCurrentMarket();

  Future<Either<ApiFailure, Unit>> setCurrentMarket({
    required AppMarket currentMarket,
  });

  Future<Either<ApiFailure, PermissionStatus>> getSavePermission();
}
