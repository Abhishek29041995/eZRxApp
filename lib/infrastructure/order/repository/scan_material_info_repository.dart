import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';

import 'dart:io';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';

import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';

import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';

class ScanMaterialInfoRepository implements IScanMaterialInfoRepository {
  final MaterialInfoScanner materialInfoScanner;
  final MixpanelService mixpanelService;
  final PermissionService permissionService;
  final FilePickerService filePickerService;
  final DeviceInfo deviceInfo;

  ScanMaterialInfoRepository({
    required this.materialInfoScanner,
    required this.mixpanelService,
    required this.filePickerService,
    required this.permissionService,
    required this.deviceInfo,
  });

  @override
  BarcodeCapture fetchBarcodeCapture() {
    return materialInfoScanner.barcodeCapture;
  }

  @override
  Future<Either<ApiFailure, bool>> scanMaterialNumberFromDeviceCamera() async {
    try {
      await materialInfoScanner.camera
          ?.switchToDesiredState(FrameSourceState.on);
      materialInfoScanner.barcodeCapture.isEnabled = true;

      mixpanelService.trackEvent(
        eventName: TrackingEvents.scanSuccess,
        properties: {
          TrackingProps.scanMethod: 'camera',
        },
      );

      return const Right(true);
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: TrackingEvents.scanFailed,
        properties: {
          TrackingProps.scanMethod: 'camera',
          TrackingProps.errorMessage:
              FailureHandler.handleFailure(e).nonTranslatedFailureMessage,
        },
      );

      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> scanImageFromDeviceStorage() async {
    try {
      final result = await filePickerService.pickFiles();
      if (result != null) {
        final file = File(result.files.single.path!);
        final bytes = await file.readAsBytes();
        final source = ImageFrameSource.create(bytes);
        await materialInfoScanner.scanMaterialNumberfromDeviceStorage(source);
        await source.switchToDesiredState(FrameSourceState.on);
      }
      materialInfoScanner.barcodeCapture.isEnabled = true;

      mixpanelService.trackEvent(
        eventName: TrackingEvents.scanSuccess,
        properties: {
          TrackingProps.scanMethod: 'gallery',
        },
      );

      return const Right(true);
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: TrackingEvents.scanFailed,
        properties: {
          TrackingProps.scanMethod: 'gallery',
          TrackingProps.errorMessage:
              FailureHandler.handleFailure(e).nonTranslatedFailureMessage,
        },
      );

      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> disableMaterialScan() async {
    try {
      await materialInfoScanner.camera
          ?.switchToDesiredState(FrameSourceState.off);
      materialInfoScanner.camera?.desiredTorchState = TorchState.off;

      return const Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required PermissionType type,
  }) async {
    try {
      if (type == PermissionType.camera) {
        final permissionStatus =
            await permissionService.requestCameraPermission();

        return permissionStatus.isGranted
            ? Right(permissionStatus)
            : Left(
                ApiFailure.cameraPermissionFailed(
                  permissionStatus == PermissionStatus.permanentlyDenied,
                ),
              );
      }
      final isIos = defaultTargetPlatform == TargetPlatform.iOS;
      final permissionStatus =
          isIos || await deviceInfo.checkIfDeviceIsAndroidWithSDK33()
              ? await permissionService.requestPhotoPermission()
              : await permissionService.requestStoragePermission();

      return permissionStatus.isGranted
          ? Right(permissionStatus)
          : const Left(ApiFailure.storagePermissionFailed());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> updateTorchState({
    required bool torchState,
  }) async {
    try {
      if (torchState) {
        materialInfoScanner.camera?.desiredTorchState = TorchState.on;
      } else {
        materialInfoScanner.camera?.desiredTorchState = TorchState.off;
      }

      return Right(torchState);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
