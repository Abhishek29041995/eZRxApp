import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class _HttpServiceMock extends Mock implements HttpService {}

class _ConfigMock extends Mock implements Config {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late EInvoiceRemoteDataSource remoteDataSource;
  late HttpService service;
  late _ConfigMock configMock;
  const fakeInvoiceNumber = 'fake-invoice-number';
  const fakeBaseUrl = 'fake-url/';

  setUp(() {
    service = _HttpServiceMock();
    configMock = _ConfigMock();
    remoteDataSource = EInvoiceRemoteDataSource(
      httpService: service,
      config: configMock,
      exceptionHandler: DataSourceExceptionHandler(),
    );
    when(() => configMock.urlConstants).thenReturn(fakeBaseUrl);
  });
  group('E-invoice remote data source test', () {
    test('Should send empty json to API when market is not SG or PH', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/common/listSoaResponse.json'),
      );

      when(
        () => service.request(
          method: 'POST',
          url: '${fakeBaseUrl}payment/listInvoice',
          data: jsonEncode(<String, dynamic>{}),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: res,
          statusCode: 200,
        ),
      );

      final result = await remoteDataSource.getEInvoice(
        country: fakeMYSalesOrg.country,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeMYSalesOrg.getOrCrash(),
        soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
      );

      expect(
        result,
        ECreditInvoiceDto.fromJson(res['data'][0]).toDomain(),
      );
    });

    test('Should send payload to API when market is SG', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/common/listSoaResponse.json'),
      );

      when(
        () => service.request(
          method: 'POST',
          url: '${fakeBaseUrl}payment/listInvoice',
          data: jsonEncode({
            'invoice_number': fakeInvoiceNumber,
          }),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: res,
          statusCode: 200,
        ),
      );

      final result = await remoteDataSource.getEInvoice(
        country: fakeSGSalesOrg.country,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeSGSalesOrg.getOrCrash(),
        soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
      );

      expect(
        result,
        ECreditInvoiceDto.fromJson(res['data'][0]).toDomain(),
      );
    });

    test('Should send payload to API when market is PH', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/common/listSoaResponse.json'),
      );

      when(
        () => service.request(
          method: 'POST',
          url: '${fakeBaseUrl}payment/listInvoice',
          data: jsonEncode({
            'invoice_number': fakeInvoiceNumber,
            'sales_org': fakePHSalesOrg.getOrCrash(),
            'sold_to': fakeCustomerCodeInfo.customerCodeSoldTo,
            'document_type': 'ZPF2',
          }),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: res,
          statusCode: 200,
        ),
      );

      final result = await remoteDataSource.getEInvoice(
        country: fakePHSalesOrg.country,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakePHSalesOrg.getOrCrash(),
        soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
      );

      expect(
        result,
        ECreditInvoiceDto.fromJson(res['data'][0]).toDomain(),
      );
    });

    test('Should return download payment attachment empty if response empty', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/common/emptyResponse.json'),
      );

      when(
            () => service.request(
          method: 'POST',
          url: '${fakeBaseUrl}payment/listInvoice',
          data: jsonEncode({
            'invoice_number': fakeInvoiceNumber,
            'sales_org': fakePHSalesOrg.getOrCrash(),
            'sold_to': fakeCustomerCodeInfo.customerCodeSoldTo,
            'document_type': 'ZPF2',
          }),
        ),
      ).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(),
          data: res,
          statusCode: 200,
        ),
      );

      final result = await remoteDataSource.getEInvoice(
        country: fakePHSalesOrg.country,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakePHSalesOrg.getOrCrash(),
        soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
      );

      expect(
        result,
        DownloadPaymentAttachment.empty(),
      );
    });
  });
}
