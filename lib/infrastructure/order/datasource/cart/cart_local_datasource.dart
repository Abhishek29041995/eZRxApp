import 'dart:convert';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';

enum UpsertCartLocalType {
  upsertCart,
  upsertCartItems,
  upsertCartItemsComboOffer,
  upsertCartItemsReorder,
}

extension on UpsertCartLocalType {
  String get mockDataPath {
    switch (this) {
      case UpsertCartLocalType.upsertCart:
        return 'upsert_cart/upsertCartResponse.json';
      case UpsertCartLocalType.upsertCartItems:
        return 'upsert_cart_items/upsertCartItemsResponse.json';
      case UpsertCartLocalType.upsertCartItemsComboOffer:
        return 'upsert_cart_items/upsertCartItemsWithComboOffersResponse.json';
      case UpsertCartLocalType.upsertCartItemsReorder:
        return 'upsert_cart_items/upsertCartItemsWithReorderMaterialsResponse.json';
    }
  }

  String get jsonDataKey {
    switch (this) {
      case UpsertCartLocalType.upsertCart:
        return 'upsertCart';
      default:
        return 'upsertCartItems';
    }
  }
}

class CartLocalDataSource {
  CartLocalDataSource();

  Future<Cart> getAddedToCartProductList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/get_added_to_cart_product_list/getAddedToCartProductList.json'),
    );

    final finalData = data['data']['cart'];

    return CartDto.fromJson(makeResponseCamelCase(jsonEncode(finalData)))
        .toDomain();
  }

  Future<List<PriceAggregate>> upsertCart({
    UpsertCartLocalType type = UpsertCartLocalType.upsertCart,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/${type.mockDataPath}'),
    );
    final products = data['data'][type.jsonDataKey]['EzRxItems'];

    return List.from(makeResponseCamelCase(jsonEncode(products)))
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<AplSimulatorOrder> aplSimulateOrder() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/apl_simulate_order/aplSimulateOrderResponse.json'),
    );
    final aplSimulatorOrder = data['data']['aplSimulateOrder'];

    return AplSimulatorOrderDto.fromJson(aplSimulatorOrder).toDomain;
  }

  Future<AplGetTotalPrice> aplGetTotalPrice() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/apl_get_total_price/aplGetTotalPriceResponse.json'),
    );

    return AplGetTotalPriceDto.fromJson(data['data']['AplGetTotalPrice'])
        .toDomain;
  }
}
