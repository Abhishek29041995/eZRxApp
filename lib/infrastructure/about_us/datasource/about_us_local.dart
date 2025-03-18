import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class AboutUsLocalDataSource {
  Future<AboutUs> getAboutUsStaticInfo(String fileName) async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/market_static_content/about_us/$fileName'),
    );
    final finalData =
        res['data']?['item']?['components'] as Map<String, dynamic>?;

    return AboutUsDto.fromJson(finalData ?? {}).toDomain();
  }
}
