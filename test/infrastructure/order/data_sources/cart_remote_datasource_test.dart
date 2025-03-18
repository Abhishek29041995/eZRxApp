import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/error/cart_exception.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  const fakeLanguage = 'fake-language';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  const fakeEnableProductTypeFilter = false;
  final remoteDataSource = CartRemoteDataSource(
    httpService: service,
    config: Config(),
    dataSourceExceptionHandler: DataSourceExceptionHandler(),
    cartQueryMutation: CartQueryMutation(),
    remoteConfigService: remoteConfigService,
  );
  when(() => remoteConfigService.enableMarketPlaceMarkets)
      .thenReturn(fakeEnableMarketPlaceMarkets);
  when(() => remoteConfigService.enableProductTypeFilter)
      .thenReturn(fakeEnableProductTypeFilter);
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  group(
    'Cart Remote data source getAddedToCartProductList',
    () {
      late Map<String, dynamic> getAddedToCartProductListJson;

      setUpAll(() async {
        getAddedToCartProductListJson = json.decode(
          await rootBundle.loadString(
            'assets/json/get_added_to_cart_product_list/getAddedToCartProductList.json',
          ),
        );
      });

      test(
        'Cart Remote data source Success',
        () async {
          final finalData = getAddedToCartProductListJson['data']['cart'];
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              getAddedToCartProductListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode(
              {
                'query': remoteDataSource.cartQueryMutation
                    .cart(fakeConfigValue, fakeEnableProductTypeFilter),
                'variables': {'language': fakeLanguage},
              },
            ),
          );

          final result = await remoteDataSource.getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          );

          expect(
            result,
            CartDto.fromJson(makeResponseCamelCase(jsonEncode(finalData)))
                .toDomain(),
          );
        },
      );

      test(
        'Find default material description if material description is empty for bonus materials',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              getAddedToCartProductListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode(
              {
                'query': remoteDataSource.cartQueryMutation
                    .cart(fakeConfigValue, fakeEnableProductTypeFilter),
                'variables': {'language': fakeLanguage},
              },
            ),
          );

          final result = await remoteDataSource.getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          );

          expect(
            result
                .cartProducts.first.bonusSampleItems.first.materialDescription,
            "190 BREATH RIGHT KIDS 1 2'S-6",
          );
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              getAddedToCartProductListJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'},
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .cart(fakeConfigValue, fakeEnableProductTypeFilter),
              'variables': {'language': fakeLanguage},
            }),
          );
          await remoteDataSource
              .getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          )
              .onError((error, _) {
            expect(
              error,
              isA<ServerException>(),
            );
            return Future.value(Cart.empty());
          });
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error as no cart found',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {
                'data': {
                  'upsertCartItems': {'EzRxItems': []},
                },
                'errors': [
                  {'message': 'no cart found'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .cart(fakeConfigValue, fakeEnableProductTypeFilter),
              'variables': {'language': fakeLanguage},
            }),
          );
          final result = await remoteDataSource.getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          );

          expect(
            result,
            Cart.empty(),
          );
        },
      );

      test(
        'Cart Remote data source fail with status 204',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              204,
              getAddedToCartProductListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .cart(fakeConfigValue, fakeEnableProductTypeFilter),
              'variables': {'language': fakeLanguage},
            }),
          );

          await remoteDataSource
              .getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(Cart.empty());
          });
        },
      );
    },
  );

  group(
    'Cart Remote data source upsertCartItemsWithComboOffer',
    () {
      late Map<String, dynamic> upsertCartItemsWithComboOfferJson;

      setUpAll(() async {
        upsertCartItemsWithComboOfferJson = json.decode(
          await rootBundle.loadString(
            'assets/json/upsert_cart_items/upsertCartItemsWithComboOffersResponse.json',
          ),
        );
      });

      test(
        'Cart Remote data source Success',
        () async {
          final finalData = upsertCartItemsWithComboOfferJson['data']
              ['upsertCartItems']['EzRxItems'];
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartItemsWithComboOfferJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.upsertCartItems(
                fakeConfigValue,
                fakeEnableProductTypeFilter,
              ),
              'variables': {
                'itemInput': [{}],
              },
            }),
          );

          final result = await remoteDataSource.upsertCartItems(
            requestParams: [{}],
            market: fakeMarket,
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
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartItemsWithComboOfferJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'},
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.upsertCartItems(
                fakeConfigValue,
                fakeEnableProductTypeFilter,
              ),
              'variables': {
                'itemInput': [{}],
              },
            }),
          );
          await remoteDataSource.upsertCartItems(
            requestParams: [{}],
            market: fakeMarket,
          ).onError((error, _) {
            expect(
              error,
              isA<ServerException>(),
            );
            return Future.value(<PriceAggregate>[]);
          });
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error as no cart found',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {
                'data': {
                  'upsertCartItems': {'EzRxItems': []},
                },
                'errors': [
                  {'message': 'no cart found'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .cart(fakeConfigValue, fakeEnableProductTypeFilter),
              'variables': {'language': fakeLanguage},
            }),
          );
          final result = await remoteDataSource.getAddedToCartProductList(
            market: fakeMarket,
            language: fakeLanguage,
          );

          expect(
            result,
            Cart.empty(),
          );
        },
      );

      test(
        "Cart Remote data source success fail status 200 and error as Can't add Normal Product With Animal Health Product",
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {
                'data': {
                  'upsertCartItems': {'EzRxItems': []},
                },
                'errors': [
                  {
                    'message':
                        "Can't add Normal Product With Animal Health Product",
                  },
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.upsertCartItems(
                fakeConfigValue,
                fakeEnableProductTypeFilter,
              ),
              'variables': {
                'itemInput': [{}],
              },
            }),
          );

          await remoteDataSource.upsertCartItems(
            requestParams: [{}],
            market: fakeMarket,
          ).onError((error, _) {
            expect(
              error,
              const CartException.addAnimalHealthWithNormalProductToCart(),
            );
            return Future.value(<PriceAggregate>[]);
          });
        },
      );

      test(
        "Cart Remote data source success fail status 200 and error as Can't add animal health product with normal product",
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {
                'data': {
                  'upsertCartItems': {'EzRxItems': []},
                },
                'errors': [
                  {
                    'message':
                        "Can't add animal health product with normal product",
                  },
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.upsertCartItems(
                fakeConfigValue,
                fakeEnableProductTypeFilter,
              ),
              'variables': {
                'itemInput': [{}],
              },
            }),
          );
          await remoteDataSource.upsertCartItems(
            requestParams: [{}],
            market: fakeMarket,
          ).onError((error, _) {
            expect(
              error,
              const CartException.addAnimalHealthWithNormalProductToCart(),
            );
            return Future.value(<PriceAggregate>[]);
          });
        },
      );
    },
  );

  group(
    'Cart Remote data source upsertCart',
    () {
      late Map<String, dynamic> upsertCartListJson;

      setUpAll(() async {
        upsertCartListJson = json.decode(
          await rootBundle
              .loadString('assets/json/upsert_cart/upsertCartResponse.json'),
        );
      });

      final fakeQueryVariables = {
        'itemInput': {
          'ProductID': '',
          'Quantity': 1,
          'ItemSource': 'EZRX',
          'CustomerCode': '',
          'ShipToID': '',
          'SalesOrg': '',
          'ParentID': '',
          'Language': '',
        },
      };

      final fakeQueryBundleVariables = {
        'Type': 'bundle',
        'ProductID': '',
        'Quantity': 1,
        'ItemSource': 'EZRX',
        'CustomerCode': '',
        'ShipToID': '',
        'SalesOrg': '',
        'ParentID': '',
        'Language': '',
      };

      test(
        'Cart Remote data source Success with enable marketplace',
        () async {
          final finalData =
              upsertCartListJson['data']['upsertCart']['EzRxItems'];

          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCart(true, fakeEnableProductTypeFilter),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.upsertCart(
            market: fakeMarket,
            requestParams: fakeQueryVariables,
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
        'Cart Remote data source Success with disable marketplace',
        () async {
          final finalData =
              upsertCartListJson['data']['upsertCart']['EzRxItems'];

          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCart(false, fakeEnableProductTypeFilter),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.upsertCart(
            market: 'example disable marketplace market',
            requestParams: fakeQueryVariables,
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
        'Cart Remote data source Success with bundle type',
        () async {
          upsertCartListJson = json.decode(
            await rootBundle.loadString(
              'assets/json/upsert_cart_items/upsertCartItemsWithBundleOffersResponse.json',
            ),
          );

          final finalData =
              upsertCartListJson['data']['upsertCartItems']['EzRxItems'];

          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCartItems(true, fakeEnableProductTypeFilter),
              'variables': {
                'itemInput': fakeQueryBundleVariables,
              },
            }),
          );

          final result = await remoteDataSource.upsertCart(
            market: fakeMarket,
            requestParams: fakeQueryBundleVariables,
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
        'Cart Remote data source Success with null EZRX Items',
        () async {
          upsertCartListJson = json.decode(
            await rootBundle.loadString(
              'assets/json/upsert_cart/upsertCartNullItemsResponse.json',
            ),
          );
          final finalData = [];

          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCart(true, fakeEnableProductTypeFilter),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.upsertCart(
            market: fakeMarket,
            requestParams: fakeQueryVariables,
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
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              upsertCartListJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'},
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCart(true, fakeEnableProductTypeFilter),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource
              .upsertCart(
            market: fakeMarket,
            requestParams: fakeQueryVariables,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(<PriceAggregate>[]);
          });
        },
      );

      test(
        'Cart Remote data source fail with status 204',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              204,
              upsertCartListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation
                  .upsertCart(true, fakeEnableProductTypeFilter),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource
              .upsertCart(
            market: fakeMarket,
            requestParams: fakeQueryVariables,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(<PriceAggregate>[]);
          });
        },
      );
    },
  );

  group(
    'Cart remote data source deleteCard',
    () {
      test(
        'Cart Remote data source Success',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.deleteCartMutation(),
            }),
          );
          await expectLater(remoteDataSource.deleteCart(), completes);
        },
      );
      test(
        'Cart Remote data source failed',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              500,
              {},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.deleteCartMutation(),
            }),
          );
          await expectLater(remoteDataSource.deleteCart(), throwsException);
        },
      );
    },
  );

  group(
    'Cart Remote data source simulateOrder',
    () {
      late Map<String, dynamic> simulateOrderJson;

      setUpAll(() async {
        simulateOrderJson = json.decode(
          await rootBundle.loadString(
            'assets/json/apl_simulate_order/aplSimulateOrderResponse.json',
          ),
        );
      });

      final fakeQueryVariables = {
        'input': {
          'customer': 'customerCode',
          'materials': [
            {'key': 'value'},
          ],
          'salesOrg': 'salesOrgCode',
        },
      };

      test(
        'Cart Remote data source Success',
        () async {
          final finalData = simulateOrderJson['data']['aplSimulateOrder'];

          dioAdapter.onPost(
            '/api/order',
            (server) => server.reply(
              200,
              simulateOrderJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.cartQueryMutation.aplSimulateOrderQuery(),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.aplSimulateOrder(
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialQuantityPairList: [
              {'key': 'value'},
            ],
          );

          expect(
            result,
            AplSimulatorOrderDto.fromJson(finalData).toDomain,
          );
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/order',
            (server) => server.reply(
              200,
              simulateOrderJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'},
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.cartQueryMutation.aplSimulateOrderQuery(),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource.aplSimulateOrder(
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialQuantityPairList: [
              {'key': 'value'},
            ],
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(AplSimulatorOrder.empty());
          });
        },
      );

      test(
        'Cart Remote data source fail with status 204',
        () async {
          dioAdapter.onPost(
            '/api/order',
            (server) => server.reply(
              204,
              simulateOrderJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.cartQueryMutation.aplSimulateOrderQuery(),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource.aplSimulateOrder(
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialQuantityPairList: [
              {'key': 'value'},
            ],
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(AplSimulatorOrder.empty());
          });
        },
      );
    },
  );

  group(
    'Cart Remote data source totalPrice',
    () {
      late Map<String, dynamic> totalPriceJson;

      setUpAll(() async {
        totalPriceJson = json.decode(
          await rootBundle.loadString(
            'assets/json/apl_get_total_price/aplGetTotalPriceResponse.json',
          ),
        );
      });

      final fakeQueryVariables = {
        'AplGetTotalPrice': {
          'Customer': 'customerCode',
          'Amount': 1,
          'MaterialNumber': ['item_1', 'item_2'],
          'SalesOrg': 'salesOrgCode',
        },
      };

      test(
        'Cart Remote data source Success',
        () async {
          final finalData = totalPriceJson['data']['AplGetTotalPrice'];

          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              200,
              totalPriceJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.aplGetTotalPrice(),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.aplGetTotalPrice(
            totalPrice: 1,
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialNumbers: ['item_1', 'item_2'],
          );

          expect(result, AplGetTotalPriceDto.fromJson(finalData).toDomain);
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              200,
              totalPriceJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'},
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.aplGetTotalPrice(),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource.aplGetTotalPrice(
            totalPrice: 1,
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialNumbers: ['item_1', 'item_2'],
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(AplGetTotalPrice.empty());
          });
        },
      );

      test(
        'Cart Remote data source fail with status 204',
        () async {
          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              204,
              totalPriceJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.aplGetTotalPrice(),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource.aplGetTotalPrice(
            totalPrice: 1,
            salesOrgCode: 'salesOrgCode',
            customerCode: 'customerCode',
            materialNumbers: ['item_1', 'item_2'],
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(AplGetTotalPrice.empty());
          });
        },
      );
    },
  );
}
