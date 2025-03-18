import 'dart:convert';

import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ForgotPasswordLocalDataSource forgotPasswordLocalDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      forgotPasswordLocalDataSource = ForgotPasswordLocalDataSource();
    },
  );

  group('Forgot password Local DataSource Test', () {
    test(
      '=> requestResetPassword',
      () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/request_reset_password_link/requestResetPasswordLinkResponse.json',
          ),
        );
        final result =
            await forgotPasswordLocalDataSource.requestResetPassword();

        expect(
          result,
          ForgotPasswordDto.fromJson(data['data']['requestResetPassword'])
              .toDomain(),
        );
      },
    );
  });
}
