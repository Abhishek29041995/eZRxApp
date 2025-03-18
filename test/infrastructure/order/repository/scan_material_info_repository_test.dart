import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/scan_material_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

class MaterialInfoScannerMock extends Mock implements MaterialInfoScanner {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class BarcodeCaptureMock extends Mock implements BarcodeCapture {}

class CameraMock extends Mock implements Camera {}

class ImageFrameSourceMock extends Mock implements ImageFrameSource {}

void main() {
  late ScanMaterialInfoRepository repository;
  late MaterialInfoScanner materialInfoScanner;
  late MixpanelService mixpanelService;
  late PermissionService permissionService;
  late FilePickerService filePickerService;
  late DeviceInfo deviceInfo;
  late BarcodeCapture barcodeCapture;
  late ImageFrameSource imageFrameSource;
  late Camera camera;
  final error = Exception('fake-exception');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    materialInfoScanner = MaterialInfoScannerMock();
    mixpanelService = MixpanelServiceMock();
    permissionService = PermissionServiceMock();
    filePickerService = FilePickerServiceMock();
    deviceInfo = DeviceInfoMock();
    barcodeCapture = BarcodeCaptureMock();
    camera = CameraMock();
    imageFrameSource = ImageFrameSourceMock();
    repository = ScanMaterialInfoRepository(
      deviceInfo: deviceInfo,
      materialInfoScanner: materialInfoScanner,
      mixpanelService: mixpanelService,
      filePickerService: filePickerService,
      permissionService: permissionService,
    );

    registerFallbackValue(imageFrameSource);
  });

  group('ScanMaterialInfoRepository test - ', () {
    test('fetchBarcodeCapture', () {
      when(() => materialInfoScanner.barcodeCapture).thenReturn(barcodeCapture);
      final result = repository.fetchBarcodeCapture();
      expect(result, barcodeCapture);
    });

    group('scanMaterialNumberFromDeviceCamera test - ', () {
      test('scanMaterialNumberFromDeviceCamera success', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        when(() => camera.switchToDesiredState(FrameSourceState.on))
            .thenAnswer((_) => Future.value());

        when(() => materialInfoScanner.barcodeCapture)
            .thenReturn(barcodeCapture);
        final result = await repository.scanMaterialNumberFromDeviceCamera();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.scanSuccess,
            properties: {
              TrackingProps.scanMethod: 'camera',
            },
          ),
        ).called(1);
        expect(result, const Right(true));
      });

      test('scanMaterialNumberFromDeviceCamera failure', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        when(() => camera.switchToDesiredState(FrameSourceState.on))
            .thenAnswer((_) => Future.value());

        when(() => materialInfoScanner.barcodeCapture).thenThrow(error);
        final result = await repository.scanMaterialNumberFromDeviceCamera();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.scanFailed,
            properties: {
              TrackingProps.scanMethod: 'camera',
              TrackingProps.errorMessage: FailureHandler.handleFailure(error)
                  .nonTranslatedFailureMessage,
            },
          ),
        ).called(1);
        expect(result, Left(FailureHandler.handleFailure(error)));
      });
    });

    group('disableMaterialScan test - ', () {
      test('disableMaterialScan success', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        when(() => camera.switchToDesiredState(FrameSourceState.off))
            .thenAnswer((_) => Future.value());
        final result = await repository.disableMaterialScan();

        expect(result, const Right(true));
      });

      test('disableMaterialScan failure', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        when(() => camera.switchToDesiredState(FrameSourceState.off))
            .thenThrow(error);
        final result = await repository.disableMaterialScan();

        expect(result, Left(FailureHandler.handleFailure(error)));
      });
    });

    group('updateTorchState test - ', () {
      test('updateTorchState success with torchState true', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        final result = await repository.updateTorchState(torchState: true);

        expect(result, const Right(true));
      });

      test('updateTorchState success with torchState false', () async {
        when(() => materialInfoScanner.camera).thenReturn(camera);
        final result = await repository.updateTorchState(torchState: false);

        expect(result, const Right(false));
      });

      test('updateTorchState failure', () async {
        when(() => materialInfoScanner.camera).thenThrow(error);
        final result = await repository.updateTorchState(torchState: true);

        expect(result, Left(FailureHandler.handleFailure(error)));
      });
    });

    group('getPermission test - ', () {
      test('getPermission PermissionType.camera granted', () async {
        when(() => permissionService.requestCameraPermission())
            .thenAnswer((_) async => PermissionStatus.granted);
        final result =
            await repository.getPermission(type: PermissionType.camera);

        expect(result, const Right(PermissionStatus.granted));
      });

      test('getPermission PermissionType.camera denied', () async {
        when(() => permissionService.requestCameraPermission())
            .thenAnswer((_) async => PermissionStatus.permanentlyDenied);
        final result =
            await repository.getPermission(type: PermissionType.camera);

        expect(result, const Left(ApiFailure.cameraPermissionFailed(true)));
      });

      test(
          'getPermission PermissionType.files granted with Android with SDK = 33',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((_) async => true);
        when(() => permissionService.requestPhotoPermission())
            .thenAnswer((_) async => PermissionStatus.granted);

        final result =
            await repository.getPermission(type: PermissionType.files);

        expect(result, const Right(PermissionStatus.granted));
      });

      test(
          'getPermission PermissionType.files granted with Android with SDK != 33',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((_) async => false);
        when(() => permissionService.requestStoragePermission())
            .thenAnswer((_) async => PermissionStatus.granted);

        final result =
            await repository.getPermission(type: PermissionType.files);

        expect(result, const Right(PermissionStatus.granted));
      });

      test('getPermission PermissionType.files denied', () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((_) async => false);
        when(() => permissionService.requestStoragePermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        final result =
            await repository.getPermission(type: PermissionType.files);

        expect(result, const Left(ApiFailure.storagePermissionFailed()));
      });

      test('getPermission failure', () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33())
            .thenAnswer((_) async => false);
        when(() => permissionService.requestStoragePermission())
            .thenThrow(error);

        final result =
            await repository.getPermission(type: PermissionType.files);

        expect(result, Left(FailureHandler.handleFailure(error)));
      });
    });

    group('scanImageFromDeviceStorage test - ', () {
      test('scanImageFromDeviceStorage failure', () async {
        when(() => filePickerService.pickFiles()).thenThrow(error);

        final result = await repository.scanImageFromDeviceStorage();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.scanFailed,
            properties: {
              TrackingProps.scanMethod: 'gallery',
              TrackingProps.errorMessage: FailureHandler.handleFailure(error)
                  .nonTranslatedFailureMessage,
            },
          ),
        ).called(1);
        expect(result, Left(FailureHandler.handleFailure(error)));
      });
    });
  });
}
