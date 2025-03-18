import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late DownloadPaymentAttachmentRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  const fakeSaleOrg = 'fake-sale-org';
  const fakeCustomerCode = 'fake-customer-code';
  const fakeExcelFor = 'fake-excel-for';
  const fakeFileUrl = 'https://example.com/api/fetch';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = DownloadPaymentAttachmentRemoteDataSource(
        httpService: service,
        config: Config(),
        downloadPaymentAttachmentQuery: DownloadPaymentAttachmentQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Download e credit remote test',
    () {
      test(
        'Fetch e credit url Remote DataSource Test status code 200',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/common/eCreditResponse.json'),
          );

          final data = jsonEncode(
            {'ecn_number': 'fake-eCredit'},
          );

          dioAdapter.onPost(
            '/api/payment/listEcn',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: data,
          );

          final result = await remoteDataSource.getECreditDownloadUrl(
            eCreditNumber: 'fake-eCredit',
          );

          final response =
              ECreditInvoiceDto.fromJson(res['data'].first).toDomain();

          expect(
            result,
            response,
          );
        },
      );

      test(
        'Fetch e credit url Remote DataSource Test and returned url is empty status code 200',
        () async {
          final data = jsonEncode(
            {'ecn_number': 'fake-eCredit'},
          );

          dioAdapter.onPost(
            '/api/payment/listEcn',
            (server) => server.reply(
              200,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: data,
          );

          final result = await remoteDataSource.getECreditDownloadUrl(
            eCreditNumber: 'fake-eCredit',
          );

          final response = ECreditInvoiceDto.fromJson({'data': []}).toDomain();

          expect(
            result,
            response,
          );
        },
      );

      test(
        'Fetch e credit url Remote DataSource Test status code not 200',
        () async {
          final data = jsonEncode(
            {'ecn_number': 'fake-eCredit'},
          );

          dioAdapter.onPost(
            '/api/payment/listEcn',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: data,
          );

          await remoteDataSource
              .getECreditDownloadUrl(
            eCreditNumber: 'fake-eCredit',
          )
              .onError((error, stackTrace) async {
            expect(error, isA<ServerException>());

            return Future.value(DownloadPaymentAttachment.empty());
          });
        },
      );

      test(
        'get File Download Url',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/payment_attachment/paymentAttachmentResponse.json',
            ),
          );

          final data = jsonEncode(
            {
              'query':
                  remoteDataSource.downloadPaymentAttachmentQuery.getFileUrl(),
              'variables': {
                'input': {
                  'salesOrg': fakeSaleOrg,
                  'customerCode': fakeCustomerCode,
                  'filterBy': [{}],
                  'excelFor': fakeExcelFor,
                  'orderBy': [
                    {
                      'order': 'desc',
                      'field': 'documentDate',
                    },
                  ],
                  'isMarketPlace': true,
                },
              },
            },
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result = await remoteDataSource.getFileDownloadUrl(
            salesOrg: fakeSaleOrg,
            customerCode: fakeCustomerCode,
            excelFor: fakeExcelFor,
            isMarketPlace: true,
            queryObject: [{}],
          );

          final expectedResult = DownloadPaymentAttachmentDto.fromJson(
            res['data']['customerDocumentHeaderExcel'],
          ).toDomain();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'get payment summary file download url',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/payment_summary_attachment/paymentSummaryAttachmentResponse.json',
            ),
          );

          final data = jsonEncode(
            {
              'query':
                  remoteDataSource.downloadPaymentAttachmentQuery.getFileUrl(),
              'variables': {
                'salesOrg': fakeSaleOrg,
                'customerCode': fakeCustomerCode,
                'filterBy': [{}],
                'isMarketPlace': true,
              },
            },
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(200, res),
            data: data,
          );

          final result =
              await remoteDataSource.getPaymentSummaryFileDownloadUrl(
            salesOrg: fakeSaleOrg,
            customerCode: fakeCustomerCode,
            isMarketPlace: true,
            filterBy: [{}],
          );

          final expectedResult = DownloadPaymentAttachmentDto.fromJson(
            res['data']['customerPaymentExcel'],
          ).toDomain();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'file download',
        () async {
          final res = await rootBundle.load(PngImage.splash);

          final data = jsonEncode(
            {'url': fakeFileUrl},
          );

          dioAdapter.onPost(
            '/api/payment/downloads',
            (server) => server.reply(200, res.buffer.asUint8List()),
            data: data,
          );

          final result = await remoteDataSource.fileDownload(
            fakeFileUrl,
          );

          final expectedResult = AttachmentFileBuffer(
            name: Uri.parse(fakeFileUrl).pathSegments.last,
            buffer: res.buffer.asUint8List(),
          );

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'soa download',
        () async {
          final res = await rootBundle.load(PngImage.splash);

          final data = jsonEncode(
            {'url': fakeFileUrl},
          );

          dioAdapter.onPost(
            '/api/payment/downloadSoa',
            (server) => server.reply(200, res.buffer.asUint8List()),
            data: data,
          );

          final result = await remoteDataSource.soaDownload(
            fakeFileUrl,
          );

          final expectedResult = AttachmentFileBuffer(
            name: Uri.parse(fakeFileUrl).pathSegments.last,
            buffer: res.buffer.asUint8List(),
          );

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'e invoice download',
        () async {
          final res = await rootBundle.load(PngImage.splash);

          final data = jsonEncode(
            {'url': fakeFileUrl},
          );

          dioAdapter.onPost(
            '/api/payment/downloadEcn',
            (server) => server.reply(200, res.buffer.asUint8List()),
            data: data,
          );

          final result = await remoteDataSource.eInvoiceDownload(
            fakeFileUrl,
          );

          final expectedResult = AttachmentFileBuffer(
            name: Uri.parse(fakeFileUrl).pathSegments.last,
            buffer: res.buffer.asUint8List(),
          );

          expect(
            result,
            expectedResult,
          );
        },
      );
    },
  );
}
