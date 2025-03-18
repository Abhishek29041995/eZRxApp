import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PriceOverrideLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PriceOverrideLocalDataSource();
    },
  );

  group(
    'Price Override',
    () {
      test(
        'Get Price override',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/common/getPriceOverrideResponse.json'),
          );

          final result = await localDataSource.getOverridePrice();

          final finalData = res['data']['price'];

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList()
                .first,
          );
        },
      );
    },
  );
}
