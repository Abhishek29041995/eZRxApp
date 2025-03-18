import 'dart:convert';

import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthLocalDataSource authLocalDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      authLocalDataSource = AuthLocalDataSource();
    },
  );

  group('Auth Local DataSource Test', () {
    test(
      '=> loginWithPassword',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/login_ad/loginAdResponse.json'),
        );
        final result = await authLocalDataSource.loginWithPassword();

        expect(
          result,
          LoginDto.fromJson(res['data']['loginV4']).toDomain(),
        );
      },
    );

    test(
      '=> loginWithOktaToken',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/login_ad/loginAdResponse.json'),
        );
        final result = await authLocalDataSource.loginWithOktaToken();

        expect(
          result,
          LoginDto.fromJson(res['data']['loginV4']).toDomain(),
        );
      },
    );

    test(
      '=> proxyLoginWithUsername',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/proxy_login/proxyLoginResponse.json'),
        );
        final result = await authLocalDataSource.proxyLoginWithUsername();

        expect(
          result,
          LoginDto.fromJson(res['data']['proxyLoginV3']).toDomain(),
        );
      },
    );

    test(
      '=> getAccessToken',
      () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/common/getAccessToken.json'),
        );
        final result = await authLocalDataSource.getAccessToken();

        expect(
          result,
          LoginDto.fromJson(res['data']['getAccessToken']).toDomain(),
        );
      },
    );
  });
}
