import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/e_invoice_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class EInvoiceLocalDataSourceMock extends Mock
    implements EInvoiceLocalDataSource {}

class EInvoiceRemoteDataSourceMock extends Mock
    implements EInvoiceRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late EInvoiceLocalDataSource eInvoiceLocalDataSource;
  late EInvoiceRemoteDataSource eInvoiceRemoteDataSource;
  late Config configMock;
  late EInvoiceRepository eInvoiceRepository;
  late DownloadPaymentAttachment downloadPaymentAttachment;
  const fakeInvoiceNumber = 'fake-invoice-number';
  final fakeError = MockException(message: 'fake-exception');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    eInvoiceLocalDataSource = EInvoiceLocalDataSourceMock();
    eInvoiceRemoteDataSource = EInvoiceRemoteDataSourceMock();
    downloadPaymentAttachment = await EInvoiceLocalDataSource().getEInvoice();
    eInvoiceRepository = EInvoiceRepository(
      config: configMock,
      localDataSource: eInvoiceLocalDataSource,
      remoteDataSource: eInvoiceRemoteDataSource,
    );
  });

  group('E-Invoice Repository Test', () {
    test('getEInvoice locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => eInvoiceLocalDataSource.getEInvoice(),
      ).thenAnswer(
        (invocation) async => downloadPaymentAttachment,
      );

      final result = await eInvoiceRepository.getEInvoice(
        customerCodeInfo: fakeCustomerCodeInfo,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeMYSalesOrg,
      );
      expect(result, Right(downloadPaymentAttachment));
    });

    test('getEInvoice locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => eInvoiceLocalDataSource.getEInvoice(),
      ).thenThrow(fakeError);

      final result = await eInvoiceRepository.getEInvoice(
        customerCodeInfo: fakeCustomerCodeInfo,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });
    test('getEInvoice remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => eInvoiceRemoteDataSource.getEInvoice(
          invoiceNumber: fakeInvoiceNumber,
          salesOrg: fakeMYSalesOrg.getOrCrash(),
          country: fakeMYSalesOrg.country,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => downloadPaymentAttachment,
      );

      final result = await eInvoiceRepository.getEInvoice(
        customerCodeInfo: fakeCustomerCodeInfo,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeMYSalesOrg,
      );
      expect(result, Right(downloadPaymentAttachment));
    });

    test('=> getEInvoice remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => eInvoiceRemoteDataSource.getEInvoice(
          invoiceNumber: fakeInvoiceNumber,
          salesOrg: fakeMYSalesOrg.getOrCrash(),
          country: fakeMYSalesOrg.country,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenThrow(fakeError);

      final result = await eInvoiceRepository.getEInvoice(
        customerCodeInfo: fakeCustomerCodeInfo,
        invoiceNumber: fakeInvoiceNumber,
        salesOrg: fakeMYSalesOrg,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });
  });
}
