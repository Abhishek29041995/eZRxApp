import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViewByOrderDetailsLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ViewByOrderDetailsLocalDataSource();
    },
  );

  group(
    'Order History Details',
    () {
      test(
        'Get Order History Details',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_order_details/getOrderDetailsResponse.json'),
          );

          final result = await localDataSource.getOrderHistoryDetails();

          final finalData = res['data']['orderHistoryV3']['orderHeaders'][0];

          expect(
            result,
            OrderHistoryDetailsDto.fromJson(
              makeResponseCamelCase(
                jsonEncode(finalData),
              ),
            ).toDomain(),
          );
        },
      );
    },
  );
}
