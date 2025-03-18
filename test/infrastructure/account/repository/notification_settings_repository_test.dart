import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/notification_settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConfigMock extends Mock implements Config {}

class NotificationSettingsLocalDataSourceMock extends Mock
    implements NotificationSettingsLocalDataSource {}

class NotificationSettingsRemoteDataSourceMock extends Mock
    implements NotificationSettingsRemoteDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late NotificationSettingsRepository repository;
  late Config configMock;
  late NotificationSettingsLocalDataSource localDataSourceMock;
  late NotificationSettingsRemoteDataSource remoteDataSourceMock;
  late NotificationSettings notificationSettingsMock;
  final fakeError = Exception('fake-error');

  setUpAll(
    () async {
      localDataSourceMock = NotificationSettingsLocalDataSourceMock();
      remoteDataSourceMock = NotificationSettingsRemoteDataSourceMock();
      notificationSettingsMock =
          await NotificationSettingsLocalDataSource().getNotificationSettings();
      configMock = ConfigMock();
      repository = NotificationSettingsRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
      );
    },
  );

  group(
    'Notification Settings Repository',
    () {
      test(
        'Get Notification Settings Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getNotificationSettings()).thenAnswer(
            (invocation) async => notificationSettingsMock,
          );
          final result = await repository.getNotificationSettings();
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => NotificationSettings.empty(),
            ),
            notificationSettingsMock,
          );
        },
      );

      test(
        'Get Notification Settings Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.getNotificationSettings(),
          ).thenThrow(
            fakeError,
          );
          final result = await repository.getNotificationSettings();
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Get Notification Settings Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getNotificationSettings(),
          ).thenAnswer(
            (invocation) async => notificationSettingsMock,
          );
          final result = await repository.getNotificationSettings();
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => NotificationSettings.empty(),
            ),
            notificationSettingsMock,
          );
        },
      );

      test(
        'Get Notification Settings Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getNotificationSettings(),
          ).thenThrow(fakeError);
          final result = await repository.getNotificationSettings();
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Set Notification Settings Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.setNotificationSettings()).thenAnswer(
            (invocation) async => notificationSettingsMock,
          );
          final result = await repository.setNotificationSettings(
            notificationSettings: notificationSettingsMock,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => NotificationSettings.empty(),
            ),
            notificationSettingsMock,
          );
        },
      );

      test(
        'Set Notification Settings Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.setNotificationSettings(),
          ).thenThrow(
            fakeError,
          );
          final result = await repository.setNotificationSettings(
            notificationSettings: notificationSettingsMock,
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Set Notification Settings Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.setNotificationSettings(
              notificationSettings: notificationSettingsMock,
            ),
          ).thenAnswer(
            (invocation) async => notificationSettingsMock,
          );
          final result = await repository.setNotificationSettings(
            notificationSettings: notificationSettingsMock,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => NotificationSettings.empty(),
            ),
            notificationSettingsMock,
          );
        },
      );

      test(
        'Set Notification Settings Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.setNotificationSettings(
              notificationSettings: notificationSettingsMock,
            ),
          ).thenThrow(fakeError);
          final result = await repository.setNotificationSettings(
            notificationSettings: notificationSettingsMock,
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );
}
