import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late PaymentSummaryRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(BaseOptions(baseUrl: 'https://uat.ezrxplus.com'));
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const fakeCustomerCode = 'fake-customer-code';
  const fakeSalesOrg = 'fake-salesOrg';
  const fakeOffset = 10;
  const fakePageSize = 100;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = PaymentSummaryRemoteDataSource(
        httpService: service,
        config: Config(),
        paymentSummaryQuery: PaymentSummaryQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Payment Summary Remote Data Source test -',
    () {
      test('get payment summary', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/payment_summary_list/paymentSummaryListResponse.json'),
        );

        final data = jsonEncode({
          'query':
              remoteDataSource.paymentSummaryQuery.getPaymentSummaryQuery(),
          'variables': {
            'request': {
              'customerCode': fakeCustomerCode,
              'salesOrg': fakeSalesOrg,
              'first': fakePageSize,
              'after': fakeOffset,
              'orderBy': [
                {'order': 'desc', 'field': 'createdDate'},
                {'order': 'desc', 'field': 'PaymentBatchAdditionalInfo'},
              ],
              'filterBy': [{}],
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.getPaymentSummary(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          offset: fakeOffset,
          pageSize: fakePageSize,
          filterList: [{}],
          isMarketPlace: true,
        );

        final expectResult = List.from(
          res['data']['customerPayment']['customerPaymentResponse'],
        ).map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain()).toList();

        expect(result, expectResult);
      });

      test('get transactions', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/list_transactions/listTransactionsResponse.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.paymentSummaryQuery.getTransactions(),
          'variables': {
            'request': {},
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.getTransactions(
          requestParams: {},
        );

        final expectResult = List<Map<String, dynamic>>.from(
          res['data']['listTransactions']['TxnSummary'],
        ).map((e) => TransactionItemDto.fromJson(e).toDomain()).toList();

        expect(result, expectResult);
      });
    },
  );
}
