import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late CreditAndInvoiceDetailsRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  const fakeAccountingDocument = '1080005528';
  const fakeFiscalYear = '2023';
  const fakeBpCustomerNumber = '0030032223';
  const fakeAccountingDocumentItem = '001';
  final variables = <String, Map<String, dynamic>>{
    'input': {
      'customerCode': '0030032223',
      'salesOrg': '2601',
      'accountingDocument': fakeAccountingDocument,
      'fiscalYear': fakeFiscalYear,
      'bpCustomerNumber': fakeBpCustomerNumber,
      'accountingDocumentItem': fakeAccountingDocumentItem,
    },
  };
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = CreditAndInvoiceDetailsRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        creditAndInvoiceDetailsQueryMutation:
            CreditAndInvoiceDetailsQueryMutation(),
      );
    },
  );

  group(
    'Invoice Details Remote Datasource',
    () {
      group('Invoice Details', () {
        test(
          'get Invoice Details Success',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_details/customerDocumentDetailsResponse.json',
              ),
            );

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                200,
                res,
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.creditAndInvoiceDetailsQueryMutation
                    .getCreditAndInvoiceDetails(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.getCreditAndInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              searchKey: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
              isMarketPlace: false,
            );

            final details = res['data']['customerDocumentDetails'];
            final data = <CustomerDocumentDetail>[];
            for (final dynamic detail in details) {
              data.add(CustomerDocumentDetailDto.fromJson(detail).toDomain());
            }

            expect(
              result,
              data,
            );
          },
        );

        test(
          'get Invoice Details should contain isMarketPlace when passing true value',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                'assets/json/customer_document_details/customerDocumentDetailsResponse.json',
              ),
            );
            final mpVariables = {...variables};
            variables['input']!['isMarketPlace'] = true;

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                200,
                res,
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.creditAndInvoiceDetailsQueryMutation
                    .getCreditAndInvoiceDetails(),
                'variables': mpVariables,
              }),
            );

            final result = await remoteDataSource.getCreditAndInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              searchKey: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
              isMarketPlace: true,
            );

            final details = res['data']['customerDocumentDetails'];
            final data = <CustomerDocumentDetail>[];
            for (final dynamic detail in details) {
              data.add(CustomerDocumentDetailDto.fromJson(detail).toDomain());
            }

            expect(
              result,
              data,
            );
          },
        );

        test(
          'get Invoice Details status is not 200',
          () async {
            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                204,
                {'data': []},
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.creditAndInvoiceDetailsQueryMutation
                    .getCreditAndInvoiceDetails(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .getCreditAndInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              searchKey: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
              isMarketPlace: false,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return <CustomerDocumentDetail>[];
            });
          },
        );

        test(
          'get Invoice Details throws an error',
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
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.creditAndInvoiceDetailsQueryMutation
                    .getCreditAndInvoiceDetails(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .getCreditAndInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              searchKey: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
              isMarketPlace: false,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return <CustomerDocumentDetail>[];
            });
          },
        );
      });
    },
  );
}
