import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = ComboDealLocalDataSource();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  group(
    'Combo Deals',
    () {
      test(
        'Get combo deal material',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_combo_deal_for_material/getComboDealForMaterialResponseK1.json',
            ),
          );

          final result = await localDataSource.getComboDealList();

          expect(
            result,
            List.from(res['data']['comboDealForMaterials'])
                .map((e) => ComboDealDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Get combo deal principle group',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_combo_deal_for_principal/getComboDealForPrincipalK5Response.json',
            ),
          );

          final result = await localDataSource.getComboDeal();

          expect(
            result,
            ComboDealDto.fromJson(res['data']['comboDealForPrincMatGrp'])
                .toDomain,
          );
        },
      );
    },
  );
}
