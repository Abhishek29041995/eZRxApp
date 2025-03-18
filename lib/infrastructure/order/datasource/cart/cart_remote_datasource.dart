import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/error/cart_exception.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';

class CartRemoteDataSource {
  final HttpService httpService;
  final CartQueryMutation cartQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  CartRemoteDataSource({
    required this.httpService,
    required this.config,
    required this.cartQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<Cart> getAddedToCartProductList({
    required String market,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.cart(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
        remoteConfigService.enableProductTypeFilter,
      );
      final variables = {'language': language};
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );
      _cartExceptionChecker(
        res: res,
      );

      final cart = res.data['data']['cart'] ?? {};

      return CartDto.fromJson(makeResponseCamelCase(jsonEncode(cart)))
          .toDomain();
    });
  }

  Future<void> deleteCart() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': cartQueryMutation.deleteCartMutation(),
          },
        ),
      );

      _cartExceptionChecker(
        res: res,
      );
    });
  }

  Future<List<PriceAggregate>> upsertCart({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final enableMarketPlace =
          remoteConfigService.enableMarketPlaceMarkets.contains(market);
      final query = requestParams['Type'] == 'bundle'
          ? cartQueryMutation.upsertCartItems(
              enableMarketPlace,
              remoteConfigService.enableProductTypeFilter,
            )
          : cartQueryMutation.upsertCart(
              enableMarketPlace,
              remoteConfigService.enableProductTypeFilter,
            );

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': {
              'itemInput': requestParams,
            },
          },
        ),
      );

      _cartExceptionChecker(
        res: res,
      );

      final productList = res.data['data'][requestParams['Type'] == 'bundle'
              ? 'upsertCartItems'
              : 'upsertCart']['EzRxItems'] ??
          [];

      return List.from(makeResponseCamelCase(jsonEncode(productList))).map((e) {
        return CartProductDto.fromJson(e).toDomain;
      }).toList();
    });
  }

  Future<List<PriceAggregate>> upsertCartItems({
    required List<Map<String, dynamic>> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.upsertCartItems(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
        remoteConfigService.enableProductTypeFilter,
      );
      final variables = {
        'itemInput': requestParams,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );

      _cartExceptionChecker(
        res: res,
      );
      final productList =
          res.data['data']['upsertCartItems']['EzRxItems'] ?? [];

      return List.from(makeResponseCamelCase(jsonEncode(productList)))
          .map((e) => CartProductDto.fromJson(e).toDomain)
          .toList();
    });
  }

  Future<AplSimulatorOrder> aplSimulateOrder({
    required String salesOrgCode,
    required String customerCode,
    required List<Map<String, String>> materialQuantityPairList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.aplSimulateOrderQuery();
      final variables = {
        'input': {
          'customer': customerCode,
          'materials': materialQuantityPairList,
          'salesOrg': salesOrgCode,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );

      _cartExceptionChecker(
        res: res,
      );

      return AplSimulatorOrderDto.fromJson(res.data['data']['aplSimulateOrder'])
          .toDomain;
    });
  }

  Future<AplGetTotalPrice> aplGetTotalPrice({
    required double totalPrice,
    required String salesOrgCode,
    required String customerCode,
    required List<String> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.aplGetTotalPrice();
      final variables = {
        'AplGetTotalPrice': {
          'Customer': customerCode,
          'Amount': totalPrice,
          'MaterialNumber': materialNumbers,
          'SalesOrg': salesOrgCode,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );
      _cartExceptionChecker(
        res: res,
      );

      return AplGetTotalPriceDto.fromJson(res.data['data']['AplGetTotalPrice'])
          .toDomain;
    });
  }

  //Note* 'no cart found' error message is received when the cart is empty hence
  //we do not show any error message to the user.
  void _cartExceptionChecker({required Response<dynamic> res}) {
    final message = res.data['errors'] != null && res.data['errors'].isNotEmpty
        ? res.data['errors'][0]['message'].toString().toLowerCase()
        : '';

    if (message == 'no cart found') {
      return;
    } else {
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (_) {
          switch (message) {
            case 'shiptoaddress changed from existing cart. delete the cart and then add new item':
              throw const CartException.cartHasDifferentAddress();
            case 'no cart found':
              break;
            case "can't add normal product with animal health product":
            case "can't add animal health product with normal product":
              throw const CartException
                  .addAnimalHealthWithNormalProductToCart();
          }
        },
      );
    }
  }
}
