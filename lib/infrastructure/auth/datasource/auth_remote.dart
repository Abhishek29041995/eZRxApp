import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AuthRemoteDataSource {
  HttpService httpService;
  AuthQueryMutation authQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AuthRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<Login> loginWithPassword({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.getLoginQuery(),
            'variables': {
              'input': {
                'username': username,
                'password': password,
                'mobileToken': {
                  'mobileTokens': [
                    {'token': fcmToken, 'provider': 'firebase'},
                  ],
                },
              },
            },
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (res) {
          _authExceptionChecker(res: res, jsonKey: 'loginV4');
        },
      );

      return LoginDto.fromJson(res.data['data']['loginV4']).toDomain();
    });
  }

  Future<Login> loginWithOktaToken({
    required String oktaAccessToken,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.getLoginQuery(),
            'variables': {
              'input': {
                'isOktaAuthenticated': true,
                'accessToken': oktaAccessToken,
                'mobileToken': {
                  'mobileTokens': [
                    {'token': fcmToken, 'provider': 'firebase'},
                  ],
                },
              },
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (res) {
          _authExceptionChecker(res: res, jsonKey: 'loginV4');
        },
      );

      return LoginDto.fromJson(res.data['data']['loginV4']).toDomain();
    });
  }

  Future<Login> proxyLoginWithUsername({required String username}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.getProxyLoginQuery(),
            'variables': {
              'request': {
                'username': username,
              },
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (res) {
          _authExceptionChecker(
            res: res,
            jsonKey: 'proxyLoginV3',
            isProxyLogin: true,
          );
        },
      );

      return LoginDto.fromJson(res.data['data']['proxyLoginV3']).toDomain();
    });
  }

  Future<Login> getAccessToken({
    required String refreshToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}regenerateToken',
        data: jsonEncode(
          {
            'query': authQueryMutation.getAccessToken(),
            'variables': {
              'eZRxRefreshToken': refreshToken,
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (res) {
          _authExceptionChecker(res: res, jsonKey: 'getAccessToken');
        },
      );

      return LoginDto.fromJson(res.data['data']['getAccessToken']).toDomain();
    });
  }

  void _authExceptionChecker({
    required Response<dynamic> res,
    required String jsonKey,
    bool isProxyLogin = false,
  }) {
    if (res.data['data'] != null && res.data['data'].isNotEmpty) {
      final jsonData = res.data['data'][jsonKey];

      if (jsonData['authenticated'] == false) {
        throw isProxyLogin
            ? const AuthException.accountBlocked()
            : const AuthException.invalidEmailAndPasswordCombination();
      } else if (jsonData['isAccountLocked'] == true) {
        throw const AuthException.accountLocked();
      } else if (jsonData['isAccountExpired'] == true) {
        throw const AuthException.accountExpired();
      }
    }

    if (isProxyLogin &&
        res.data['errors']?.isNotEmpty == true &&
        res.data['errors'][0]['message'] != null) {
      final message = res.data['errors'][0]['message'];

      if (isEqualsIgnoreCase(
        message,
        'ZP Admin can only login on behalf of users from the same Sales Org',
      )) {
        throw const AuthException.cannotProxyLoginFromDiffferentSalesOrg();
      } else if (isEqualsIgnoreCase(
        message,
        "can't do a proxy login for ROOT user",
      )) {
        throw const AuthException.cannotProxyLoginRootAdmin();
      } else if (isEqualsIgnoreCase(
        message,
        "ZP Admin can't login on behalf of ZP Admin",
      )) {
        throw const AuthException.cannotProxyLoginZPAdminWhenIsZPAdmin();
      } else if (isEqualsIgnoreCase(
            message,
            'Log in on behalf failed. You may only log in on behalf of sales reps and customers from the same sales org.',
          ) ||
          isEqualsIgnoreCase(message, 'invalid user role')) {
        throw const AuthException.cannotProxyLoginWithCurrentRole();
      }
    }
  }
}
