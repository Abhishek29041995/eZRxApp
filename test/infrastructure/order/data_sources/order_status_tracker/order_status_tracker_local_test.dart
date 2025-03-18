import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_status_tracker_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late OrderStatusTrackerLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = OrderStatusTrackerLocalDataSource();
    },
  );

  group(
    'Order Status Tracker local test',
    () {
      test(
        'Get Order Status Tracker from local source',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/get_zyllem_v2/getZyllemv2Response.json'),
          );
          final result = await localDataSource.getOrderStatusTracker();
          final finalData = res['data']['zyllemStatusV2']['Entry'];

          expect(
            result,
            List.from(finalData)
                .map((e) => OrderStatusTrackerDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
