import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryMock extends Mock implements OrderHistory {}

void main() {
  // late OrderHistoryRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  // final dio = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://uat.ezrxplus.com',
  //   ),
  // );
  // final dioAdapter = DioAdapter(dio: dio);
  // final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      // remoteDataSource = OrderHistoryRemoteDataSource(
      //   httpService: service,
      //   config: Config(),
      //   orderHistoryQueryMutation: OrderHistoryQueryMutation(),
      //   dataSourceExceptionHandler: DataSourceExceptionHandler(),
      // );
    },
  );

  //TODO : will enhance
  /*group(
    'Order History',
    () {
      test('Get OrderHistory', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'sort': 'ASC',
          'companyName': 'fake-companyname',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getOrderHistoryV2Response.json'),
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
            'query': remoteDataSource.orderHistoryQueryMutation
                .getOrderHistoryForCustomer(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistory(
          offset: 0,
          orderStatus: 'fake-order',
          pageSize: 10,
          shipTo: 'fake-shipto',
          soldTo: 'fake-soldto',
          filterQuery: {},
          language: '',
          query: '',
        );

        expect(
            result,
            OrderHistoryDto.fromJson(
              res['data']['orderHistoryV2']['OrderHistory'][0],
            ).toDomain());
      });

      test('statuscode not equal to 200', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'sort': 'ASC',
          'companyName': 'fake-companyname',
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
            'query': remoteDataSource.orderHistoryQueryMutation
                .getOrderHistoryForCustomer(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistory(
          offset: 0,
          orderStatus: 'fake-order',
          pageSize: 10,
          shipTo: 'fake-shipto',
          soldTo: 'fake-soldto',
          filterQuery: {},
          language: '',
          query: '',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'sort': 'ASC',
          'companyName': 'fake-companyname',
        };
        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'}
              ],
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.orderHistoryQueryMutation
                .getOrderHistoryForCustomer(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistory(
          offset: 0,
          orderStatus: 'fake-order',
          pageSize: 10,
          shipTo: 'fake-shipto',
          soldTo: 'fake-soldto',
          filterQuery: {},
          language: '',
          query: '',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryMock());
        });
      });
    },
  );
}
*/
}
