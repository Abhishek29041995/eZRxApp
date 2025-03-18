import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late AllCreditsAndInvoicesRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final filterMap = [
    {'field': 'debitCreditCode', 'value': 'S'},
    {'field': 'accountingDocument', 'value': '321312'},
    {'field': 'netDueDate', 'value': '2023-05-11', 'type': 'ge'},
    {'field': 'netDueDate', 'value': '2023-05-16', 'type': 'le'},
    {'field': 'postingDate', 'value': '2023-05-22', 'type': 'ge'},
    {'field': 'postingDate', 'value': '2023-05-27', 'type': 'le'},
    {'field': 'amountInTransactionCurrency', 'value': '1', 'type': 'ge'},
    {'field': 'amountInTransactionCurrency', 'value': '10', 'type': 'le'},
    {'field': 'invoiceProcessingStatus', 'value': 'Overdue'},
  ];
  final variables = {
    'request': {
      'input': {
        'customerCode': '0030032223',
        'salesOrg': '2601',
        'first': 11,
        'after': 0,
        'excelFor': 'Debit',
        'orderBy': [
          {'order': 'desc', 'field': 'netDueDate'},
        ],
        'filterBy': filterMap,
      },
    },
  };
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AllCreditsAndInvoicesRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        allCreditsAndInvoicesQueryMutation:
            AllCreditsAndInvoicesQueryMutation(),
      );
    },
  );

  group(
    'All Credits And Invoices Remote Datasource',
    () {
      group('Invoice', () {
        test(
          'get All Credits And Invoices Success',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
              ),
            );

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                200,
                res,
                delay: const Duration(seconds: 1),
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.filterInvoices(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: false,
            );

            final expectResult = <CreditAndInvoiceItem>[];
            for (final dynamic item in res['data']['customerDocumentHeaderV2']
                ['documentHeaderList']) {
              expectResult
                  .add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
            }
            expect(
              result,
              expectResult,
            );
          },
        );

        test(
          'get All Credits And Invoices should include isMarketPlace when value is true',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
              ),
            );
            final query = {...variables};
            query['request']!['input']!['isMarketPlace'] = true;

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(200, res),
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.filterInvoices(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: true,
            );

            final expectResult = <CreditAndInvoiceItem>[];
            for (final dynamic item in res['data']['customerDocumentHeaderV2']
                ['documentHeaderList']) {
              expectResult
                  .add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
            }
            expect(result, expectResult);
          },
        );

        test(
          'get All Credits And Invoices status is not 200',
          () async {
            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                204,
                {'data': []},
                delay: const Duration(seconds: 1),
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .filterInvoices(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: false,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return List<CreditAndInvoiceItem>.empty();
            });
          },
        );

        test(
          'get All Credits And Invoices throws an error',
          () async {
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
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .filterInvoices(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: false,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return List<CreditAndInvoiceItem>.empty();
            });
          },
        );
      });

      group('Credit', () {
        test('=> filterCredits with status code 200', () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
            ),
          );

          final data = jsonEncode({
            'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                .getDocumentHeaderListQuery(),
            'variables': {
              'input': {
                'customerCode': '0000100120',
                'salesOrg': '2001',
                'first': 1,
                'after': 0,
                'excelFor': 'Credit',
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: data,
          );

          final result = await remoteDataSource.filterCredits(
            customerCode: '0000100120',
            salesOrg: '2001',
            pageSize: 1,
            offset: 0,
            filterMap: [],
            isMarketPlace: false,
          );

          final expectResult = <CreditAndInvoiceItem>[];
          for (final dynamic item in res['data']['customerDocumentHeaderV2']
              ['documentHeaderList']) {
            expectResult.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
          }
          expect(
            result,
            expectResult,
          );
        });

        test('=> filterCredits should include isMarketPlace when value is true',
            () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
            ),
          );

          final data = jsonEncode({
            'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                .getDocumentHeaderListQuery(),
            'variables': {
              'input': {
                'customerCode': '0000100120',
                'salesOrg': '2001',
                'first': 1,
                'after': 0,
                'excelFor': 'Credit',
                'isMarketPlace': true,
              },
            },
          });

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.filterCredits(
            customerCode: '0000100120',
            salesOrg: '2001',
            pageSize: 1,
            offset: 0,
            filterMap: [],
            isMarketPlace: true,
          );

          final expectResult = <CreditAndInvoiceItem>[];
          for (final dynamic item in res['data']['customerDocumentHeaderV2']
              ['documentHeaderList']) {
            expectResult.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
          }
          expect(result, expectResult);
        });

        test('=> filterCredits status code not 200', () async {
          final data = jsonEncode({
            'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                .getDocumentHeaderListQuery(),
            'variables': {
              'input': {
                'customerCode': 'mock_soldTo',
                'salesOrg': 'mock_salesOrg',
                'first': 1,
                'after': 0,
                'excelFor': 'Credit',
                'orderBy': [],
                'filterBy': [],
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
              .filterCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offset: 0,
            filterMap: [],
            isMarketPlace: false,
          )
              .onError((error, stackTrace) async {
            expect(error, isA<ServerException>());
            return Future.value(List<CreditAndInvoiceItem>.empty());
          });
        });

        test('=> filterCredits with error', () async {
          final data = jsonEncode({
            'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                .getDocumentHeaderListQuery(),
            'variables': {
              'input': {
                'customerCode': 'mock_soldTo',
                'salesOrg': 'mock_salesOrg',
                'first': 1,
                'after': 0,
                'excelFor': 'Credit',
                'orderBy': [],
                'filterBy': [],
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
              .filterCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offset: 0,
            filterMap: [],
            isMarketPlace: false,
          )
              .onError((error, stackTrace) async {
            expect(error, isA<ServerException>());
            return Future.value(List<CreditAndInvoiceItem>.empty());
          });
        });
      });

      group('Full summary', () {
        test(
          'get filter full summary success',
          () async {
            final variables = {
              'request': {
                'input': {
                  'customerCode': 'fake-customer-code',
                  'salesOrg': 'fake-sale-org',
                  'first': 20,
                  'after': 0,
                  'excelFor': 'AccountSummary',
                  'orderBy': [
                    {
                      'order': 'desc',
                      'field': 'documentDate',
                    }
                  ],
                  'filterBy': filterMap,
                },
              },
            };

            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
              ),
            );

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                200,
                res,
                delay: const Duration(seconds: 1),
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.filterFullSummary(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: false,
            );

            final expectResult = <CreditAndInvoiceItem>[];
            for (final dynamic item in res['data']['customerDocumentHeaderV2']
                ['documentHeaderList']) {
              expectResult
                  .add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
            }
            expect(
              result,
              expectResult,
            );
          },
        );

        test(
          'get filter full summary should include isMarketPlace when value is true',
          () async {
            final variables = {
              'request': {
                'input': {
                  'customerCode': 'fake-customer-code',
                  'salesOrg': 'fake-sale-org',
                  'first': 20,
                  'after': 0,
                  'excelFor': 'AccountSummary',
                  'orderBy': [
                    {
                      'order': 'desc',
                      'field': 'documentDate',
                    }
                  ],
                  'filterBy': filterMap,
                  'isMarketPlace': true,
                },
              },
            };

            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_header_v2/customerDocumentHeaderV2Response.json',
              ),
            );

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(200, res),
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getDocumentHeaderListQuery(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.filterFullSummary(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              filterMap: filterMap,
              offset: 0,
              pageSize: 20,
              isMarketPlace: true,
            );

            final expectResult = <CreditAndInvoiceItem>[];
            for (final dynamic item in res['data']['customerDocumentHeaderV2']
                ['documentHeaderList']) {
              expectResult
                  .add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
            }
            expect(result, expectResult);
          },
        );
      });
    },
  );
}
