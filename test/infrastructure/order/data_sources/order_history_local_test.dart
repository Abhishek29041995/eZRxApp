import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViewByItemLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ViewByItemLocalDataSource();
    },
  );

  group(
    'Order History',
    () {
      test(
        'Get Order History',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
            ),
          );

          final result = await localDataSource.getViewByItems();

          final finalData =
              res['data']['orderHistoryFetchByItems']['OrderHistory'][0];

          expect(
            result,
            OrderHistoryDto.fromJson(
              makeResponseCamelCase(
                jsonEncode(finalData),
              ),
            ).toDomain(),
          );
        },
      );

      /*test(
        'Ge order history for sales rep',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getorderHistoryForSalesRepV2Response.json'),
          );

          final result =
              await localDataSource.getOrderHistoryForSalesRep();
          final finalData = res['data']['orderHistoryForSalesRepV2']['OrderHistory'][0];
          expect(
            result,
            OrderHistoryDto.fromJson(finalData).toDomain(),
          );
        },
      );*/
    },
  );
}
