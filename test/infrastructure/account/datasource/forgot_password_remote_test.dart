import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ForgotPasswordRemoteDataSource remoteDataSource;

  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ForgotPasswordRemoteDataSource(
        authQueryMutation: AuthQueryMutation(),
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
    },
  );

  group(
    'Forgot Password Remote DataSource Test',
    () {
      test(
        '=> Failure with invalid username',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'errors': [
                  {
                    'message': 'Invalid username or password',
                  }
                ],
                'data': null,
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.authQueryMutation.requestResetPassword(),
              'variables': {
                'username': 'fake-username',
                'language': 'E',
              },
            }),
          );

          await remoteDataSource
              .requestResetPassword(
            username: 'fake-username',
          )
              .onError((error, _) async {
            expect(error, isA<AuthException>());
            return Future.value(ForgotPassword.empty());
          });
        },
      );
    },
  );
}
