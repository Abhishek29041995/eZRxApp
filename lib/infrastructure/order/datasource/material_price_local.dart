import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:flutter/services.dart';

class MaterialPriceLocalDataSource {
  MaterialPriceLocalDataSource();

  Future<List<Price>> getPriceList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString('assets/json/common/getMaterialPriceResponse.json'),
    );
    final finalData = data['data']['price'];

    return List.from(makeResponseCamelCase(jsonEncode(finalData)))
        .map((e) => PriceDto.fromJson(e).toDomain())
        .toList();
  }
}
