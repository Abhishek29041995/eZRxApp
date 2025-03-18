import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_invoice_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class NewPaymentLocalDataSourceMock extends Mock
    implements NewPaymentLocalDataSource {}

class NewPaymentRemoteDataSourceMock extends Mock
    implements NewPaymentRemoteDataSource {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class DeviceStorageMock extends Mock implements DeviceStorage {}

void main() {
  late NewPaymentRepository nawPaymentsRepository;
  late Config mockConfig;
  late NewPaymentLocalDataSource newPaymentLocalDataSource;
  late NewPaymentRemoteDataSource newPaymentRemoteDataSource;
  late FileSystemHelper fileSystemHelper;
  late DeviceInfo deviceInfo;
  late PaymentInfo paymentInfo;
  late CreateVirtualAccount createVirtualAccount;
  late PrincipalCutoffs principalCutoffs;
  late DeviceStorage deviceStorage;

  final customerOpenItemsList = [
    CustomerOpenItem.empty().copyWith(
      documentReferenceID: StringValue('fake-id'),
    ),
  ];
  final customerOpenItems = [
    CustomerOpenItem.empty().copyWith(
      amountInTransactionCurrency: 5,
    ),
  ];
  const fakeUserName = 'fakeUser';
  const fakeDebitCreditType = 'debit';
  const fakeOrderBy = 'netDueDate';
  const offset = 0;
  const pageSize = 10;
  final fakeFilterList = <Map<String, String>>[
    {
      'field': 'accountingDocument',
      'value': 'fake',
    }
  ];
  final fakePaymentStatus = PaymentStatus(
    paymentId: 'fake-id',
    transactionReference: 'fake-ref',
    transactionStatus: TransactionStatus('fake-status'),
  );

  final fakeUser = User.empty().copyWith(username: Username(fakeUserName));

  const domain = 'https://uat-my.ezrxplus.com';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockConfig = MockConfig();
    newPaymentLocalDataSource = NewPaymentLocalDataSourceMock();
    newPaymentRemoteDataSource = NewPaymentRemoteDataSourceMock();
    fileSystemHelper = FileSystemHelperMock();
    deviceInfo = DeviceInfoMock();
    deviceStorage = DeviceStorageMock();

    nawPaymentsRepository = NewPaymentRepository(
      config: mockConfig,
      localDataSource: newPaymentLocalDataSource,
      remoteDataSource: newPaymentRemoteDataSource,
      fileSystemHelper: fileSystemHelper,
      deviceInfo: deviceInfo,
      deviceStorage: deviceStorage,
    );
    paymentInfo = await NewPaymentLocalDataSource().pay(
      salesOrg: fakeSalesOrg,
      baseUrl: domain,
    );
    createVirtualAccount =
        await NewPaymentLocalDataSource().createVirtualAccount();
    principalCutoffs = await NewPaymentLocalDataSource().getPrincipalCutoffs();
    when(
      () => deviceStorage.currentMarket(),
    ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

    when(
      () => mockConfig.baseUrl(
        marketDomain: fakeMYSalesOrg.country.toLowerCase(),
      ),
    ).thenAnswer((_) => domain);
  });

  group(
    'New Payments repository test',
    () {
      //***************************** MOCK ***********************
      test('Fetch outstanding invoices success - Mock ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.empty(),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch outstanding invoices failure - Mock ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.empty(),
          isMarketPlace: true,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available credit success - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            orderBy: fakeOrderBy,
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.empty(),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available credit failure - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.empty(),
          isMarketPlace: true,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available pay success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.pay(
            salesOrg: fakeSalesOrg,
            baseUrl: domain,
          ),
        ).thenAnswer((invocation) async => paymentInfo);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            orderBy: fakeOrderBy,
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeUser,
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available pay failure - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.pay(
            salesOrg: fakeSalesOrg,
            baseUrl: domain,
          ),
        ).thenThrow((invocation) => MockException());

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            orderBy: fakeOrderBy,
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeUser,
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Update Payment Gateway Method success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.updatePaymentGateway(),
        ).thenAnswer((invocation) async {
          return;
        });

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: false,
          paymentStatus: fakePaymentStatus,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Update Payment Gateway Method failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.updatePaymentGateway(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: false,
          paymentStatus: fakePaymentStatus,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Update Payment Gateway Method success- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.updatePaymentGateway(
            salesOrg: fakeSGSalesOrg.getOrCrash(),
            txnStatus: 'fake-status',
            paymentID: 'fake-id',
            transactionRef: 'fake-ref',
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            isMarketPlace: false,
          ),
        ).thenAnswer((_) async {
          return;
        });

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: false,
          paymentStatus: fakePaymentStatus,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('Update Payment Gateway Method failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.updatePaymentGateway(
            salesOrg: fakeSGSalesOrg.getOrCrash(),
            txnStatus: 'fake-status',
            paymentID: 'fake-id',
            transactionRef: 'fake-ref',
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            isMarketPlace: true,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: true,
          paymentStatus: fakePaymentStatus,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('payment info invoice pdf success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPaymentInvoiceInfoPdf(),
        ).thenAnswer((invocation) async => PaymentInvoiceInfoPdf.empty());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: PaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('payment info invoice pdf failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPaymentInvoiceInfoPdf(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: PaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: true,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Payment methods success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.fetchPaymentMethods(),
        ).thenAnswer((invocation) async => [NewPaymentMethod.empty()]);

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Payment methods failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.fetchPaymentMethods(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      //***************************** UAT ***********************
      test(
          'Fetch outstanding invoices success for ID market when filter by Document date - Uat ',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            isMarketPlace: true,
            filterList: [
              {
                'field': 'documentDate',
                'value': '2023-12-01',
                'type': 'ge',
              },
              {
                'field': 'documentDate',
                'value': '2023-12-28',
                'type': 'le',
              },
            ],
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('2023-12-01'),
            documentDateTo: DateTimeStringValue('2023-12-28'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation: fakeIDSalesOrganisation,
          searchKey: SearchKey.empty(),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('Fetch outstanding invoices success for other markets - Uat ',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.search('fake'),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch outstanding invoices failure - Uat ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
            isMarketPlace: true,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.search('fake'),
          isMarketPlace: true,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available credit success - UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getAvailableCreditNotes(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.search('fake'),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available credit failure - UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getAvailableCreditNotes(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
            isMarketPlace: false,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey.search('fake'),
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available pay success- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.pay(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            customerInvoices: customerOpenItems
                .map(
                  (customerOpenItem) => CustomerInvoiceDto.fromDomain(
                    customerOpenItem,
                  ).toJson(),
                )
                .toList(),
            paymentMethod: '',
            transactionCurrency: '',
            userName: fakeUserName,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isMarketPlace: true,
            baseUrl: domain,
          ),
        ).thenAnswer((invocation) async => paymentInfo);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeUser,
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available pay failure- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.pay(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            customerInvoices: customerOpenItems
                .map(
                  (customerOpenItem) => CustomerInvoiceDto.fromDomain(
                    customerOpenItem,
                  ).toJson(),
                )
                .toList(),
            paymentMethod: '',
            transactionCurrency: '',
            userName: fakeUserName,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            isMarketPlace: false,
            baseUrl: domain,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: User.empty().copyWith(username: Username(fakeUserName)),
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          shipToInfo: fakeShipToInfo,
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Update Payment Gateway Method failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.updatePaymentGateway(
            salesOrg: fakeSGSalesOrg.getOrCrash(),
            txnStatus: 'fake-status',
            paymentID: 'fake-id',
            transactionRef: 'fake-ref',
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            isMarketPlace: true,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: true,
          paymentStatus: fakePaymentStatus,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('payment info invoice pdf success- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
            salesOrg: fakeSalesOrg.getValue(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            customerName: fakeUserName,
            paymentId: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
            zzAdviceNumber: '092323EZ34245',
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => PaymentInvoiceInfoPdf.empty());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: PaymentInfo.empty().copyWith(
            paymentID: '123',
            zzAdvice: '092323EZ34245',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: false,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('payment info invoice pdf failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
            salesOrg: fakeSalesOrg.getValue(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            customerName: fakeUserName,
            paymentId: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
            zzAdviceNumber: '092323EZ34245',
            isMarketPlace: true,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: PaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: true,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Payment methods success- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.fetchPaymentMethods(
            salesOrg: fakeSalesOrg.getValue(),
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => [NewPaymentMethod.empty()]);

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: true,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Payment methods failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.fetchPaymentMethods(
            salesOrg: fakeSalesOrg.getValue(),
            isMarketPlace: false,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Save File success- UAT', () async {
        final buffer = Uint8List.fromList([1, 2, 3, 4, 5]);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => fileSystemHelper.getDownloadedFile(
            AttachmentFileBuffer(
              buffer: buffer,
              name: 'invoice_${DateTime.now().millisecondsSinceEpoch}.pdf',
            ),
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.saveFile(
          pdfData: buffer,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Create Virtual Account success- Local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.createVirtualAccount(),
        ).thenAnswer((invocation) async => createVirtualAccount);

        final result = await nawPaymentsRepository.createVirtualAccount(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          invoices: [
            CustomerOpenItem.empty()
                .copyWith(accountingDocument: 'fake_document'),
          ],
          paymentMethodOption: PaymentMethodOption.empty().copyWith(
            bankOptionId: BankOptionId('fake_id'),
            prodiver: StringValue('fake_provider'),
          ),
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('Fetch Create Virtual Account failure- Local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.createVirtualAccount(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.createVirtualAccount(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          invoices: [
            CustomerOpenItem.empty()
                .copyWith(accountingDocument: 'fake_document'),
          ],
          paymentMethodOption: PaymentMethodOption.empty().copyWith(
            bankOptionId: BankOptionId('fake_id'),
            prodiver: StringValue('fake_provider'),
          ),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
      test('Fetch Create Virtual Account success- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.createVirtualAccount(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            invoices: ['fake_document'],
            bankID: 'fake_id',
            provider: 'fake_provider',
          ),
        ).thenAnswer((invocation) async => createVirtualAccount);

        final result = await nawPaymentsRepository.createVirtualAccount(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          invoices: [
            CustomerOpenItem.empty()
                .copyWith(accountingDocument: 'fake_document'),
          ],
          paymentMethodOption: PaymentMethodOption.empty().copyWith(
            bankOptionId: BankOptionId('fake_id'),
            prodiver: StringValue('fake_provider'),
          ),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Create Virtual Account failure- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.createVirtualAccount(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            invoices: ['fake_document'],
            bankID: 'fake_id',
            provider: 'fake_provider',
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.createVirtualAccount(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          invoices: [
            CustomerOpenItem.empty()
                .copyWith(accountingDocument: 'fake_document'),
          ],
          paymentMethodOption: PaymentMethodOption.empty().copyWith(
            bankOptionId: BankOptionId('fake_id'),
            prodiver: StringValue('fake_provider'),
          ),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Principal Cutoffs success- Local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPrincipalCutoffs(),
        ).thenAnswer((invocation) async => principalCutoffs);

        final result = await nawPaymentsRepository.getPrincipalCutoffs(
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Principal Cutoffs failure- Local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPrincipalCutoffs(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPrincipalCutoffs(
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Principal Cutoffs success- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPrincipalCutoffs(
            branches: [fakeShipToInfo.plant],
          ),
        ).thenAnswer((invocation) async => principalCutoffs);

        final result = await nawPaymentsRepository.getPrincipalCutoffs(
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Principal Cutoffs failure- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPrincipalCutoffs(
            branches: [fakeShipToInfo.plant],
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPrincipalCutoffs(
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Open saved advice file success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => fileSystemHelper.openFile(
            AttachmentFileBuffer.empty(),
          ),
        ).thenAnswer((invocation) async => OpenResult());

        final result = await nawPaymentsRepository.viewSavedAdvice(
          savedAdvice: AttachmentFileBuffer.empty(),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Open saved advice file failure with default failure type',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => fileSystemHelper.openFile(
            AttachmentFileBuffer.empty(),
          ),
        ).thenAnswer(
          (invocation) async =>
              OpenResult(type: ResultType.error, message: 'fake-error'),
        );

        final result = await nawPaymentsRepository.viewSavedAdvice(
          savedAdvice: AttachmentFileBuffer.empty(),
        );
        expect(
          result,
          const Left(ApiFailure.openDownloadedFileError('fake-error')),
        );
      });

      test('Open saved advice file failure with exception', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => fileSystemHelper.openFile(
            AttachmentFileBuffer.empty(),
          ),
        ).thenThrow(
          (invocation) => MockException(),
        );

        final result = await nawPaymentsRepository.viewSavedAdvice(
          savedAdvice: AttachmentFileBuffer.empty(),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    },
  );
}
