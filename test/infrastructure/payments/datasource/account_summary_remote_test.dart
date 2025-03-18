import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_limit_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_balance_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late AccountSummaryRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(BaseOptions(baseUrl: 'https://uat.ezrxplus.com'));
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AccountSummaryRemoteDataSource(
        httpService: service,
        config: Config(),
        query: AccountSummaryQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Account summary remote data source test -',
    () {
      group('Fetch invoice summary -', () {
        test('should include isMarketPlace when value is true', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_outstanding_balance/getOutstandingBalanceResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.query.getOutstandingBalanceQuery(),
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
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.fetchInvoiceSummary(
            customerCode: 'mock_customer_code',
            salesOrg: 'mock_salesOrg',
            isMarketPlace: true,
          );

          final expectResult = OutstandingBalanceDto.fromJson(
            res['data']['outstandingBalance']['results'].first,
          ).toDomain();

          expect(result, expectResult);
        });

        test('should exclude isMarketPlace when value is false', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_outstanding_balance/getOutstandingBalanceResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.query.getOutstandingBalanceQuery(),
            'variables': {
              'input': {
                'customerCode': 'mock_customer_code',
                'salesOrg': 'mock_salesOrg',
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.fetchInvoiceSummary(
            customerCode: 'mock_customer_code',
            salesOrg: 'mock_salesOrg',
            isMarketPlace: false,
          );

          final expectResult = OutstandingBalanceDto.fromJson(
            res['data']['outstandingBalance']['results'].first,
          ).toDomain();

          expect(result, expectResult);
        });

        test(
          'should return OutstandingBalance.empty() when data response is empty',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/get_outstanding_balance/getOutstandingBalanceEmptyResponse.json',
              ),
            );

            final data = jsonEncode({
              'query': remoteDataSource.query.getOutstandingBalanceQuery(),
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
              (server) => server.reply(200, res),
              data: data,
            );

            final result = await remoteDataSource.fetchInvoiceSummary(
              customerCode: 'mock_customer_code',
              salesOrg: 'mock_salesOrg',
              isMarketPlace: true,
            );

            expect(result, OutstandingBalance.empty());
          },
        );
      });

      group('Fetch credit limit -', () {
        test('should include isMarketPlace when value is true', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_credit_limit/getCreditLimitResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.query.getCreditLimitQuery(),
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
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.fetchCreditLimit(
            customerCode: 'mock_customer_code',
            salesOrg: 'mock_salesOrg',
            isMarketPlace: true,
          );

          final expectResult = CreditLimitDto.fromJson(
            res['data']['creditLimit']['results'].first,
          ).toDomain;

          expect(result, expectResult);
        });

        test('should exclude isMarketPlace when value is false', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_credit_limit/getCreditLimitResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.query.getCreditLimitQuery(),
            'variables': {
              'input': {
                'customerCode': 'mock_customer_code',
                'salesOrg': 'mock_salesOrg',
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.fetchCreditLimit(
            customerCode: 'mock_customer_code',
            salesOrg: 'mock_salesOrg',
            isMarketPlace: false,
          );

          final expectResult = CreditLimitDto.fromJson(
            res['data']['creditLimit']['results'].first,
          ).toDomain;

          expect(result, expectResult);
        });

        test(
          'should return CreditLimit.empty() when data response is empty',
          () async {
            final res = json.decode(
              await rootBundle
                  .loadString('assets/json/get_credit_limit/getCreditLimitEmptyResponse.json'),
            );

            final data = jsonEncode({
              'query': remoteDataSource.query.getCreditLimitQuery(),
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
              (server) => server.reply(200, res),
              data: data,
            );

            final result = await remoteDataSource.fetchCreditLimit(
              customerCode: 'mock_customer_code',
              salesOrg: 'mock_salesOrg',
              isMarketPlace: true,
            );

            expect(result, CreditLimit.empty());
          },
        );

        test('should return error when data response is invalid', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_credit_limit/getCreditLimitErrorResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.query.getCreditLimitQuery(),
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
            (server) => server.reply(200, res),
            data: data,
          );

          expect(
            () async {
              await remoteDataSource.fetchCreditLimit(
                customerCode: 'mock_customer_code',
                salesOrg: 'mock_salesOrg',
                isMarketPlace: true,
              );
            },
            throwsA(isA<ServerException>()),
          );
        });
      });
    },
  );
}
