import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = CartLocalDataSource();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  group(
    'Cart local data source',
    () {
      test(
        'Cart local data source getAddedToCartProductList',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/get_added_to_cart_product_list/getAddedToCartProductList.json',
            ),
          );
          final finalData = data['data']['cart'];
          final result = await localDataSource.getAddedToCartProductList();
          expect(
            result,
            CartDto.fromJson(
              makeResponseCamelCase(jsonEncode(finalData)),
            ).toDomain(),
          );
        },
      );

      test(
        'Cart local data source upsertCart',
        () async {
          final data = json.decode(
            await rootBundle
                .loadString('assets/json/upsert_cart/upsertCartResponse.json'),
          );
          final finalData = data['data']['upsertCart']['EzRxItems'];
          final result = await localDataSource.upsertCart();

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source upsertCartItemsWithComboOffers',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/upsert_cart_items/upsertCartItemsWithComboOffersResponse.json',
            ),
          );
          final finalData = data['data']['upsertCartItems']['EzRxItems'];
          final result = await localDataSource.upsertCart(
            type: UpsertCartLocalType.upsertCartItemsComboOffer,
          );

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source upsertCartReOrder',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/upsert_cart_items/upsertCartItemsWithReorderMaterialsResponse.json',
            ),
          );
          final finalData = data['data']['upsertCartItems']['EzRxItems'];
          final result = await localDataSource.upsertCart(
            type: UpsertCartLocalType.upsertCartItemsReorder,
          );

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source aplSimulateOrder',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/apl_simulate_order/aplSimulateOrderResponse.json',
            ),
          );
          final aplSimulatorOrder = data['data']['aplSimulateOrder'];
          final result = await localDataSource.aplSimulateOrder();

          expect(
            result,
            AplSimulatorOrderDto.fromJson(
              makeResponseCamelCase(jsonEncode(aplSimulatorOrder)),
            ).toDomain,
          );
        },
      );

      test(
        'Cart local data source aplGetTotalPrice',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/apl_get_total_price/aplGetTotalPriceResponse.json',
            ),
          );
          final aplGetTotalPrice = data['data']['AplGetTotalPrice'];
          final result = await localDataSource.aplGetTotalPrice();

          expect(
            result,
            AplGetTotalPriceDto.fromJson(aplGetTotalPrice).toDomain,
          );
        },
      );
    },
  );
}
