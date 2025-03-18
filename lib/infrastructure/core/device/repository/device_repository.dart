import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceRepository implements IDeviceRepository {
  final DeviceStorage deviceStorage;
  final PermissionService permissionService;
  final DeviceInfo deviceInfo;
  final MixpanelService mixpanelService;

  DeviceRepository({
    required this.deviceStorage,
    required this.permissionService,
    required this.deviceInfo,
    required this.mixpanelService,
  });

  @override
  Future<Either<ApiFailure, Unit>> setDeviceData({
    required bool isAppFirstLaunch,
  }) async {
    try {
      await deviceStorage.setAppFirstLaunch(
        isAppFirstLaunch: isAppFirstLaunch,
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initDeviceStorage() async {
    try {
      await deviceStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> getDeviceData() async {
    try {
      final isAppFirstLaunch = deviceStorage.isAppFirstLaunch();

      return Right(isAppFirstLaunch);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> setCurrentMarket({
    required AppMarket currentMarket,
  }) async {
    try {
      await deviceStorage.putCurrentMarket(
        currentMarket: currentMarket.value.getOrElse(() => ''),
      );
      mixpanelService.registerSuperProps(
        username: '',
        salesOrg: '',
        userRole: '',
        market: currentMarket.getOrCrash(),
        customerCode: '',
        shipToAddress: '',
        currency: '',
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, String>> getCurrentMarket() async {
    try {
      final currentMarket = deviceStorage.currentMarket();

      return Right(currentMarket);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getSavePermission() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return const Right(PermissionStatus.granted);
      }
      if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus =
          await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : const Left(ApiFailure.storagePermissionFailed());
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
