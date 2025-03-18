import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late ViewByOrderRemoteDataSource remoteDataSource;
  final remoteConfigService = RemoteConfigServiceMock();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  const pageSize = 10;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = ViewByOrderRemoteDataSource(
        httpService: service,
        config: Config(),
        viewByOrderQuery: ViewByOrderDetailsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group(
    'View By Order - ',
    () {
      test('Get View By Order Items', () async {
        final variables = {
          'soldTo': 'fake-soldTo',
          'first': pageSize,
          'after': 0,
          'language': 'fake-language',
          'orderBy': 'datetime',
          'sort': 'desc',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'searchKey': 'fake-searchKey',
          'isDetailsPage': false,
        };
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_order_history/getOrderHistoryV3Response.json',
          ),
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
            'query': remoteDataSource.viewByOrderQuery
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getViewByOrders(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          shipTo: 'fake-shipTo',
          language: 'fake-language',
          filterQuery: {},
          offset: 0,
          pageSize: pageSize,
          orderBy: 'datetime',
          sort: 'desc',
          isDetailsPage: false,
          market: fakeMarket,
        );

        expect(
          result,
          ViewByOrderDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['orderHistoryV3']),
            ),
          ).toDomain(),
        );
      });

      test('Get View By Order Items when orderHistoryV3 is empty', () async {
        final variables = {
          'soldTo': 'fake-soldTo',
          'first': pageSize,
          'after': 0,
          'language': 'fake-language',
          'orderBy': 'datetime',
          'sort': 'desc',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'searchKey': 'fake-searchKey',
          'isDetailsPage': false,
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            {
              'data': {'orderHistoryV3': {}},
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.viewByOrderQuery
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getViewByOrders(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          shipTo: 'fake-shipTo',
          language: 'fake-language',
          filterQuery: {},
          offset: 0,
          pageSize: pageSize,
          orderBy: 'datetime',
          sort: 'desc',
          isDetailsPage: false,
          market: fakeMarket,
        );

        expect(
          result,
          ViewByOrder.empty(),
        );
      });
      test('Status code !=200', () async {
        final variables = {
          'soldTo': 'fake-soldTo',
          'first': pageSize,
          'after': 0,
          'language': 'fake-language',
          'orderBy': 'datetime',
          'sort': 'desc',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'searchKey': 'fake-searchKey',
          'isDetailsPage': false,
        };
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_order_history/getOrderHistoryV3Response.json',
          ),
        );

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            201,
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
            'query': remoteDataSource.viewByOrderQuery
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getViewByOrders(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          shipTo: 'fake-shipTo',
          language: 'fake-language',
          filterQuery: {},
          offset: 0,
          pageSize: pageSize,
          orderBy: 'datetime',
          sort: 'desc',
          isDetailsPage: false,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(
            ViewByOrderDto.fromJson(
              makeResponseCamelCase(
                jsonEncode(res['data']['orderHistoryV3']),
              ),
            ).toDomain(),
          );
        });
      });
      test('with error', () async {
        final variables = {
          'soldTo': 'fake-soldTo',
          'first': pageSize,
          'after': 0,
          'language': 'fake-language',
          'orderBy': 'datetime',
          'sort': 'desc',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'searchKey': 'fake-searchKey',
          'isDetailsPage': false,
        };
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_order_history/getOrderHistoryV3Response.json',
          ),
        );

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
            'query': remoteDataSource.viewByOrderQuery
                .getOrderHistoryDetails(fakeConfigValue),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getViewByOrders(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          shipTo: 'fake-shipTo',
          language: 'fake-language',
          filterQuery: {},
          offset: 0,
          pageSize: pageSize,
          orderBy: 'datetime',
          sort: 'desc',
          isDetailsPage: false,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(
            ViewByOrderDto.fromJson(
              makeResponseCamelCase(
                jsonEncode(res['data']['orderHistoryV3']),
              ),
            ).toDomain(),
          );
        });
      });
    },
  );
}
