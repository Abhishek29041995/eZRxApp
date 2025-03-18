import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class MockDeviceStorage extends Mock implements DeviceStorage {}

class MockPermissionService extends Mock implements PermissionService {}

class MockMixPanelService extends Mock implements MixpanelService {}

class MockDeviceInfo extends Mock implements DeviceInfo {}

void main() {
  late DeviceStorage mockDeviceStorage;
  late PermissionService mockPermissionService;
  late DeviceInfo mockDeviceInfo;
  late DeviceRepository repository;
  late MixpanelService mockMixPanelService;
  final mockException = MockException(message: 'exception');
  late String mockMarket;

  setUp(
    () async {
      mockMarket = AppMarket.defaultMarket().value.getOrElse(() => '');
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      mockDeviceStorage = MockDeviceStorage();
      mockMixPanelService = MockMixPanelService();
      mockPermissionService = MockPermissionService();
      mockDeviceInfo = MockDeviceInfo();
      repository = DeviceRepository(
        deviceStorage: mockDeviceStorage,
        permissionService: mockPermissionService,
        deviceInfo: mockDeviceInfo,
        mixpanelService: mockMixPanelService,
      );
    },
  );
  group(
    'Device Repository',
    () {
      test('Test setDeviceData success', () async {
        when(
          () => mockDeviceStorage.setAppFirstLaunch(
            isAppFirstLaunch: true,
          ),
        ).thenAnswer((_) => Future.value());
        final result = await repository.setDeviceData(isAppFirstLaunch: true);
        expect(result.isRight(), true);
      });

      test('Test setDeviceData failure', () async {
        when(
          () => mockDeviceStorage.setAppFirstLaunch(
            isAppFirstLaunch: true,
          ),
        ).thenThrow(mockException);
        final result = await repository.setDeviceData(isAppFirstLaunch: true);
        expect(result.isLeft(), true);
      });

      test('Test initDeviceStorage success', () async {
        when(
          () => mockDeviceStorage.init(),
        ).thenAnswer((_) => Future.value());
        final result = await repository.initDeviceStorage();
        expect(result.isRight(), true);
      });

      test('Test initDeviceStorage failure', () async {
        when(
          () => mockDeviceStorage.init(),
        ).thenThrow(mockException);
        final result = await repository.initDeviceStorage();
        expect(result.isLeft(), true);
      });

      test('Test getDeviceData success', () async {
        when(
          () => mockDeviceStorage.isAppFirstLaunch(),
        ).thenAnswer((_) => true);
        final result = await repository.getDeviceData();
        expect(result.isRight(), true);
      });

      test('Test getDeviceData failure', () async {
        when(
          () => mockDeviceStorage.isAppFirstLaunch(),
        ).thenThrow(mockException);
        final result = await repository.getDeviceData();
        expect(result.isLeft(), true);
      });

      test('Test setCurrentMarket success', () async {
        when(
          () => mockDeviceStorage.putCurrentMarket(currentMarket: mockMarket),
        ).thenAnswer((_) => Future.value());
        final result = await repository.setCurrentMarket(
          currentMarket: AppMarket.defaultMarket(),
        );
        expect(result.isRight(), true);
      });

      test('Test setCurrentMarket failure', () async {
        when(
          () => mockDeviceStorage.putCurrentMarket(currentMarket: mockMarket),
        ).thenThrow(mockException);
        final result = await repository.setCurrentMarket(
          currentMarket: AppMarket.defaultMarket(),
        );
        expect(result.isLeft(), true);
      });

      test('Test getCurrentMarket success', () async {
        when(
          () => mockDeviceStorage.currentMarket(),
        ).thenAnswer((_) => mockMarket);
        final result = await repository.getCurrentMarket();
        expect(result.isRight(), true);
      });

      test('Test getCurrentMarket failure', () async {
        when(
          () => mockDeviceStorage.currentMarket(),
        ).thenThrow(mockException);
        final result = await repository.getCurrentMarket();
        expect(result.isLeft(), true);
      });

      test('Test getSavePermission Success With Device Is iOS', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        final result = await repository.getSavePermission();
        expect(result.isRight(), true);
      });
      test('Test getSavePermission Success With Device Is Android With SDK 33',
          () async {
        when(
          () => mockDeviceInfo.checkIfDeviceIsAndroidWithSDK33(),
        ).thenAnswer((_) async => true);
        final result = await repository.getSavePermission();
        expect(result.isRight(), true);
      });

      test('Test getSavePermission Success With Android Permission Granted',
          () async {
        when(
          () => mockDeviceInfo.checkIfDeviceIsAndroidWithSDK33(),
        ).thenAnswer((_) async => false);
        when(
          () => mockPermissionService.requestStoragePermission(),
        ).thenAnswer((_) async => PermissionStatus.granted);
        final result = await repository.getSavePermission();
        expect(result.isRight(), true);
      });

      test('Test getSavePermission Success With Android Permission Limited',
          () async {
        when(
          () => mockDeviceInfo.checkIfDeviceIsAndroidWithSDK33(),
        ).thenAnswer((_) async => false);
        when(
          () => mockPermissionService.requestStoragePermission(),
        ).thenAnswer((_) async => PermissionStatus.limited);
        final result = await repository.getSavePermission();
        expect(result.isRight(), true);
      });

      test('Test getSavePermission Success With Android Do Not Have Permission',
          () async {
        when(
          () => mockDeviceInfo.checkIfDeviceIsAndroidWithSDK33(),
        ).thenAnswer((_) async => false);
        when(
          () => mockPermissionService.requestStoragePermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);
        final result = await repository.getSavePermission();
        expect(result.isLeft(), true);
      });

      test(
        'Test getSavePermission Failure',
        () async {
          when(
            () => mockDeviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer((_) async => false);
          when(
            () => mockPermissionService.requestStoragePermission(),
          ).thenThrow(mockException);
          final result = await repository.getSavePermission();
          expect(result.isLeft(), true);
        },
      );
    },
  );
}
