import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryDetailsMock extends Mock implements OrderHistoryDetails {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late ViewByOrderDetailsRemoteDataSource remoteDataSource;
  final remoteConfigService = RemoteConfigServiceMock();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = ViewByOrderDetailsRemoteDataSource(
        httpService: service,
        config: Config(),
        viewByOrderDetailsQueryMutation: ViewByOrderDetailsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group(
    'Order History Details',
    () {
      test('Get OrderHistory Details', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/get_order_details/getOrderDetailsResponse.json'),
        );

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        );

        expect(
          result,
          OrderHistoryDetailsDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['orderHistoryV3']['orderHeaders'][0]),
            ),
          ).toDomain(),
        );
      });

      test('Get OrderHistory Details when orderHeaders is empry', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            {
              'data': {
                'orderHistoryV3': {'orderHeaders': []},
              },
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        );

        expect(
          result,
          OrderHistoryDetails.empty(),
        );
      });

      test('status code not equal to 200', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
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
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });
    },
  );

  group(
    'Order History Details List',
    () {
      test('Get OrderHistory Details', () async {
        final variables = {
          'orderNumbers': ['test', 'test2'],
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };
        final jsonResult = json.decode(
          await rootBundle.loadString(
            'assets/json/get_order_details/getOrderDetailsMarketPlaceResponse.json',
          ),
        );
        final expectedResult = (jsonResult['data']['orderHistoryV3']
                ['orderHeaders'] as List<dynamic>)
            .map(
              (e) => OrderHistoryDetailsDto.fromJson(
                makeResponseCamelCase(
                  jsonEncode(e),
                ),
              ).toDomain(),
            )
            .toList();

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(200, jsonResult),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetailsList(
          salesOrg: 'fake-salesOrg',
          orderNumbers: ['test', 'test2'],
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        );

        expect(result, expectedResult);
      });

      test('status code not equal to 200', () async {
        final variables = {
          'orderNumbers': ['test', 'test2'],
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(205, {'data': []}),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetailsList(
          salesOrg: 'fake-salesOrg',
          orderNumbers: ['test', 'test2'],
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());

          return Future.value([]);
        });
      });

      test('response not return correct json', () async {
        final variables = {
          'orderNumbers': ['test', 'test2'],
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(200, {
            'data': {
              'orderHistoryV3': {'orderHeaders': 'test'},
            },
          }),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetailsList(
          salesOrg: 'fake-salesOrg',
          orderNumbers: ['test', 'test2'],
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        );

        expect(result, <OrderHistoryDetails>[]);
      });

      test('with error', () async {
        final variables = {
          'orderNumbers': ['test', 'test2'],
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'isDetailsPage': true,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            205,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetailsList(
          salesOrg: 'fake-salesOrg',
          orderNumbers: ['test', 'test2'],
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());

          return Future.value([]);
        });
      });
    },
  );
}
