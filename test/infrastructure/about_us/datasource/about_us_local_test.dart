import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AboutUsLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
  const fileName = 'aboutUsSGmarketStaticContent.json';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AboutUsLocalDataSource();
    },
  );

  group(
    'AboutUsLocalDataSource',
    () {
      test(
        'Get About Us Static Info ',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/market_static_content/about_us/$fileName',
            ),
          );

          final result = await localDataSource.getAboutUsStaticInfo(fileName);

          final finalData =
              res['data']?['item']?['components'] as Map<String, dynamic>?;

          expect(
            result,
            AboutUsDto.fromJson(finalData ?? {}).toDomain(),
          );
        },
      );
    },
  );
}
