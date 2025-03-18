import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_status_tracker_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderStatusTrackerMock extends Mock implements OrderStatusTracker {}

void main() {
  late OrderStatusTrackerRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
  const endpoint = '/api/order';

  const variables = {
    'inv': '1234',
    'sortByUpdateTimeStamp': 'DESC',
  };

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = OrderStatusTrackerRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        queryMutation: OrderStatusTrackerQuery(),
      );
    },
  );

  group(
    'Order Status Tracker remote group test',
    () {
      test('Get order_status_tracker override', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/get_zyllem_v2/getZyllemv2Response.json'),
        );

        dioAdapter.onPost(
          endpoint,
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getOrderStatusTracker(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getOrderStatusTracker(
          invoiceNumber: '1234',
        );
        final finalData = res['data']['zyllemStatusV2']['Entry'];

        expect(
          result,
          List.from((finalData))
              .map((e) => OrderStatusTrackerDto.fromJson(e).toDomain())
              .toList(),
        );
      });

      test(
        '=> OrderStatusTracker Status not 200',
        () async {
          dioAdapter.onPost(
            endpoint,
            (server) => server.reply(
              204,
              {'data': null},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getOrderStatusTracker(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getOrderStatusTracker(
            invoiceNumber: '1234',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value([OrderStatusTrackerMock()]);
          });
        },
      );

      test(
        'Result with error',
        () async {
          dioAdapter.onPost(
            endpoint,
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
              'query': remoteDataSource.queryMutation.getOrderStatusTracker(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getOrderStatusTracker(
            invoiceNumber: '1234',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value([OrderStatusTrackerMock()]);
          });
        },
      );
    },
  );
}
