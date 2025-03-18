import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/notification_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NotificationSettingsRepositoryMock extends Mock
    implements NotificationSettingsRepository {}

void main() {
  late NotificationSettingsRepository repository;
  const fakeError = ApiFailure.other('fake-error');
  late NotificationSettings settingsMock;
  late NotificationSettings newSettingsMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = NotificationSettingsRepositoryMock();
    settingsMock =
        await NotificationSettingsLocalDataSource().getNotificationSettings();
    newSettingsMock = settingsMock.copyWith(
      orderConfirmation: NotificationSetting(true),
    );
  });

  group(
    'Notification Settings Bloc',
    () {
      blocTest(
        'Initialize Notification Settings',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.initialized(),
        ),
        expect: () => [NotificationSettingsState.initial()],
      );
      blocTest(
        'Fetch Notification Settings Failure',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.getNotificationSettings(),
          ).thenAnswer(
            (_) async => const Left(
              fakeError,
            ),
          );
        },
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.fetch(),
        ),
        expect: () => [
          NotificationSettingsState.initial().copyWith(
            isLoading: true,
          ),
          NotificationSettingsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                fakeError,
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Fetch Notification Settings Success',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.getNotificationSettings(),
          ).thenAnswer(
            (_) async => Right(
              settingsMock,
            ),
          );
        },
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.fetch(),
        ),
        expect: () => [
          NotificationSettingsState.initial().copyWith(
            isLoading: true,
          ),
          NotificationSettingsState.initial().copyWith(
            currentNotificationSettings: settingsMock,
            previousNotificationSettings: settingsMock,
          ),
        ],
      );

      blocTest(
        'Update Order Confirmation Settings',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial(),
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.updateOrderConfirmation(
            value: true,
          ),
        ),
        expect: () {
          final newNotificationSettings = NotificationSettings.empty().copyWith(
            orderConfirmation: NotificationSetting(true),
          );
          return [
            NotificationSettingsState.initial().copyWith(
              currentNotificationSettings: newNotificationSettings,
            ),
          ];
        },
      );

      blocTest(
        'Update Payment Confirmation Settings',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial(),
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.updatePaymentConfirmation(
            value: true,
          ),
        ),
        expect: () {
          final newNotificationSettings = NotificationSettings.empty().copyWith(
            paymentConfirmation: NotificationSetting(true),
          );
          return [
            NotificationSettingsState.initial().copyWith(
              currentNotificationSettings: newNotificationSettings,
            ),
          ];
        },
      );

      blocTest(
        'Update Return Confirmation Settings',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial(),
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.updateReturnConfirmation(
            value: true,
          ),
        ),
        expect: () {
          final newNotificationSettings = NotificationSettings.empty().copyWith(
            ereturnConfirmation: NotificationSetting(true),
          );
          return [
            NotificationSettingsState.initial().copyWith(
              currentNotificationSettings: newNotificationSettings,
            ),
          ];
        },
      );

      blocTest(
        'Clear Changes Notification Settings',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial().copyWith(
          currentNotificationSettings: newSettingsMock,
          previousNotificationSettings: settingsMock,
        ),
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.clear(),
        ),
        expect: () {
          return [
            NotificationSettingsState.initial().copyWith(
              currentNotificationSettings: settingsMock,
              previousNotificationSettings: settingsMock,
            ),
          ];
        },
      );

      blocTest(
        'Submit Notification Settings Success',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial().copyWith(
          currentNotificationSettings: newSettingsMock,
          previousNotificationSettings: settingsMock,
        ),
        setUp: () {
          when(
            () => repository.setNotificationSettings(
              notificationSettings: newSettingsMock,
            ),
          ).thenAnswer(
            (_) async => Right(
              newSettingsMock,
            ),
          );
        },
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.submit(),
        ),
        expect: () {
          return [
            NotificationSettingsState.initial().copyWith(
              isLoading: true,
              submitFailureOrSuccessOption: none(),
              currentNotificationSettings: newSettingsMock,
              previousNotificationSettings: settingsMock,
            ),
            NotificationSettingsState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                Right(newSettingsMock),
              ),
              currentNotificationSettings: newSettingsMock,
              previousNotificationSettings: newSettingsMock,
            ),
          ];
        },
      );

      blocTest(
        'Submit Notification Settings Failure',
        build: () => NotificationSettingsBloc(
          notificationSettingsRepository: repository,
        ),
        seed: () => NotificationSettingsState.initial().copyWith(
          currentNotificationSettings: newSettingsMock,
          previousNotificationSettings: settingsMock,
        ),
        setUp: () {
          when(
            () => repository.setNotificationSettings(
              notificationSettings: newSettingsMock,
            ),
          ).thenAnswer(
            (_) async => const Left(
              fakeError,
            ),
          );
        },
        act: (NotificationSettingsBloc bloc) => bloc.add(
          const NotificationSettingsEvent.submit(),
        ),
        expect: () {
          return [
            NotificationSettingsState.initial().copyWith(
              isLoading: true,
              submitFailureOrSuccessOption: none(),
              currentNotificationSettings: newSettingsMock,
              previousNotificationSettings: settingsMock,
            ),
            NotificationSettingsState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Left(fakeError),
              ),
              currentNotificationSettings: newSettingsMock,
              previousNotificationSettings: settingsMock,
            ),
          ];
        },
      );

      test('Test enableSubmit', () {
        final state = NotificationSettingsState.initial().copyWith(
          currentNotificationSettings: settingsMock,
          previousNotificationSettings: settingsMock,
        );
        final enableSubmit = state.enableSubmit;
        expect(enableSubmit, false);
      });
    },
  );
}
