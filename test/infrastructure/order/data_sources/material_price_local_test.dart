import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MaterialPriceLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = MaterialPriceLocalDataSource();
    },
  );

  group(
    'Material Price',
    () {
      test(
        'Get Material Price List',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/common/getMaterialPriceResponse.json'),
          );

          final finalData = res['data']['price'];

          final result = await localDataSource.getPriceList();

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
