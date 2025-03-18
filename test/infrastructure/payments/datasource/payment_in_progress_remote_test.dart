import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_in_progress_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late PaymentInProgressRemoteDataSource remoteDataSource;
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
      remoteDataSource = PaymentInProgressRemoteDataSource(
        httpService: service,
        config: Config(),
        paymentInProgressQuery: PaymentInProgressQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Payment in progress Remote Data Test',
    () {
      test('Payment in progress Remote Datasource Test status code 200',
          () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_in_progress/paymentInProgressResponse.json',
          ),
        );

        final data = jsonEncode({
          'query':
              remoteDataSource.paymentInProgressQuery.getPaymentInProgress(),
          'variables': {
            'input': {
              'customerCode': 'mock_customer_code',
              'salesOrg': '2001',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: false,
        );

        final expectResult = <StringValue>[];
        for (final dynamic item in res['data']['paymentInProgress']
            ['results']) {
          expectResult.add(PaymentInProgressDto.fromJson(item).toAmount);
        }
        expect(result, expectResult);
      });

      test(
          'Payment in progress should include isMarketPlace when value is true',
          () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_in_progress/paymentInProgressResponse.json',
          ),
        );

        final data = jsonEncode({
          'query':
              remoteDataSource.paymentInProgressQuery.getPaymentInProgress(),
          'variables': {
            'input': {
              'customerCode': 'mock_customer_code',
              'salesOrg': '2001',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: true,
        );

        final expectResult = <StringValue>[];
        for (final dynamic item in res['data']['paymentInProgress']
            ['results']) {
          expectResult.add(PaymentInProgressDto.fromJson(item).toAmount);
        }
        expect(result, expectResult);
      });

      test('Payment in progress Remote Datasource Test status code 200',
          () async {
        final data = jsonEncode({
          'query':
              remoteDataSource.paymentInProgressQuery.getPaymentInProgress(),
          'variables': {
            'input': {
              'customerCode': 'mock_customer_code',
              'salesOrg': 'mock_salesOrg',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource
            .getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: true,
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(List<StringValue>.empty());
        });
      });

      test('Payment in progress Remote Datasource Test with error', () async {
        final data = jsonEncode({
          'query':
              remoteDataSource.paymentInProgressQuery.getPaymentInProgress(),
          'variables': {
            'input': {
              'customerCode': 'mock_customer_code',
              'salesOrg': 'mock_salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
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
          data: data,
        );

        await remoteDataSource
            .getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: true,
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(List<StringValue>.empty());
        });
      });
    },
  );
}
