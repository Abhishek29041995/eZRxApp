import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BannerLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = BannerLocalDataSource();
  });

  group('Banners Local', () {
    test('Get Banners Test', () async {
      final res = json.decode(
        await rootBundle
            .loadString('assets/json/get_EZ_reach_banner/getEZReachBannerResponse.json'),
      );
      final result = await localDataSource.getEZReachBanners(
        bannerType: 'banner_carousel',
      );

      expect(
        result.length,
        List.from(res['data']['getLiveCampaigns']['data']).length,
      );
    });
  });
}
