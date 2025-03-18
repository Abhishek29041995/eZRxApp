import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ForgotPasswordMock extends Mock implements ForgotPassword {}

void main() {
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  late ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  final dio = Dio(BaseOptions(baseUrl: 'https://uat.ezrxplus.com'));
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      forgotPasswordRemoteDataSource = ForgotPasswordRemoteDataSource(
        httpService: service,
        authQueryMutation: AuthQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: Config(),
      );
    },
  );
  group(
    'Forgot password remote',
    () {
      test(
        'Forgot password success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/request_reset_password_link/requestResetPasswordLinkResponse.json',
            ),
          );
          final variable = {
            'username': 'fake-user-name',
            'language': 'EN',
          };

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': forgotPasswordRemoteDataSource.authQueryMutation
                  .requestResetPassword(),
              'variables': variable,
            }),
          );

          final result =
              await forgotPasswordRemoteDataSource.requestResetPassword(
            username: 'fake-user-name',
          );

          expect(
            result,
            ForgotPasswordDto.fromJson(res['data']['requestResetPassword'])
                .toDomain(),
          );
        },
      );

      test(
        'Forgot password error when user name invalid',
        () async {
          final variable = {
            'username': 'fake-user-name',
            'language': 'EN',
          };

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': '',
                'errors': [
                  {'message': 'Invalid username or password'},
                ],
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': forgotPasswordRemoteDataSource.authQueryMutation
                  .requestResetPassword(),
              'variables': variable,
            }),
          );

          await forgotPasswordRemoteDataSource
              .requestResetPassword(
            username: 'fake-user-name',
          )
              .onError((error, _) async {
            expect(error, isA<AuthException>());
            return Future.value(ForgotPasswordMock());
          });
        },
      );

      test(
        'Forgot password error ',
        () async {
          final variable = {
            'username': 'fake-user-name',
            'language': 'EN',
          };

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              204,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': forgotPasswordRemoteDataSource.authQueryMutation
                  .requestResetPassword(),
              'variables': variable,
            }),
          );

          await forgotPasswordRemoteDataSource
              .requestResetPassword(
            username: 'fake-user-name',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ForgotPasswordMock());
          });
        },
      );
    },
  );
}
