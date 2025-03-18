import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class StockInfoMock extends Mock implements MaterialStockInfo {}

void main() {
  late StockInfoRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

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
      remoteDataSource = StockInfoRemoteDataSource(
        httpService: service,
        config: Config(),
        stockInfoQueryMutation: StockInfoQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Stock Information',
    () {
      test('Get StockInfoList', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_stock_infomation_list/getStockInformationListResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation
                .getMaterialStockInfoListQuery(),
            'variables': {
              'request': {
                'materialNumbers': ['fake-material'],
                'customerCode': 'fake-customercode',
                'salesOrganisation': 'fake-salesorg',
                'shipToCode': 'fake-ship-to-code',
              },
            },
          }),
        );

        final result = await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: ['fake-material'],
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
          selectedShipToCode: 'fake-ship-to-code',
        );

        expect(
          result,
          List.from(res['data']['getStockInformationLists'])
              .map((e) => MaterialStockInfoDto.fromJson(e).toDomain()),
        );
      });

      test('statuscode not equal to 200', () async {
        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation
                .getMaterialStockInfoListQuery(),
            'variables': {
              'materialNumbers': ['fake-material'],
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
              'shipToCode': 'fake-ship-to-code',
            },
          }),
        );

        await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: ['fake-material'],
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
          selectedShipToCode: 'fake-ship-to-code',
        ).onError((error, _) async {
          expect(error, isA<StockInfoException>());
          return Future.value([StockInfoMock()]);
        });
      });

      test('response with error', () async {
        dioAdapter.onPost(
          '/api//order',
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
            'query': remoteDataSource.stockInfoQueryMutation
                .getMaterialStockInfoListQuery(),
            'variables': {
              'materialNumbers': ['fake-material'],
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
              'shipToCode': 'fake-ship-to-code',
            },
          }),
        );

        await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: ['fake-material'],
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
          selectedShipToCode: 'fake-ship-to-code',
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([StockInfoMock()]);
        });
      });

      test('response with stock server down error msg', () async {
        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            200,
            {
              'data': null,
              'errors': [
                {
                  'message':
                      'something went wrong in the stock information API',
                },
              ],
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation
                .getMaterialStockInfoListQuery(),
            'variables': {
              'materialNumbers': ['fake-material'],
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
              'shipToCode': 'fake-ship-to-code',
            },
          }),
        );

        await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: ['fake-material'],
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
          selectedShipToCode: 'fake-ship-to-code',
        ).onError((error, _) async {
          expect(error, isA<StockInfoException>());
          return Future.value([StockInfoMock()]);
        });
      });
    },
  );
}
