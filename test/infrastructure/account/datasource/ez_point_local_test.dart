import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ez_point_token_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EZPointLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = EZPointLocalDataSource();
    },
  );

  group(
    'EZPointLocalDataSource',
    () {
      test(
        'Get EZPoint Token',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/get_EZ_point/getEZPointResponse.json'),
          );

          final result = await localDataSource.getEZPointToken();

          expect(
            result,
            EZPointTokenResponseDto.fromJson(
              res['data']['getEzPointToken'],
            ).toDomain,
          );
        },
      );
    },
  );
}
