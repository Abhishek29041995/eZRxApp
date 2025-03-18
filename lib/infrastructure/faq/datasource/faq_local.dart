import 'dart:convert';

import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/faq/dtos/faq_info_dto.dart';
import 'package:flutter/services.dart';

class FAQInfoLocalDataSource {
  Future<FAQInfo> getFAQInfo(String country) async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/market_static_content/faq/faq${country}marketStaticContent.json',
      ),
    );

    return FAQInfoDto.fromJson(res).toDomain;
  }
}
