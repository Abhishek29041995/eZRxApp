import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_by_order_request.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_request.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_by_order_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_data_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_request_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late ViewByItemRemoteDataSource remoteDataSource;
  final remoteConfigService = RemoteConfigServiceMock();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  const fakeMarket = 'fake-market';
  const customerCodeSoldTo = 'fake_customer_code_sold_to';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  const pageSize = 24;
  const orderNumbers = ['fake_order_number'];
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = ViewByItemRemoteDataSource(
        httpService: service,
        config: Config(),
        viewByItemQueryMutation: ViewByItemQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group(
    'View By Item Remote DataSource',
    () {
      group('Get Order History-', () {
        test('success state', () async {
          final viewByItemRequest = ViewByItemRequest.empty().copyWith(
            salesOrg: 'fake_sales_org',
            customerCodeSoldTo: customerCodeSoldTo,
            shipToCustomerCode: 'fake_ship_to)customer_code',
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            searchKey: 'fake_search_key',
            orderNumber: 'fake_order_number',
            viewByItemFilter: ViewByItemFilter.empty(),
            isDetailsPage: false,
            materialOriginFilter: MaterialOriginFilter.all(),
          );
          final variables =
              ViewByItemRequestDto.fromDomain(viewByItemRequest).toMapJson();
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getViewByItem(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getOrderHistory(
            variables: variables,
            market: 'MY',
          );

          final finalData = makeResponseCamelCase(
            jsonEncode(
              res['data']['orderHistoryFetchByItems']['OrderHistory'][0],
            ),
          );

          expect(
            result,
            OrderHistoryDto.fromJson(
              finalData,
            ).toDomain(),
          );
        });

        test('When OrderHistory is empty', () async {
          final viewByItemRequest = ViewByItemRequest.empty().copyWith(
            salesOrg: 'fake_sales_org',
            customerCodeSoldTo: customerCodeSoldTo,
            shipToCustomerCode: 'fake_ship_to)customer_code',
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            searchKey: 'fake_search_key',
            orderNumber: 'fake_order_number',
            viewByItemFilter: ViewByItemFilter.empty(),
            isDetailsPage: false,
            materialOriginFilter: MaterialOriginFilter.all(),
          );
          final variables =
              ViewByItemRequestDto.fromDomain(viewByItemRequest).toMapJson();
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              {
                'data': {
                  'orderHistoryFetchByItems': {'OrderHistory': []},
                },
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getViewByItem(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getOrderHistory(
            variables: variables,
            market: 'MY',
          );
          expect(
            result,
            OrderHistory.empty(),
          );
        });

        test('statuscode not equal to 200', () async {
          final viewByItemRequest = ViewByItemRequest.empty().copyWith(
            salesOrg: 'fake_sales_org',
            customerCodeSoldTo: customerCodeSoldTo,
            shipToCustomerCode: 'fake_ship_to)customer_code',
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            searchKey: 'fake_search_key',
            orderNumber: 'fake_order_number',
            viewByItemFilter: ViewByItemFilter.empty(),
            isDetailsPage: false,
            materialOriginFilter: MaterialOriginFilter.all(),
          );
          final variables =
              ViewByItemRequestDto.fromDomain(viewByItemRequest).toMapJson();
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getViewByItem(fakeConfigValue),
              'variables': variables,
            }),
          );
          final finalData = makeResponseCamelCase(
            jsonEncode(
              res['data']['orderHistoryFetchByItems']['OrderHistory'][0],
            ),
          );

          await remoteDataSource
              .getOrderHistory(
            variables: variables,
            market: 'MY',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              OrderHistoryDto.fromJson(
                finalData,
              ).toDomain(),
            );
          });
        });

        test('with error', () async {
          final viewByItemRequest = ViewByItemRequest.empty().copyWith(
            salesOrg: 'fake_sales_org',
            customerCodeSoldTo: customerCodeSoldTo,
            shipToCustomerCode: 'fake_ship_to)customer_code',
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            searchKey: 'fake_search_key',
            orderNumber: 'fake_order_number',
            viewByItemFilter: ViewByItemFilter.empty(),
            isDetailsPage: false,
            materialOriginFilter: MaterialOriginFilter.all(),
          );
          final variables =
              ViewByItemRequestDto.fromDomain(viewByItemRequest).toMapJson();
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getViewByItem(fakeConfigValue),
              'variables': variables,
            }),
          );

          final finalData = makeResponseCamelCase(
            jsonEncode(
              res['data']['orderHistoryFetchByItems']['OrderHistory'][0],
            ),
          );

          await remoteDataSource
              .getOrderHistory(
            variables: variables,
            market: 'MY',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              OrderHistoryDto.fromJson(
                finalData,
              ).toDomain(),
            );
          });
        });
      });

      group('Get Invoice Data For Orders-', () {
        test('success state', () async {
          final variables = {
            'orderNumbers': orderNumbers,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_for_orders/getInvoiceForOrdersResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getViewByItem(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getInvoiceDataForOrders(
            orderNumbers: orderNumbers,
          );

          final finalData = res['data']['getInvoiceIdForOrders'];

          expect(
            result,
            List.from(finalData)
                .map((e) => InvoiceDataDto.fromJson(e).toDomain())
                .toList(),
          );
        });

        test('statuscode not equal to 200', () async {
          final variables = {
            'orderNumbers': orderNumbers,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_for_orders/getInvoiceForOrdersResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getInvoiceIdForOrders(),
              'variables': variables,
            }),
          );
          final finalData = res['data']['getInvoiceIdForOrders'];

          await remoteDataSource
              .getInvoiceDataForOrders(
            orderNumbers: orderNumbers,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              List.from(finalData)
                  .map((e) => InvoiceDataDto.fromJson(e).toDomain())
                  .toList(),
            );
          });
        });

        test('with error', () async {
          final variables = {
            'orderNumbers': orderNumbers,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_for_orders/getInvoiceForOrdersResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getInvoiceIdForOrders(),
              'variables': variables,
            }),
          );

          final finalData = res['data']['getInvoiceIdForOrders'];

          await remoteDataSource
              .getInvoiceDataForOrders(
            orderNumbers: orderNumbers,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              List.from(finalData)
                  .map((e) => InvoiceDataDto.fromJson(e).toDomain())
                  .toList(),
            );
          });
        });
      });

      group('Get Invoice Data For Order-', () {
        test('success state', () async {
          final invoiceByOrder = InvoiceByOrderRequest.empty().copyWith(
            customerCodeSoldTo: customerCodeSoldTo,
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            orderNumber: orderNumbers.first,
          );
          final invoicesByOrderRequest =
              InvoiceByOrderRequestDto.fromDomain(invoiceByOrder).toMapJson();
          final variables = {
            'invoicesByOrderRequest': invoicesByOrderRequest,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_details_for_order/getInvoiceDetailsForOrderResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getInvoiceDetailsForOrder(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getInvoiceDetailsForOrder(
            invoicesByOrderRequest: invoicesByOrderRequest,
          );

          final finalData = makeResponseCamelCase(
            jsonEncode(res['data']['GetInvoiceDetailsForOrder']),
          );

          expect(
            result,
            InvoiceDetailResponseDto.fromJson(finalData).toDomain(),
          );
        });

        test('statuscode not equal to 200', () async {
          final invoiceByOrder = InvoiceByOrderRequest.empty().copyWith(
            customerCodeSoldTo: customerCodeSoldTo,
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            orderNumber: orderNumbers.first,
          );
          final invoicesByOrderRequest =
              InvoiceByOrderRequestDto.fromDomain(invoiceByOrder).toMapJson();
          final variables = {
            'invoicesByOrderRequest': invoicesByOrderRequest,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_details_for_order/getInvoiceDetailsForOrderResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getInvoiceDetailsForOrder(),
              'variables': variables,
            }),
          );
          final finalData = makeResponseCamelCase(
            jsonEncode(res['data']['GetInvoiceDetailsForOrder']),
          );

          await remoteDataSource
              .getInvoiceDetailsForOrder(
            invoicesByOrderRequest: invoicesByOrderRequest,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              InvoiceDetailResponseDto.fromJson(finalData).toDomain(),
            );
          });
        });

        test('with error', () async {
          final invoiceByOrder = InvoiceByOrderRequest.empty().copyWith(
            customerCodeSoldTo: customerCodeSoldTo,
            language: 'EN',
            pageSize: pageSize,
            offSet: 0,
            orderNumber: orderNumbers.first,
          );
          final invoicesByOrderRequest =
              InvoiceByOrderRequestDto.fromDomain(invoiceByOrder).toMapJson();
          final variables = {
            'invoicesByOrderRequest': invoicesByOrderRequest,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_invoice_details_for_order/getInvoiceDetailsForOrderResponse.json',
            ),
          );
          dioAdapter.onGet(
            '/api/order',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.viewByItemQueryMutation
                  .getInvoiceDetailsForOrder(),
              'variables': variables,
            }),
          );

          final finalData = makeResponseCamelCase(
            jsonEncode(res['data']['GetInvoiceDetailsForOrder']),
          );

          await remoteDataSource
              .getInvoiceDetailsForOrder(
            invoicesByOrderRequest: invoicesByOrderRequest,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              InvoiceDetailResponseDto.fromJson(finalData).toDomain(),
            );
          });
        });
      });
    },
  );
}
