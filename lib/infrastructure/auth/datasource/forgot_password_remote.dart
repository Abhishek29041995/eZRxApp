import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ForgotPasswordRemoteDataSource {
  final HttpService httpService;
  final AuthQueryMutation authQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;

  ForgotPasswordRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });
  Future<ForgotPassword> requestResetPassword({
    required String username,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final variable = {
        'username': username,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.requestResetPassword(),
            'variables': variable,
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _forgotPasswordExceptionChecker,
      );
      final data = res.data['data']['requestResetPassword'];

      return ForgotPasswordDto.fromJson(data).toDomain();
    });
  }

  Future<bool> validateResetPasswordKey({
    required String key,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final variable = {
        'key': key,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.validateResetPasswordKey(),
            'variables': variable,
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return res.data['data']['validateResetPasswordKey']['isValid'];
    });
  }

  void _forgotPasswordExceptionChecker(Response<dynamic> res) {
    final isInvalidUser = res.data['errors'] != null &&
        res.data['errors'].isNotEmpty &&
        isEqualsIgnoreCase(
          res.data['errors'][0]['message'],
          'Invalid username or password',
        );
    if (isInvalidUser) {
      throw const AuthException.invalidUserName();
    }
  }
}
