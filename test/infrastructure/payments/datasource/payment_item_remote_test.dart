import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late PaymentItemRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(BaseOptions(baseUrl: 'https://uat.ezrxplus.com'));
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const fakeCustomerCode = 'fake-customer-code';
  const fakeSalesOrg = 'fake-salesOrg';
  const fakeShipToCode = 'fake-shipToCode';
  const fakeReferenceId = 'fake-reference-id';
  const fakeTransactionCurrency = 'fake-transaction-currency';
  const fakePaymentAmount = 'fake-payment-amount';
  const fakePaymentDate = 'fake-payment-date';
  const fakeAdvice = 'fake-advice';
  const fakePaymentId = 'fake-payment-id';
  const fakePaymentBatch = 'fake-payment-batch';
  const fakeAccountingDoc = 'fake-accounting-doc';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = PaymentItemRemoteDataSource(
        httpService: service,
        config: Config(),
        paymentItemQuery: PaymentItemQuery(),
        paymentSummaryQuery: PaymentSummaryQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Account summary remote data source test -',
    () {
      test('get Payment Item List', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/payment_item/paymentItemResponse.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.paymentItemQuery.getPaymentItemQuery(),
          'variables': {
            'request': {
              'customerCode': fakeCustomerCode,
              'salesOrg': fakeSalesOrg,
              'paymentBatchAdditionalInfo': fakePaymentBatch,
              'paymentID': fakePaymentId,
              'accountingDocExternalReference': fakeAccountingDoc,
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.getPaymentItemList(
          paymentID: fakePaymentId,
          paymentBatchAdditionalInfo: fakePaymentBatch,
          accountingDocExternalReference: fakeAccountingDoc,
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          isMarketPlace: true,
        );

        final expectResult = List.from(res['data']['paymentItems'])
            .map((e) => PaymentItemDto.fromJson(e).toDomain())
            .toList();

        expect(result, expectResult);
      });

      group('get payment summary details', () {
        test('get payment  summary details have data', () async {
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

          final result = await remoteDataSource.getPaymentSummaryDetails(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            filterBy: {},
            isMarketPlace: true,
          );

          final expectResult = PaymentSummaryDetailsDto.fromJson(
            res['data']['customerPayment']['customerPaymentResponse'][0],
          ).toDomain();

          expect(result, expectResult);
        });

        test('get payment  summary details data empty', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/payment_summary_list/paymentSummaryListEmptyResponse.json'),
          );

          final data = jsonEncode({
            'query':
                remoteDataSource.paymentSummaryQuery.getPaymentSummaryQuery(),
            'variables': {
              'request': {
                'customerCode': fakeCustomerCode,
                'salesOrg': fakeSalesOrg,
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

          final result = await remoteDataSource.getPaymentSummaryDetails(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            filterBy: {},
            isMarketPlace: true,
          );

          expect(result, PaymentSummaryDetails.empty());
        });
      });

      group('delete customer payment', () {
        test('delete customer payment success', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/delete_customer_payment/deleteCustomerPaymentResponse.json'),
          );

          final data = jsonEncode({
            'query':
                remoteDataSource.paymentItemQuery.deleteCustomerPaymentQuery(),
            'variables': {
              'input': {
                'customerCode': fakeCustomerCode,
                'salesOrg': fakeSalesOrg,
                'shipToCode': fakeShipToCode,
                'paymentAmount': fakePaymentAmount,
                'paymentBatchAdditionalInfo': fakePaymentBatch,
                'paymentID': fakePaymentId,
                'transactionCurrency': fakeTransactionCurrency,
                'valueDate': fakePaymentDate,
                'zzAdvice': fakeAdvice,
                'isMarketPlace': true,
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.deleteCustomerPayment(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            shipToCode: fakeShipToCode,
            paymentAmount: fakePaymentBatch,
            paymentBatchAdditionalInfo: fakePaymentBatch,
            paymentId: fakePaymentId,
            transactionCurrency: fakeTransactionCurrency,
            paymentDate: fakePaymentDate,
            zzAdvice: fakeAdvice,
            isMarketPlace: true,
          );

          expect(result, true);
        });

        test('delete customer payment fail', () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/delete_customer_payment/deleteCustomerPaymentFailResponse.json',
            ),
          );

          final data = jsonEncode({
            'query':
                remoteDataSource.paymentItemQuery.deleteCustomerPaymentQuery(),
            'variables': {
              'input': {
                'customerCode': fakeCustomerCode,
                'salesOrg': fakeSalesOrg,
                'shipToCode': fakeShipToCode,
                'paymentAmount': fakePaymentAmount,
                'paymentBatchAdditionalInfo': fakePaymentBatch,
                'paymentID': fakePaymentId,
                'transactionCurrency': fakeTransactionCurrency,
                'valueDate': fakePaymentDate,
                'zzAdvice': fakeAdvice,
                'isMarketPlace': true,
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          await remoteDataSource
              .deleteCustomerPayment(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            shipToCode: fakeShipToCode,
            paymentAmount: fakePaymentBatch,
            paymentBatchAdditionalInfo: fakePaymentBatch,
            paymentId: fakePaymentId,
            transactionCurrency: fakeTransactionCurrency,
            paymentDate: fakePaymentDate,
            zzAdvice: fakeAdvice,
            isMarketPlace: true,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());

            return Future.value(false);
          });
        });
      });

      group('get transaction', () {
        test('get transaction success', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_transaction/getTransactionResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.paymentItemQuery.getTransactionQuery(),
            'variables': {
              'input': {
                'customer': fakeCustomerCode,
                'salesOrg': fakeSalesOrg,
                'id': fakePaymentId,
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.getTransaction(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            paymentId: fakePaymentId,
          );

          final expectedResult = TransactionDetailDto.fromJson(
            res['data']['getTransaction'],
          ).toDomain();

          expect(result, expectedResult);
        });

        test('get transaction fail', () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_transaction/getTransactionEmptyResponse.json'),
          );

          final data = jsonEncode({
            'query': remoteDataSource.paymentItemQuery.getTransactionQuery(),
            'variables': {
              'input': {
                'customer': fakeCustomerCode,
                'salesOrg': fakeSalesOrg,
                'id': fakePaymentId,
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.getTransaction(
            customerCode: fakeCustomerCode,
            salesOrg: fakeSalesOrg,
            paymentId: fakePaymentId,
          );

          final expectedResult = PaymentSummaryDetails.empty();

          expect(result, expectedResult);
        });
      });

      test('cancel payment advice', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/cancel_virtual_txn/cancelVirtualTxnResponse.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.paymentItemQuery.getTransactionQuery(),
          'variables': {
            'input': {
              'customer': fakeCustomerCode,
              'salesOrg': fakeSalesOrg,
              'id': fakeReferenceId,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(200, res),
          data: data,
        );

        final result = await remoteDataSource.cancelPaymentAdvice(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          referenceId: fakeReferenceId,
        );

        expect(result, 'TR202310190725');
      });
    },
  );
}
