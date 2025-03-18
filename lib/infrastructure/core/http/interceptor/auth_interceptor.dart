import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';

import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';

class AuthInterceptor extends Interceptor {
  final DeviceStorage deviceStorage;
  final TokenStorage tokenStorage;
  final PackageInfoService packageInfoService;
  final Config config;
  final AuthQueryMutation authQueryMutation;
  final PushNotificationService pushNotificationService;

  String get _marketDomain =>
      AppMarket(deviceStorage.currentMarket()).marketDomain;

  AuthInterceptor({
    required this.deviceStorage,
    required this.tokenStorage,
    required this.packageInfoService,
    required this.config,
    required this.authQueryMutation,
    required this.pushNotificationService,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = config.baseUrl(marketDomain: _marketDomain);

    try {
      var token = await tokenStorage.get();
      if (token.access.isNotEmpty) {
        final isTokenExpired = token.toDomain().isExpired;
        final isNotMockFlavor = config.appFlavor != Flavor.mock;
        if (isTokenExpired && isNotMockFlavor) {
          token = await _refreshToken() ?? token;
        }
        if (options.uri.path == config.getEZReachUrlConstant) {
          options.headers['Authorization'] = config.eZReachToken;
        } else if (options.uri.path != config.announcementApiUrlPath) {
          options.headers['Authorization'] = 'Bearer V2 ${token.access}';
        }
      }

      if (options.uri.path == config.announcementApiUrlPath) {
        options.headers['X-GQL-Token'] = config.getAnnouncementApiKey;
      }
      options.headers['package'] = await packageInfoService.getPackageName();
      options.headers['version'] = await packageInfoService.getVersion();
      options.headers['build'] = await packageInfoService.getBuildNumber();
      options.headers['platform'] = 'app';
    } on CacheException catch (_) {}
    options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    options.headers['Accept-Language'] = tr('en');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      if (response.data['errors'] != null &&
          response.data['errors'].isNotEmpty &&
          (response.data['errors'][0]['message'] == 'authentication failed' ||
              response.data['errors'][0]['message'] ==
                  'status: 401, message: token has either expired or its not valid')) {
        final newJwt = await _refreshToken();
        if (newJwt != null) {
          final newResponse = await _retry(newJwt, response.requestOptions);

          return handler.next(newResponse);
        }
      }

      return super.onResponse(response, handler);
    } catch (e) {
      return super.onResponse(response, handler);
    }
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    return super.onError(err, handler);
  }

  Future<JWTDto?> _refreshToken() async {
    try {
      final token = await tokenStorage.get();
      final refreshToken = JWT(token.refresh);
      final dio = Dio(
        BaseOptions(
          baseUrl: config.baseUrl(marketDomain: _marketDomain),
          method: 'POST',
        ),
      );

      final accessTokenResponse = await dio.request(
        '${config.urlConstants}regenerateToken',
        data: jsonEncode(
          {
            'query': authQueryMutation.getAccessToken(),
            'variables': {
              'eZRxRefreshToken': refreshToken.getOrDefaultValue(''),
            },
          },
        ),
      );
      final jwt =
          LoginDto.fromJson(accessTokenResponse.data['data']['getAccessToken'])
              .toDomain();

      final newJwt = JWTDto.fromDomain(jwt.access, jwt.refresh);
      await tokenStorage.set(newJwt);

      return newJwt;
    } catch (e) {
      return null;
    }
  }

  Future<Response<dynamic>> _retry(
    JWTDto jwt,
    RequestOptions requestOptions,
  ) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl(marketDomain: _marketDomain),
        sendTimeout: Duration(milliseconds: config.httpSendTimeout),
        connectTimeout: Duration(milliseconds: config.httpConnectTimeout),
        receiveTimeout: Duration(milliseconds: config.httpReceiveTimeout),
      ),
    );

    if (jwt.access.isNotEmpty) {
      requestOptions.headers['Authorization'] = 'Bearer V2 ${jwt.access}';
    }

    return await dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }
}
