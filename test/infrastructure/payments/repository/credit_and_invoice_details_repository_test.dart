import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/credit_and_invoice_details_repository.dart';

class CreditAndInvoiceDetailsLocalDataSourceMock extends Mock
    implements CreditAndInvoiceDetailsLocalDataSource {}

class CreditAndInvoiceDetailsRemoteDataSourceMock extends Mock
    implements CreditAndInvoiceDetailsRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late CreditAndInvoiceDetailsLocalDataSource
      allCreditsAndInvoicesLocalDataSourceMock;
  late CreditAndInvoiceDetailsRemoteDataSource
      allCreditsAndInvoicesRemoteDataSourceMock;
  late Config configMock;
  late CreditAndInvoiceDetailsRepository allCreditsAndInvoicesRepository;
  late CreditAndInvoiceItem fakeInvoice;
  late List<CustomerDocumentDetail> fakeCreditAndInvoiceDetails;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    allCreditsAndInvoicesLocalDataSourceMock =
        CreditAndInvoiceDetailsLocalDataSourceMock();
    allCreditsAndInvoicesRemoteDataSourceMock =
        CreditAndInvoiceDetailsRemoteDataSourceMock();
    allCreditsAndInvoicesRepository = CreditAndInvoiceDetailsRepository(
      config: configMock,
      localDataSource: allCreditsAndInvoicesLocalDataSourceMock,
      remoteDataSource: allCreditsAndInvoicesRemoteDataSourceMock,
    );

    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      searchKey: StringValue('1080005528'),
      accountingDocumentItem: '001',
    );
    fakeCreditAndInvoiceDetails = <CustomerDocumentDetail>[
      CustomerDocumentDetail.empty(),
    ];
  });

  group('Invoice Details Repository Test', () {
    group('getCreditAndInvoiceDetails Test', () {
      test('=> getCreditAndInvoiceDetails locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () => allCreditsAndInvoicesLocalDataSourceMock
              .getCreditAndInvoiceDetails(),
        ).thenAnswer(
          (invocation) async => fakeCreditAndInvoiceDetails,
        );

        final result =
            await allCreditsAndInvoicesRepository.getCreditAndInvoiceDetails(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: true,
        );
        expect(result.isRight(), true);
      });

      test('=> getCreditAndInvoiceDetails locally failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () => allCreditsAndInvoicesLocalDataSourceMock
              .getCreditAndInvoiceDetails(),
        ).thenThrow((invocation) async => MockException());

        final result =
            await allCreditsAndInvoicesRepository.getCreditAndInvoiceDetails(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: false,
        );
        expect(result.isLeft(), true);
      });
      test('=> getCreditAndInvoiceDetails remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock
              .getCreditAndInvoiceDetails(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            bpCustomerNumber: fakeInvoice.bpCustomerNumber,
            fiscalYear: fakeInvoice.fiscalYear,
            searchKey: fakeInvoice.searchKey.getOrDefaultValue(''),
            accountingDocumentItem: fakeInvoice.accountingDocumentItem,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => fakeCreditAndInvoiceDetails,
        );

        final result =
            await allCreditsAndInvoicesRepository.getCreditAndInvoiceDetails(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: 'mock_soldTo'),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: true,
        );

        expect(result.isRight(), true);
      });

      test('=> getCreditAndInvoiceDetails remote failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock
              .getCreditAndInvoiceDetails(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            bpCustomerNumber: fakeInvoice.bpCustomerNumber,
            fiscalYear: fakeInvoice.fiscalYear,
            searchKey: fakeInvoice.searchKey.getOrDefaultValue(''),
            accountingDocumentItem: fakeInvoice.accountingDocumentItem,
            isMarketPlace: false,
          ),
        ).thenThrow((invocation) async => MockException());

        final result =
            await allCreditsAndInvoicesRepository.getCreditAndInvoiceDetails(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: false,
        );
        expect(result.isLeft(), true);
      });
    });
  });
}
