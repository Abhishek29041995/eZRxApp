import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late StockInfoLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = StockInfoLocalDataSource();
    },
  );

  group(
    'Stock Info',
    () {
      test(
        'get stock info',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_stock_infomation_list/getStockInformationListResponse.json',
            ),
          );

          return List.from(res['data']['getStockInformationLists'])
              .map((e) => MaterialStockInfoDto.fromJson(e).toDomain())
              .toList();
        },
      );

      test(
        'get Stock info list',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/stock_information_list/stockInformationListResponse.json',
            ),
          );

          final result = await localDataSource.getStockInfoList();

          expect(
            result,
            List.from(res['data']['stockInformationList'])
                .map((e) => StockInfoDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
      test('notifyStockApiStatusUpdated', () async {
        // Listen to the stream before the action
        final statusUpdates = <bool>[];
        final subscription = localDataSource.stockApiStatusData.listen(
          (status) {
            statusUpdates.add(status);
          },
        );

        // Trigger the API status update
        localDataSource.notifyStockApiStatusUpdated(true);

        // Allow some time for the stream to emit
        await Future.delayed(const Duration(milliseconds: 100));

        // Assert that the stream emitted the correct value
        expect(statusUpdates, [true]);

        // Cancel the subscription to prevent memory leaks
        await subscription.cancel();
      });
    },
  );
}
