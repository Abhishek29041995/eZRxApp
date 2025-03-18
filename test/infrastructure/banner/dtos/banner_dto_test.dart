import 'dart:convert';

import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic eZReachData;
  group('Banner DTO', () {
    setUp(() async {
      eZReachData = json.decode(
        await rootBundle
            .loadString('assets/json/get_EZ_reach_banner/getEZReachBannerResponse.json'),
      );
    });
    test('toDomain Test', () {
      final eZReachFirstBannerData = EZReachBannerDto.fromJson(
        eZReachData['data']['getLiveCampaigns']['data'][0],
      ).toDomain();
      expect(eZReachFirstBannerData.mobileBannerUrl.isNotEmpty, true);
      expect(eZReachFirstBannerData.tabBannerUrl.isNotEmpty, true);
      expect(eZReachFirstBannerData.navigationalURL.isValid(), true);
      expect(eZReachFirstBannerData.keyword.isValid(), true);

      final eZReachSecondBannerData = EZReachBannerDto.fromJson(
        eZReachData['data']['getLiveCampaigns']['data'][1],
      ).toDomain();
      expect(!eZReachSecondBannerData.navigationalURL.isValid(), true);
      expect(eZReachSecondBannerData.keyword.isValid(), true);
    });
  });
}
