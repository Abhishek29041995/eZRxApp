import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';
import '../../../common_mock_data/mock_other.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class ConfigMock extends Mock implements Config {}

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource {}

class AuthLocalDataSourceMock extends Mock implements AuthLocalDataSource {}

class FirebaseAnalyticsMock extends Mock implements FirebaseAnalytics {}

class MockTokenStorage extends Mock implements TokenStorage {}

class CredStorageMock extends Mock implements CredStorage {}

class SettingStorageMock extends Mock implements SettingStorage {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class OktaLoginServicesMock extends Mock implements OktaLoginServices {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class LocalAuthenticationMock extends Mock implements LocalAuthentication {}

class ClevertapServiceMock extends Mock implements ClevertapService {}

class ProductSuggestionHistoryStorageMock extends Mock
    implements ProductSuggestionHistoryStorage {}

class MaterialBannerStorageMock extends Mock implements MaterialBannerStorage {}

void main() {
  late AuthRemoteDataSource remoteDataSourceMock;
  late AuthLocalDataSource localDataSourceMock;
  late TokenStorage tokenStorageMock;
  late CredStorage credStorageMock;
  late SettingStorage settingStorageMock;
  late AccountSelectorStorage accountSelectorStorageMock;
  late OktaLoginServices oktaLoginServicesMock;
  late PushNotificationService pushNotificationServiceMock;
  late LocalAuthentication localAuthenticationMock;
  late MixpanelService mixpanelService;
  late ClevertapService clevertapServiceMock;
  late ProductSuggestionHistoryStorage productSuggestionHistoryStorageMock;
  late MaterialBannerStorage materialBannerStorageMock;
  late AuthRepository repository;
  late Config configMock;

  const rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
  const refreshToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SkJWVlJJWDFSUFMwVk9Jam9pZHpsNGNFRmhRa1JaVVNJc0lrTlNSVUZVUlVSZlFWUWlPakUyT0RZeU9UWTRPRFFzSW1WNGNDSTZNVFk0TmpNd01EUTROQ3dpYVdGMElqb3hOamcyTWprMk9EZzBMQ0pwWkNJNk16ZzJNQ3dpY21sbmFIUnpJanBiZXlKMllXeDFaU0k2VzNzaVkzVnpkRzl0WlhKRGIyUmxJam9pWVd4c0lpd2ljMkZzWlhOUGNtY2lPaUl5TURBeElpd2ljMmhwY0ZSdlEyOWtaU0k2V3lKaGJHd2lYWDFkZlYwc0luSnZiR1VpT2lKU1QwOVVJRUZrYldsdUlpd2ljMkZzWlhOUGNtZHpJanBiSWpJd01ERWlYU3dpZFhObGNtNWhiV1VpT2lKeWIyOTBZV1J0YVc0aWZRLmp0ZkxBZjcyaFdkVU1EZ0xEYnJoUXpOQmNhd2hsb19PSHJfTmFFTE5fbGMiLCJleHAiOjE2OTQwNzI4ODQsImlhdCI6MTY4NjI5Njg4NH0.fx4Lnfs1omLm81hBAwTetEnddSQnK2hTS_Kj9O25tYA';
  final fakeJWT = JWT(rootAdminToken);
  final fakeRefreshToken = JWT(refreshToken);
  final fakePassword = Password.login('fake-password');
  final fakeUserName = Username('fake-username');
  final fakeError = Exception('fake-error');
  final fakePlatformException =
      PlatformException(code: 'fake-platform-exception');

  const fakeLocalizedReason = 'Complete the biometrics to continue';
  final fakeAuthMessages = <AuthMessages>[
    const AndroidAuthMessages(
      signInTitle: 'Biometric authentication required!',
      cancelButton: 'No thanks',
      biometricNotRecognized: 'Failed Attempt',
      biometricRequiredTitle: 'Supports Biometric, but not setup',
      biometricSuccess: 'Recognised you',
      goToSettingsButton: 'Let\'s set-up biometric',
      goToSettingsDescription: 'You can set-up biometric on settings',
    ),
    const IOSAuthMessages(
      cancelButton: 'No thanks',
      goToSettingsButton: 'Let\'s set-up biometric',
      goToSettingsDescription: 'You can set-up biometric on settings',
      lockOut: 'You have been locked out',
      localizedFallbackTitle: 'Fallback',
    ),
  ];
  const fakeOptions = AuthenticationOptions(
    useErrorDialogs: true,
    stickyAuth: true,
    sensitiveTransaction: true,
  );

  setUpAll(
    () {
      registerFallbackValue(JWTDto.fromDomain(fakeJWT, fakeRefreshToken));
      registerFallbackValue(
        CredDto(
          username: fakeUserName.getOrCrash(),
          password: fakePassword.getOrCrash(),
        ),
      );

      configMock = ConfigMock();
      localDataSourceMock = AuthLocalDataSourceMock();

      tokenStorageMock = MockTokenStorage();
      remoteDataSourceMock = AuthRemoteDataSourceMock();
      accountSelectorStorageMock = AccountSelectorStorageMock();
      settingStorageMock = SettingStorageMock();
      credStorageMock = CredStorageMock();
      localAuthenticationMock = LocalAuthenticationMock();
      oktaLoginServicesMock = OktaLoginServicesMock();
      pushNotificationServiceMock = PushNotificationServiceMock();
      mixpanelService = MixpanelServiceMock();
      clevertapServiceMock = ClevertapServiceMock();
      productSuggestionHistoryStorageMock =
          ProductSuggestionHistoryStorageMock();
      materialBannerStorageMock = MaterialBannerStorageMock();
      repository = AuthRepository(
        mixpanelService: mixpanelService,
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
        tokenStorage: tokenStorageMock,
        accountSelectorStorage: accountSelectorStorageMock,
        credStorage: credStorageMock,
        localAuthentication: localAuthenticationMock,
        oktaLoginServices: oktaLoginServicesMock,
        pushNotificationService: pushNotificationServiceMock,
        settingStorage: settingStorageMock,
        clevertapService: clevertapServiceMock,
        productSuggestionHistoryStorage: productSuggestionHistoryStorageMock,
        materialBannerStorage: materialBannerStorageMock,
      );
    },
  );
  group(
    'Auth Repository should - ',
    () {
      test(
        'test login mock success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.loginWithPassword()).thenAnswer(
            (_) async => Login.empty()
                .copyWith(access: fakeJWT, refresh: fakeRefreshToken),
          );
          final result = await repository.login(
            password: fakePassword,
            username: fakeUserName,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'test login mock failure',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);

          when(() => localDataSourceMock.loginWithPassword()).thenThrow(
            (_) async => fakeError,
          );
          final result = await repository.login(
            password: fakePassword,
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'test login uat success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(() => pushNotificationServiceMock.getToken())
              .thenAnswer((_) async => fakeJWT.getValue());

          when(
            () => remoteDataSourceMock.loginWithPassword(
              password: fakePassword.getValidPassword,
              username: fakeUserName.getValue(),
              fcmToken: fakeJWT.getValue(),
            ),
          ).thenAnswer(
            (_) async => Login.empty().copyWith(access: fakeJWT),
          );
          final result = await repository.login(
            password: fakePassword,
            username: fakeUserName,
          );
          expect(result.isRight(), true);
          verify(
            () => mixpanelService.trackEvent(
              eventName: TrackingEvents.successfulLogin,
              properties: {
                TrackingProps.loginMethod: 'by_username',
              },
            ),
          ).called(1);
        },
      );

      test(
        'test login uat success but sale org in token is empty',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(() => pushNotificationServiceMock.getToken())
              .thenAnswer((_) async => fakeJWT.getValue());

          when(
            () => remoteDataSourceMock.loginWithPassword(
              password: fakePassword.getValidPassword,
              username: fakeUserName.getValue(),
              fcmToken: fakeJWT.getValue(),
            ),
          ).thenAnswer(
            (_) async => Login.empty(),
          );
          final result = await repository.login(
            password: fakePassword,
            username: fakeUserName,
          );
          expect(result, const Left(ApiFailure.accountCreationIncomplete()));
        },
      );

      test(
        'test login uat failure',
        () async {
          final serverException = ServerException();
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);

          when(() => pushNotificationServiceMock.getToken())
              .thenAnswer((_) async => fakeJWT.getValue());

          when(
            () => remoteDataSourceMock.loginWithPassword(
              password: fakePassword.getValidPassword,
              username: fakeUserName.getValue(),
              fcmToken: fakeJWT.getValue(),
            ),
          ).thenThrow(serverException);
          final result = await repository.login(
            password: fakePassword,
            username: fakeUserName,
          );

          expect(result.isLeft(), true);
          verify(
            () => mixpanelService.trackEvent(
              eventName: TrackingEvents.loginFailure,
              properties: {
                TrackingProps.username: fakeUserName.getValue(),
                TrackingProps.errorMessage: serverException.message,
                TrackingProps.loginMethod: 'by_username',
              },
            ),
          ).called(1);
        },
      );

      test(
        'test proxyLogin mock success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
          when(() => localDataSourceMock.proxyLoginWithUsername()).thenAnswer(
            (_) async => Login.empty().copyWith(
              access: fakeJWT,
              refresh: fakeRefreshToken,
            ),
          );
          final result = await repository.proxyLogin(
            username: fakeUserName,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'test proxyLogin mock failure',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
          when(() => localDataSourceMock.proxyLoginWithUsername()).thenThrow(
            (_) async => fakeError,
          );
          final result = await repository.proxyLogin(
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'test proxyLogin uat success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.proxyLoginWithUsername(
              username: fakeUserName.getValue(),
            ),
          ).thenAnswer(
            (_) async => Login.empty().copyWith(
              access: fakeJWT,
              refresh: fakeRefreshToken,
            ),
          );
          final result = await repository.proxyLogin(
            username: fakeUserName,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'test login uat success but sale org in token is empty',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.proxyLoginWithUsername(
              username: fakeUserName.getValue(),
            ),
          ).thenAnswer(
            (_) async => Login.empty(),
          );
          final result = await repository.proxyLogin(
            username: fakeUserName,
          );
          expect(result, const Left(ApiFailure.accountCreationIncomplete()));
        },
      );

      test(
        'test proxyLogin uat failure',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => remoteDataSourceMock.proxyLoginWithUsername(
              username: fakeUserName.getValue(),
            ),
          ).thenThrow((_) => fakeError);
          final result = await repository.proxyLogin(
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'test getEZRXJWT mock success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
          when(
            () => localDataSourceMock.loginWithOktaToken(),
          ).thenAnswer(
            (_) async => Login.empty().copyWith(
              access: fakeJWT,
              refresh: fakeRefreshToken,
            ),
          );
          final result = await repository.getEZRXJWT(fakeJWT);
          expect(result.isRight(), true);
        },
      );

      test(
        'test getEZRXJWT mock failure',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
          when(
            () => localDataSourceMock.loginWithOktaToken(),
          ).thenThrow(
            (_) => fakeError,
          );
          final result = await repository.getEZRXJWT(fakeJWT);
          expect(result.isLeft(), true);
        },
      );

      test(
        'test getEZRXJWT uat success',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => pushNotificationServiceMock.getToken(),
          ).thenAnswer(
            (_) async => fakeJWT.getOrCrash(),
          );
          when(
            () => remoteDataSourceMock.loginWithOktaToken(
              oktaAccessToken: fakeJWT.getOrCrash(),
              fcmToken: fakeJWT.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => Login.empty().copyWith(
              access: fakeJWT,
              refresh: fakeRefreshToken,
            ),
          );
          final result = await repository.getEZRXJWT(fakeJWT);
          expect(result.isRight(), true);
        },
      );

      test(
        'test getEZRXJWT uat failure',
        () async {
          when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
          when(
            () => pushNotificationServiceMock.getToken(),
          ).thenThrow(
            (_) async => fakeError,
          );

          final result = await repository.getEZRXJWT(fakeJWT);
          expect(result.isLeft(), true);
        },
      );

      test('test storeJWT success', () async {
        when(
          () => tokenStorageMock.set(any<JWTDto>()),
        ).thenAnswer((invocation) => Future.value());
        final result = await repository.storeJWT(
          access: fakeJWT,
          refresh: fakeRefreshToken,
        );
        expect(result.isRight(), true);
      });

      test('test storeJWT failure', () async {
        when(
          () => tokenStorageMock.set(any<JWTDto>()),
        ).thenThrow(
          fakeError,
        );
        final result =
            await repository.storeJWT(access: fakeJWT, refresh: fakeJWT);
        expect(result.isLeft(), true);
      });

      test('test initTokenStorage success', () async {
        when(
          () => tokenStorageMock.init(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        final result = await repository.initTokenStorage();
        expect(result.isRight(), true);
      });

      test('test initTokenStorage failure', () async {
        when(
          () => tokenStorageMock.init(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.initTokenStorage();
        expect(result.isLeft(), true);
      });

      test('test tokenValid mock success', () async {
        when(() => configMock.appFlavor).thenAnswer(
          (_) => Flavor.mock,
        );
        when(
          () => tokenStorageMock.get(),
        ).thenAnswer(
          (_) async => JWTDto(access: '', refresh: ''),
        );
        final result = await repository.tokenValid();
        expect(result.isRight(), true);
      });

      test('test tokenValid expire', () async {
        when(() => configMock.appFlavor).thenAnswer(
          (_) => Flavor.uat,
        );
        when(
          () => tokenStorageMock.get(),
        ).thenAnswer(
          (_) async => JWTDto(access: '', refresh: ''),
        );
        final result = await repository.tokenValid();
        expect(result.isLeft(), true);
      });

      test('test tokenValid failure', () async {
        when(
          () => tokenStorageMock.get(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.tokenValid();
        expect(result.isLeft(), true);
      });

      test('test getRefreshToken success', () async {
        when(
          () => tokenStorageMock.get(),
        ).thenAnswer(
          (_) async => JWTDto(
            access: '',
            refresh: fakeRefreshToken.getOrCrash(),
          ),
        );
        final result = await repository.getRefreshToken();
        expect(result.isRight(), true);
      });

      test('test getRefreshToken Invalid Refresh Token', () async {
        when(
          () => tokenStorageMock.get(),
        ).thenAnswer(
          (_) async => JWTDto(access: '', refresh: ''),
        );
        final result = await repository.getRefreshToken();
        expect(result, const Left(ApiFailure.refreshTokenInvalid()));
      });

      test('test getRefreshToken failure', () async {
        when(
          () => tokenStorageMock.get(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.getRefreshToken();
        expect(result.isLeft(), true);
      });

      test('test initOkta success', () async {
        when(
          () => oktaLoginServicesMock.init(),
        ).thenAnswer(
          (_) async => true,
        );
        final result = await repository.initOkta();
        expect(result.isRight(), true);
      });

      test('test initOkta failure', () async {
        when(
          () => oktaLoginServicesMock.init(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.initOkta();
        expect(result.isLeft(), true);
      });

      test('test loginWithOkta success', () async {
        when(
          () => oktaLoginServicesMock.login(),
        ).thenAnswer(
          (_) async => {},
        );
        final result = await repository.loginWithOkta();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.successfulLogin,
            properties: {
              TrackingProps.loginMethod: 'sso',
            },
          ),
        ).called(1);

        expect(result.isRight(), true);
      });

      test('test loginWithOkta failure', () async {
        when(
          () => oktaLoginServicesMock.login(),
        ).thenThrow(
          fakeError,
        );
        final result = await repository.loginWithOkta();
        expect(result.isLeft(), true);
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.loginFailure,
            properties: {
              TrackingProps.loginMethod: 'sso',
              TrackingProps.errorMessage: fakeError.toString(),
            },
          ),
        ).called(1);
      });

      test('test getOktaAccessToken success', () async {
        when(
          () => oktaLoginServicesMock.getAccessToken(),
        ).thenAnswer(
          (_) async => {'message': 'fake-jwt'},
        );
        final result = await repository.getOktaAccessToken();
        expect(result.isRight(), true);
      });

      test('test getOktaAccessToken failure', () async {
        when(
          () => oktaLoginServicesMock.getAccessToken(),
        ).thenThrow(fakePlatformException);
        final result = await repository.getOktaAccessToken();
        expect(result.isLeft(), true);
      });

      test('test logout success', () async {
        when(
          () => tokenStorageMock.clear(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => oktaLoginServicesMock.logout(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => accountSelectorStorageMock.delete(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => settingStorageMock.clear(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => clevertapServiceMock.logout(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => productSuggestionHistoryStorageMock.clear(),
        ).thenAnswer(
          (_) => Future.value(),
        );

        when(
          () => materialBannerStorageMock.clear(),
        ).thenAnswer(
          (_) => Future.value(),
        );
        final result = await repository.logout();
        expect(result.isRight(), true);
      });

      test('test logout failure', () async {
        when(
          () => tokenStorageMock.clear(),
        ).thenThrow(
          fakeError,
        );
        final result = await repository.logout();
        expect(result.isLeft(), true);
      });

      test('test storeCredential success', () async {
        when(
          () => credStorageMock.set(
            any<CredDto>(),
          ),
        ).thenAnswer(
          (_) => Future.value(),
        );

        final result = await repository.storeCredential(
          username: fakeUserName,
          password: fakePassword,
        );
        expect(result.isRight(), true);
      });

      test('test storeCredential failure', () async {
        when(
          () => credStorageMock.set(
            any<CredDto>(),
          ),
        ).thenThrow(
          fakeError,
        );
        final result = await repository.storeCredential(
          username: fakeUserName,
          password: fakePassword,
        );
        expect(result.isLeft(), true);
      });

      test('test deleteCredential success', () async {
        when(
          () => credStorageMock.delete(),
        ).thenAnswer(
          (_) => Future.value(),
        );

        final result = await repository.deleteCredential();
        expect(result.isRight(), true);
      });

      test('test deleteCredential failure', () async {
        when(
          () => credStorageMock.delete(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.deleteCredential();
        expect(result.isLeft(), true);
      });

      test('test initCredStorage success', () async {
        when(
          () => credStorageMock.init(),
        ).thenAnswer(
          (_) => Future.value(),
        );

        final result = await repository.initCredStorage();
        expect(result.isRight(), true);
      });

      test('test initCredStorage failure', () async {
        when(
          () => credStorageMock.init(),
        ).thenThrow(
          (_) async => fakeError,
        );
        final result = await repository.initCredStorage();
        expect(result.isLeft(), true);
      });

      test('test loadCredential success', () async {
        when(
          () => credStorageMock.get(),
        ).thenAnswer(
          (_) async => CredDto(
            username: fakeUserName.getOrCrash(),
            password: fakePassword.getOrCrash(),
          ),
        );

        final result = await repository.loadCredential();
        expect(result.isRight(), true);
      });

      test('test loadCredential failure', () async {
        when(
          () => credStorageMock.get(),
        ).thenThrow(
          (_) => fakeError,
        );
        final result = await repository.loadCredential();
        expect(result.isLeft(), true);
      });

      test('test doBiometricAuthentication success', () async {
        when(
          () => localAuthenticationMock.authenticate(
            localizedReason: fakeLocalizedReason,
            authMessages: fakeAuthMessages,
            options: fakeOptions,
          ),
        ).thenAnswer(
          (_) async => true,
        );

        final result = await repository.doBiometricAuthentication();
        expect(result.isRight(), true);
      });

      test('test doBiometricAuthentication failure', () async {
        when(
          () => localAuthenticationMock.authenticate(
            localizedReason: fakeLocalizedReason,
            authMessages: fakeAuthMessages,
            options: fakeOptions,
          ),
        ).thenAnswer(
          (_) async => false,
        );
        final result = await repository.doBiometricAuthentication();
        expect(result.isLeft(), true);
      });

      test('test doBiometricAuthentication Platform Error', () async {
        when(
          () => localAuthenticationMock.authenticate(
            localizedReason: fakeLocalizedReason,
            authMessages: fakeAuthMessages,
            options: fakeOptions,
          ),
        ).thenThrow(
          fakePlatformException,
        );
        final result = await repository.doBiometricAuthentication();
        expect(result.isLeft(), true);
      });

      test(
        'test canBeAuthenticatedAndBioAvailable device not support',
        () async {
          when(
            () => localAuthenticationMock.isDeviceSupported(),
          ).thenAnswer(
            (_) async => false,
          );

          final result = await repository.canBeAuthenticatedAndBioAvailable();
          expect(result.isLeft(), true);
        },
      );

      test(
        'test canBeAuthenticatedAndBioAvailable Cannot Check Biometrics',
        () async {
          when(
            () => localAuthenticationMock.isDeviceSupported(),
          ).thenAnswer(
            (_) async => true,
          );
          when(
            () => localAuthenticationMock.canCheckBiometrics,
          ).thenAnswer(
            (_) async => false,
          );
          final result = await repository.canBeAuthenticatedAndBioAvailable();
          expect(result.isLeft(), true);
        },
      );

      test(
        'test canBeAuthenticatedAndBioAvailable Cannot Check Biometrics',
        () async {
          when(
            () => localAuthenticationMock.isDeviceSupported(),
          ).thenAnswer(
            (_) async => true,
          );
          when(
            () => localAuthenticationMock.canCheckBiometrics,
          ).thenAnswer(
            (_) async => false,
          );
          final result = await repository.canBeAuthenticatedAndBioAvailable();
          expect(result.isLeft(), true);
        },
      );

      test(
        'test canBeAuthenticatedAndBioAvailable Not Available Biometrics',
        () async {
          when(
            () => localAuthenticationMock.isDeviceSupported(),
          ).thenAnswer(
            (_) async => true,
          );
          when(
            () => localAuthenticationMock.canCheckBiometrics,
          ).thenAnswer(
            (_) async => true,
          );
          when(
            () => localAuthenticationMock.getAvailableBiometrics(),
          ).thenAnswer(
            (_) async => <BiometricType>[],
          );
          final result = await repository.canBeAuthenticatedAndBioAvailable();
          expect(result.isLeft(), true);
        },
      );

      test('test canBeAuthenticatedAndBioAvailable Success', () async {
        when(
          () => localAuthenticationMock.isDeviceSupported(),
        ).thenAnswer(
          (_) async => true,
        );
        when(
          () => localAuthenticationMock.canCheckBiometrics,
        ).thenAnswer(
          (_) async => true,
        );
        when(
          () => localAuthenticationMock.getAvailableBiometrics(),
        ).thenAnswer(
          (_) async => [BiometricType.strong],
        );
        final result = await repository.canBeAuthenticatedAndBioAvailable();
        expect(result.isRight(), true);
      });

      test('test canBeAuthenticatedAndBioAvailable Failure', () async {
        when(
          () => localAuthenticationMock.isDeviceSupported(),
        ).thenThrow(fakePlatformException);

        final result = await repository.canBeAuthenticatedAndBioAvailable();
        expect(result.isLeft(), true);
      });

      test('test checkBiometricPermission Cannot Check Biometrics', () async {
        when(
          () => localAuthenticationMock.canCheckBiometrics,
        ).thenAnswer(
          (_) async => false,
        );

        final result = await repository.checkBiometricPermission();
        expect(result.isLeft(), true);
      });

      test('test checkBiometricPermission Success', () async {
        when(
          () => localAuthenticationMock.canCheckBiometrics,
        ).thenAnswer(
          (_) async => true,
        );

        final result = await repository.checkBiometricPermission();
        expect(result.isRight(), true);
      });

      test('test checkBiometricPermission Failure', () async {
        when(
          () => localAuthenticationMock.canCheckBiometrics,
        ).thenThrow(fakePlatformException);

        final result = await repository.checkBiometricPermission();
        expect(result.isLeft(), true);
      });

      test('test canShowBiometricToggle device not supported', () async {
        when(
          () => localAuthenticationMock.isDeviceSupported(),
        ).thenAnswer(
          (_) async => false,
        );

        final result = await repository.canShowBiometricToggle();
        expect(result.isLeft(), true);
      });

      test('test canShowBiometricToggle success', () async {
        when(
          () => localAuthenticationMock.isDeviceSupported(),
        ).thenAnswer(
          (_) async => true,
        );
        final result = await repository.canShowBiometricToggle();
        expect(result.isRight(), true);
      });

      test('test canShowBiometricToggle failure', () async {
        when(
          () => localAuthenticationMock.isDeviceSupported(),
        ).thenThrow(
          fakePlatformException,
        );
        final result = await repository.canShowBiometricToggle();
        expect(result.isLeft(), true);
      });

      test('test isBiometricEnabled success', () {
        when(
          () => settingStorageMock.isBiometricEnabled(),
        ).thenAnswer(
          (_) => true,
        );

        final result = repository.isBiometricEnabled();
        expect(result.isRight(), true);
      });

      test('test isBiometricEnabled failure', () {
        when(
          () => settingStorageMock.isBiometricEnabled(),
        ).thenThrow(
          fakePlatformException,
        );
        final result = repository.isBiometricEnabled();
        expect(result.isLeft(), true);
      });

      test('test putBiometricEnabledState success', () async {
        when(
          () => settingStorageMock.putBiometricStatus(isBiometricEnabled: true),
        ).thenAnswer(
          (_) => Future.value(),
        );

        final result =
            await repository.putBiometricEnabledState(isBiometricEnable: true);
        expect(result.isRight(), true);
      });

      test('test putBiometricEnabledState failure', () async {
        when(
          () => settingStorageMock.putBiometricStatus(isBiometricEnabled: true),
        ).thenThrow(
          fakePlatformException,
        );
        final result =
            await repository.putBiometricEnabledState(isBiometricEnable: true);
        expect(result.isLeft(), true);
      });

      test('test getAccessToken mock success', () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
        when(
          () => localDataSourceMock.getAccessToken(),
        ).thenAnswer(
          (_) async => Login.empty().copyWith(
            access: fakeJWT,
            refresh: fakeRefreshToken,
          ),
        );

        final result = await repository.getAccessToken(fakeJWT);
        expect(result.isRight(), true);
      });

      test('test getAccessToken mock failure', () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.mock);
        when(
          () => localDataSourceMock.getAccessToken(),
        ).thenThrow((_) => fakeError);
        final result = await repository.getAccessToken(fakeJWT);
        expect(result.isLeft(), true);
      });

      test('test getAccessToken uat success', () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
        when(
          () => remoteDataSourceMock.getAccessToken(
            refreshToken: fakeJWT.getOrCrash(),
          ),
        ).thenAnswer(
          (_) async => Login.empty().copyWith(
            access: fakeJWT,
            refresh: fakeRefreshToken,
          ),
        );

        final result = await repository.getAccessToken(fakeJWT);
        expect(result.isRight(), true);
      });

      test('test getAccessToken uat failure', () async {
        when(() => configMock.appFlavor).thenAnswer((_) => Flavor.uat);
        when(
          () => remoteDataSourceMock.getAccessToken(
            refreshToken: fakeJWT.getOrCrash(),
          ),
        ).thenThrow((_) => fakeError);
        final result = await repository.getAccessToken(fakeJWT);
        expect(result.isLeft(), true);
      });
    },
  );
}
