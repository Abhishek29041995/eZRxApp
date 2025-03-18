import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/auth_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceStorage extends Mock implements DeviceStorage {}

class MockTokenStorage extends Mock implements TokenStorage {}

class MockPackageInfoService extends Mock implements PackageInfoService {}

class MockAuthQueryMutation extends Mock implements AuthQueryMutation {}

class MockPushNotificationService extends Mock
    implements PushNotificationService {}

class MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class MockResponse extends Mock implements Response {}

class MockDio extends Mock implements Dio {}

void main() {
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });
  group('AuthInterceptor', () {
    late AuthInterceptor authInterceptor;
    late MockDeviceStorage deviceStorage;
    late MockTokenStorage tokenStorage;
    late MockPackageInfoService packageInfoService;
    late Config config;
    late MockAuthQueryMutation authQueryMutation;
    late MockPushNotificationService pushNotificationService;
    late MockResponseInterceptorHandler responseInterceptorHandler;
    late MockDio dio;

    setUp(() {
      deviceStorage = MockDeviceStorage();
      tokenStorage = MockTokenStorage();
      packageInfoService = MockPackageInfoService();
      config = locator<Config>();
      authQueryMutation = MockAuthQueryMutation();
      pushNotificationService = MockPushNotificationService();
      responseInterceptorHandler = MockResponseInterceptorHandler();
      dio = MockDio();

      authInterceptor = AuthInterceptor(
        deviceStorage: deviceStorage,
        tokenStorage: tokenStorage,
        packageInfoService: packageInfoService,
        config: config,
        authQueryMutation: authQueryMutation,
        pushNotificationService: pushNotificationService,
      );
    });

    test('onResponse - should refresh token on 401 error', () async {
      // Arrange
      final response = MockResponse();
      final requestOptions = RequestOptions(path: 'example_path');
      final jwtDto = JWTDto(
        access: 'access_token',
        refresh: 'refresh_token',
      );
      final newResponse = MockResponse();

      when(() => response.data).thenReturn({
        'errors': [
          {
            'message':
                'status: 401, message: token has either expired or its not valid',
          },
        ],
      });
      when(() => tokenStorage.get()).thenAnswer((invocation) async => jwtDto);
      when(
        () => deviceStorage.currentMarket(),
      ).thenReturn('my');

      when(() => authQueryMutation.getAccessToken())
          .thenReturn('example_query');
      when(() => responseInterceptorHandler.next(response))
          .thenAnswer((_) => Future.value(newResponse));
      when(
        () => dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        ),
      ).thenAnswer((_) => Future.value(newResponse));

      // Act
      await authInterceptor.onResponse(response, responseInterceptorHandler);

      // Assert
      verify(() => tokenStorage.get()).called(1);
      verify(
        () => config.baseUrl(
          marketDomain: AppMarket(deviceStorage.currentMarket()).marketDomain,
        ),
      ).called(1);
      verify(() => authQueryMutation.getAccessToken()).called(1);
    });

    test('onResponse - should not refresh token and handle other errors',
        () async {
      // Arrange
      final response = MockResponse();
      final requestOptions = RequestOptions(path: 'example_path');

      when(() => response.data).thenReturn({
        'errors': [
          {'message': 'some other error'},
        ],
      });
      when(() => responseInterceptorHandler.next(response))
          .thenAnswer((_) => Future.value(response));

      // Act
      await authInterceptor.onResponse(response, responseInterceptorHandler);

      // Assert
      verifyNever(() => tokenStorage.get());
      verifyNever(() => authQueryMutation.getAccessToken());
      verifyNever(
        () => dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        ),
      );
      verify(() => responseInterceptorHandler.next(response)).called(1);
    });
  });
}
