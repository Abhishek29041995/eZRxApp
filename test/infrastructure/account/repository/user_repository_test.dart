import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';

class ConfigMock extends Mock implements Config {}

class UserLocalDataSourceMock extends Mock implements UserLocalDataSource {}

class UserRemoteDataSourceMock extends Mock implements UserRemoteDataSource {}

class FirebaseAnalyticsMock extends Mock implements FirebaseAnalytics {}

class MockTokenStorage extends Mock implements TokenStorage {}

class MockClevertapService extends Mock implements ClevertapService {}

class FirebaseAnalyticsObserverMock extends Mock
    implements FirebaseAnalyticsObserver {}

class FirebaseCrashlyticsMock extends Mock implements FirebaseCrashlytics {}

class DatadogServiceMock extends Mock implements DatadogService {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class LanguageLocalDataSourceMock extends Mock
    implements LanguageLocalDataSource {}

class LanguageRemoteDataSourceMock extends Mock
    implements LanguageRemoteDataSource {}

void main() {
  late UserRepository repository;
  late Config configMock;
  late UserLocalDataSource localDataSourceMock;
  late FirebaseAnalyticsService firebaseAnalyticsServiceMock;
  late UserRemoteDataSource remoteDataSourceMock;
  late TokenStorage tokenStorageMock;
  late FirebaseCrashlyticsService firebaseCrashlyticsServiceMock;
  late FirebaseAnalytics firebaseAnalyticsMock;
  late FirebaseAnalyticsObserver firebaseAnalyticsObserverMock;
  late FirebaseCrashlytics firebaseCrashlyticsMock;
  late MixpanelService mixpanelService;
  const rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
  const refreshToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SkJWVlJJWDFSUFMwVk9Jam9pZHpsNGNFRmhRa1JaVVNJc0lrTlNSVUZVUlVSZlFWUWlPakUyT0RZeU9UWTRPRFFzSW1WNGNDSTZNVFk0TmpNd01EUTROQ3dpYVdGMElqb3hOamcyTWprMk9EZzBMQ0pwWkNJNk16ZzJNQ3dpY21sbmFIUnpJanBiZXlKMllXeDFaU0k2VzNzaVkzVnpkRzl0WlhKRGIyUmxJam9pWVd4c0lpd2ljMkZzWlhOUGNtY2lPaUl5TURBeElpd2ljMmhwY0ZSdlEyOWtaU0k2V3lKaGJHd2lYWDFkZlYwc0luSnZiR1VpT2lKU1QwOVVJRUZrYldsdUlpd2ljMkZzWlhOUGNtZHpJanBiSWpJd01ERWlYU3dpZFhObGNtNWhiV1VpT2lKeWIyOTBZV1J0YVc0aWZRLmp0ZkxBZjcyaFdkVU1EZ0xEYnJoUXpOQmNhd2hsb19PSHJfTmFFTE5fbGMiLCJleHAiOjE2OTQwNzI4ODQsImlhdCI6MTY4NjI5Njg4NH0.fx4Lnfs1omLm81hBAwTetEnddSQnK2hTS_Kj9O25tYA';
  late MockClevertapService mockClevertapService;
  late DatadogService datadogServiceMock;
  late LanguageLocalDataSource languageLocalDataSource;
  late LanguageRemoteDataSource languageRemoteDataSource;
  late UpdateLanguageResponse updateLanguageResponseMock;
  late DeviceStorage deviceStorageMock;
  final error = Error();
  final mockException = MockException(message: 'exception');
  final locale = Language.vietnamese();
  const mockMarket = 'mock-market';
  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = ConfigMock();
      mixpanelService = MixpanelServiceMock();
      localDataSourceMock = UserLocalDataSourceMock();
      firebaseAnalyticsMock = FirebaseAnalyticsMock();
      firebaseAnalyticsObserverMock = FirebaseAnalyticsObserverMock();
      firebaseAnalyticsServiceMock = FirebaseAnalyticsService(
        analytics: firebaseAnalyticsMock,
        observer: firebaseAnalyticsObserverMock,
      );
      firebaseCrashlyticsMock = FirebaseCrashlyticsMock();
      tokenStorageMock = MockTokenStorage();
      remoteDataSourceMock = UserRemoteDataSourceMock();

      firebaseCrashlyticsServiceMock = FirebaseCrashlyticsService(
        crashlytics: firebaseCrashlyticsMock,
      );
      mockClevertapService = MockClevertapService();
      datadogServiceMock = DatadogServiceMock();
      languageLocalDataSource = LanguageLocalDataSourceMock();
      languageRemoteDataSource = LanguageRemoteDataSourceMock();
      deviceStorageMock = DeviceStorageMock();
      repository = UserRepository(
        clevertapService: mockClevertapService,
        firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
        firebaseAnalyticsService: firebaseAnalyticsServiceMock,
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
        tokenStorage: tokenStorageMock,
        mixpanelService: mixpanelService,
        datadogService: datadogServiceMock,
        languageLocalDataSource: languageLocalDataSource,
        languageRemoteDataSource: languageRemoteDataSource,
        deviceStorage: deviceStorageMock,
      );
      updateLanguageResponseMock =
          await LanguageLocalDataSource().getCustomerLicense();
    },
  );
  group('User Repository should - ', () {

    // test(
    //   'update user aup from local datasource successfully with mock',
    //   () async {
    //     repository = UserRepository(
    //       firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
    //       firebaseAnalyticsService: firebaseAnalyticsServiceMock,
    //       remoteDataSource: remoteDataSourceMock,
    //       config: configMock,
    //       localDataSource: localDataSourceMock,
    //       tokenStorage: tokenStorageMock,
    //     );

    //     when(() => configMock.appFlavor)
    //         .thenAnswer((_) => Flavor.mock);

    //     when(() => localDataSourceMock.updateUserAup())
    //         .thenAnswer((_) async => User.empty().settingAup);

    //     final result = await repository.updateUserAup(User.empty());
    //     expect(result.isRight(), true);
    //   },
    // );

    // test(
    //   'update user aup from local datasource throws error with mock',
    //   () async {
    //     repository = UserRepository(
    //       firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
    //       firebaseAnalyticsService: firebaseAnalyticsServiceMock,
    //       remoteDataSource: remoteDataSourceMock,
    //       config: configMock,
    //       localDataSource: localDataSourceMock,
    //       tokenStorage: tokenStorageMock,
    //     );

    //     when(() => configMock.appFlavor)
    //         .thenAnswer((_) => Flavor.mock);

    //     when(() => localDataSourceMock.updateUserAup())
    //         .thenThrow(MockException(message: 'mockException'));

    //     final result = await repository.updateUserAup(User.empty());
    //     expect(result.isLeft(), true);
    //   },
    // );

    // test(
    //   'update user aup from remote datasource successfully with uat',
    //   () async {
    //     repository = UserRepository(
    //       firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
    //       firebaseAnalyticsService: firebaseAnalyticsServiceMock,
    //       remoteDataSource: remoteDataSourceMock,
    //       config: configMock,
    //       localDataSource: localDataSourceMock,
    //       tokenStorage: tokenStorageMock,
    //     );

    //     when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

    //     when(() => remoteDataSourceMock.updateUserAup(
    //           userId: User.empty().id,
    //         )).thenAnswer((_) async => User.empty().settingAup);

    //     final result = await repository.updateUserAup(User.empty());
    //     expect(result.isRight(), true);
    //   },
    // );

    // test(
    //   'update user aup from remote datasource throws error with uat',
    //   () async {
    //     repository = UserRepository(
    //       firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
    //       firebaseAnalyticsService: firebaseAnalyticsServiceMock,
    //       remoteDataSource: remoteDataSourceMock,
    //       config: configMock,
    //       localDataSource: localDataSourceMock,
    //       tokenStorage: tokenStorageMock,
    //     );

    //     when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

    //     when(() => remoteDataSourceMock.updateUserAup(
    //           userId: User.empty().id,
    //         )).thenThrow(Error());

    //     final result = await repository.updateUserAup(User.empty());
    //     expect(result.isLeft(), true);
    //   },
    // );

    test(
      'update user tc from local datasource successfully with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => localDataSourceMock.updateUserTC())
            .thenAnswer((_) async => const SettingTc(acceptTC: true));

        final result = await repository.updateUserTc();
        expect(result.isRight(), true);
      },
    );

    test(
      'update user tc from local datasource throws error with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => localDataSourceMock.updateUserTC()).thenThrow(mockException);

        final result = await repository.updateUserTc();
        expect(result.isLeft(), true);
      },
    );

    test(
      'update user tc from remote datasource successfully with uat',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserTC())
            .thenAnswer((_) async => const SettingTc(acceptTC: true));

        final result = await repository.updateUserTc();
        expect(result.isRight(), true);
      },
    );

    test(
      'update user tc from remote datasource throws error with uat',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserTC()).thenThrow(error);

        final result = await repository.updateUserTc();
        expect(result.isLeft(), true);
      },
    );

    test(
      'get user from local datasource successfully with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => localDataSourceMock.getUser())
            .thenAnswer((_) async => User.empty());

        final result = await repository.getUser();
        expect(result.isRight(), true);
      },
    );

    test(
      'get user from local datasource throws error with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => localDataSourceMock.getUser()).thenThrow(mockException);

        final result = await repository.getUser();
        expect(result.isLeft(), true);
      },
    );

    test(
      'get user from remote datasource successfully with uat',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
        when(() => tokenStorageMock.get()).thenAnswer(
          (_) async => JWTDto(access: rootAdminToken, refresh: refreshToken),
        );
        when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);
        when(
          () => remoteDataSourceMock.getUser(
            userId: '11461',
            market: mockMarket,
          ),
        ).thenAnswer((_) async => User.empty());

        when(
          () => firebaseAnalyticsServiceMock.analytics
              .setUserId(id: User.empty().id),
        ).thenAnswer((_) async => User.empty());

        when(
          () => firebaseCrashlyticsServiceMock.crashlytics
              .setUserIdentifier(User.empty().id),
        ).thenAnswer((_) async => User.empty());
        final mockUser = User.empty();
        when(
          () => mockClevertapService.setUser(
            name: mockUser.fullName.displayFullName,
            username: mockUser.username.getOrDefaultValue(''),
            email: mockUser.email.getOrDefaultValue(''),
            role: mockUser.role.name,
            market: mockMarket.toUpperCase(),
            phone: mockUser.phoneWithCountryCode,
          ),
        ).thenAnswer((_) => Future.value());

        final result = await repository.getUser();
        expect(result.isRight(), true);

        // verify cleverTapService event
        verify(
          () => mockClevertapService.setUser(
            name: mockUser.fullName.displayFullName,
            username: mockUser.username.getOrDefaultValue(''),
            email: mockUser.email.getOrDefaultValue(''),
            role: mockUser.role.name,
            market: mockMarket.toUpperCase(),
            phone: mockUser.phoneWithCountryCode,
          ),
        ).called(1);
      },
    );

    test(
      'get user from remote datasource throws error with uat',
      () async {
        when(() => tokenStorageMock.get())
            .thenAnswer((_) async => JWTDto(access: '', refresh: ''));
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
        when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);
        when(
          () => remoteDataSourceMock.getUser(
            userId: '',
            market: mockMarket,
          ),
        ).thenThrow(error);

        final result = await repository.getUser();
        expect(result.isLeft(), true);
      },
    );

    test(
      'updateLanguage from local datasource successfully with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => languageLocalDataSource.getCustomerLicense())
            .thenAnswer((_) async => updateLanguageResponseMock);

        final result = await repository.updateLanguage(
          language: locale,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'updateLanguage from local datasource throws error with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

        when(() => languageLocalDataSource.getCustomerLicense())
            .thenThrow((_) async => error);

        final result = await repository.updateLanguage(
          language: locale,
        );
        expect(result.isLeft(), true);
      },
    );

    test(
      'updateLanguage from remote datasource successfully with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

        when(
          () => languageRemoteDataSource.changeLanguage(locale.languageCode),
        ).thenAnswer((_) async => updateLanguageResponseMock);

        final result = await repository.updateLanguage(
          language: locale,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'updateLanguage from remove datasource throws error with mock',
      () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

        when(
          () => languageRemoteDataSource.changeLanguage(locale.languageCode),
        ).thenThrow((_) async => error);

        final result = await repository.updateLanguage(
          language: locale,
        );
        expect(result.isLeft(), true);
      },
    );

    group('update user marketplace tc -', () {
      const fakeStatusCode = 0;
      final fakeStatus = MarketPlaceTnCAcceptance(fakeStatusCode.toString());
      test(
        'from local datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updateUserTC())
              .thenAnswer((_) async => const SettingTc(acceptTC: true));

          final result = await repository.updateUserMarketPlaceTc(fakeStatus);
          expect(result.isRight(), true);
        },
      );

      test(
        'from local datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updateUserTC())
              .thenThrow(mockException);

          final result = await repository.updateUserMarketPlaceTc(fakeStatus);
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );

      test(
        'from remote datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(
            () => remoteDataSourceMock.updateUserMarketPlaceTC(fakeStatusCode),
          ).thenAnswer((_) async => const SettingTc(acceptTC: true));

          final result = await repository.updateUserMarketPlaceTc(fakeStatus);
          expect(result.isRight(), true);
        },
      );

      test(
        'from remote datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(
            () => remoteDataSourceMock.updateUserMarketPlaceTC(fakeStatusCode),
          ).thenThrow(mockException);

          final result = await repository.updateUserMarketPlaceTc(fakeStatus);
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );

      test(
        'from remote datasource returning false value',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(
            () => remoteDataSourceMock.updateUserMarketPlaceTC(fakeStatusCode),
          ).thenAnswer((_) async => const SettingTc(acceptTC: false));

          final result = await repository.updateUserMarketPlaceTc(fakeStatus);
          expect(
            result,
            const Left(ApiFailure.marketplaceTnCAcceptanceError()),
          );
        },
      );
    });

    group('update user selected order type -', () {
      final fakeOrderType = DocumentType('fake');
      test(
        'from local datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updateSelectedOrderType())
              .thenAnswer((_) async => fakeOrderType);

          final result =
              await repository.updateSelectedOrderType(fakeOrderType);
          expect(result, Right(fakeOrderType));
        },
      );

      test(
        'from local datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updateSelectedOrderType())
              .thenThrow(mockException);

          final result =
              await repository.updateSelectedOrderType(fakeOrderType);
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );

      test(
        'from remote datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.updateSelectedOrderType(
              value: fakeOrderType.getOrCrash(),
            ),
          ).thenAnswer((_) async => fakeOrderType);

          final result =
              await repository.updateSelectedOrderType(fakeOrderType);
          expect(result, Right(fakeOrderType));
        },
      );

      test(
        'from remote datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.updateSelectedOrderType(
              value: fakeOrderType.getOrCrash(),
            ),
          ).thenThrow(mockException);

          final result =
              await repository.updateSelectedOrderType(fakeOrderType);
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );
    });

    group('update privacy control -', () {
      test(
        'from local datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updatePrivacyControl())
              .thenAnswer((_) async => true);

          final result = await repository.updatePrivacyControl(
            automatedPersonalisation: true,
            viaEmails: true,
            viaPushNotification: true,
            viaSMS: true,
          );
          expect(result, const Right(true));
        },
      );

      test(
        'from local datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.updatePrivacyControl())
              .thenThrow(mockException);

          final result = await repository.updatePrivacyControl(
            automatedPersonalisation: true,
            viaEmails: true,
            viaPushNotification: true,
            viaSMS: true,
          );
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );

      test(
        'from remote datasource successfully',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.updatePrivacyControl(
              automatedPersonalisation: true,
              viaEmails: true,
              viaPushNotification: true,
              viaSMS: true,
            ),
          ).thenAnswer((_) async => true);

          when(
            () => mockClevertapService.updateUserProfile(
              updatedProfile: {
                'MSG-email': true,
                'MSG-push': true,
                'MSG-sms': true,
              },
            ),
          ).thenAnswer((_) => Future.value());

          final result = await repository.updatePrivacyControl(
            automatedPersonalisation: true,
            viaEmails: true,
            viaPushNotification: true,
            viaSMS: true,
          );
          expect(result, const Right(true));
        },
      );

      test(
        'from remote datasource throws error',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.updatePrivacyControl(
              automatedPersonalisation: true,
              viaEmails: true,
              viaPushNotification: true,
              viaSMS: true,
            ),
          ).thenThrow(mockException);

          final result = await repository.updatePrivacyControl(
            automatedPersonalisation: true,
            viaEmails: true,
            viaPushNotification: true,
            viaSMS: true,
          );
          expect(result, Left(ApiFailure.other(mockException.message)));
        },
      );
    });
  });
}
