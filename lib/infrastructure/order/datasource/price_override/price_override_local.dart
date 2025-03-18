import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:flutter/services.dart';

class PriceOverrideLocalDataSource {
  PriceOverrideLocalDataSource();

  Future<Price> getOverridePrice() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/getPriceOverrideResponse.json',
      ),
    );

    final finalData = data['data']['price'];

    return List.from(makeResponseCamelCase(jsonEncode(finalData)))
        .map((e) => PriceDto.fromJson(e).toDomain())
        .toList()
        .first;
  }
}
