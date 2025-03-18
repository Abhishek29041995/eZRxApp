import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ResetPasswordMock extends Mock implements ResetPassword {}

void main() {
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  late ChangePasswordRemoteDataSource changePasswordRemoteDataSource;

  final dio = Dio(BaseOptions(baseUrl: 'https://uat.ezrxplus.com'));
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      changePasswordRemoteDataSource = ChangePasswordRemoteDataSource(
        httpService: service,
        authQueryMutation: AuthQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: Config(),
      );
    },
  );
  group(
    'Change password remote',
    () {
      test(
        'Change password success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/change_password/changePasswordResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePassword(),
            }),
          );

          final result = await changePasswordRemoteDataSource.changePassword(
            'username',
            'password',
            'password',
          );

          expect(
            result,
            ResetPasswordDto.fromJson(res['data']['changePassword']).toDomain(),
          );
        },
      );

      test(
        'Change password success but empty',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': {
                  'changePassword': {
                    'success': true,
                    'status': '',
                  },
                },
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePassword(
            'username',
            'password',
            'password',
          )
              .onError((error, _) async {
            expect(error, isA<OtherException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Change password error with data null and have errors',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePassword(
            'username',
            'password',
            'password',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Change password error with status code != 200',
        () async {
          dioAdapter.onPost(
            '/api/loginAd',
            (server) => server.reply(
              204,
              {'data': []},
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePassword(
            'username',
            'password',
            'password',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );
    },
  );
  group(
    'Reset Password remote',
    () {
      test(
        'Reset Password success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/reset_password_v3/resetPasswordV3Response.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .resetPassword(),
              'variables': {
                'newPassword': 'password',
                'resetPasswordToken': 'fake_token',
              },
            }),
          );

          final result = await changePasswordRemoteDataSource.resetPassword(
            newPassword: 'password',
            resetPasswordToken: 'fake_token',
          );

          expect(
            result,
            ResetPasswordDto.fromJson(res['data']['resetPasswordV3'])
                .toDomain(),
          );
        },
      );

      test(
        'Reset Password success but empty',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': {
                  'resetPasswordV3': {
                    'success': true,
                    'status': '',
                  },
                },
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .resetPassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .resetPassword(
            newPassword: 'password',
            resetPasswordToken: 'fake_token',
          )
              .onError((error, _) async {
            expect(error, isA<OtherException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Reset Password error with data null and have errors',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .resetPassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .resetPassword(
            newPassword: 'password',
            resetPasswordToken: 'fake_token',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Reset Password error with status code != 200',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              204,
              {'data': []},
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .resetPassword(),
            }),
          );

          await changePasswordRemoteDataSource
              .resetPassword(
            newPassword: 'password',
            resetPasswordToken: 'fake_token',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );
    },
  );
  group(
    'Change Password For First Time remote',
    () {
      test(
        'Change Password For First Time success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/change_password_first_time/changePasswordFirstTimeResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePasswordForFirstTime(),
            }),
          );

          final result =
              await changePasswordRemoteDataSource.changePasswordForFirstTime(
            newPassword: 'password',
          );

          expect(
            result,
            ResetPasswordDto.fromJson(res['data']['changePasswordFirstTime'])
                .toDomain(),
          );
        },
      );

      test(
        'Change Password For First Time success but empty',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': {
                  'changePasswordFirstTime': {
                    'success': true,
                    'status': '',
                  },
                },
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePasswordForFirstTime(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePasswordForFirstTime(
            newPassword: 'password',
          )
              .onError((error, _) async {
            expect(error, isA<OtherException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Change Password For First Time error with data null and have errors',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePasswordForFirstTime(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePasswordForFirstTime(
            newPassword: 'password',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );

      test(
        'Change Password For First Time error with status code != 200',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              204,
              {'data': []},
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': changePasswordRemoteDataSource.authQueryMutation
                  .changePasswordForFirstTime(),
            }),
          );

          await changePasswordRemoteDataSource
              .changePasswordForFirstTime(
            newPassword: 'password',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ResetPasswordMock());
          });
        },
      );
    },
  );
}
