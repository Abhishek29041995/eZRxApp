import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/full_summary_filter_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class AllCreditsAndInvoicesLocalDataSourceMock extends Mock
    implements AllCreditsAndInvoicesLocalDataSource {}

class AllCreditsAndInvoicesRemoteDataSourceMock extends Mock
    implements AllCreditsAndInvoicesRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;
  late List<CreditAndInvoiceItem> mockList;
  late AllCreditsAndInvoicesLocalDataSource
      allCreditsAndInvoicesLocalDataSourceMock;
  late AllCreditsAndInvoicesRemoteDataSource
      allCreditsAndInvoicesRemoteDataSourceMock;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  const pageSize = 10;
  final fakeError = MockException(message: 'fake-exception');
  const fakeFromDate = '2023-05-01';
  const fakeToDate = '2023-05-28';
  final filterMap = [
    {'field': 'accountingDocumentType', 'value': 'Invoice'},
    {'field': 'documentDate', 'value': fakeFromDate, 'type': 'ge'},
    {'field': 'documentDate', 'value': fakeToDate, 'type': 'le'},
    {'field': 'netDueDate', 'value': fakeFromDate, 'type': 'ge'},
    {'field': 'netDueDate', 'value': fakeToDate, 'type': 'le'},
  ];

  final filterFullSummary =
      FullSummaryFilterDto.fromDomain(FullSummaryFilter.defaultFilter())
          .toMapList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    allCreditsAndInvoicesLocalDataSourceMock =
        AllCreditsAndInvoicesLocalDataSourceMock();
    allCreditsAndInvoicesRemoteDataSourceMock =
        AllCreditsAndInvoicesRemoteDataSourceMock();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepository(
      config: configMock,
      localDataSource: allCreditsAndInvoicesLocalDataSourceMock,
      remoteDataSource: allCreditsAndInvoicesRemoteDataSourceMock,
    );
    mockList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
  });

  group('All Credits and Invoices Repository Test', () {
    group('filterInvoices Test', () {
      test('=> filterInvoices locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
        ).thenAnswer(
          (invocation) async => mockList,
        );

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          filter: AllInvoicesFilter.defaultFilter(),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(result, Right(mockList));
      });

      test('=> filterInvoices locally failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
        ).thenThrow(fakeError);

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          filter: AllInvoicesFilter.defaultFilter(),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
      test('=> filterInvoices remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock.filterInvoices(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrg.getValue(),
            filterMap: filterMap,
            pageSize: 1,
            offset: 0,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => mockList,
        );
        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            dueDateFrom: DateTimeStringValue(fakeFromDate),
            dueDateTo: DateTimeStringValue(fakeToDate),
            documentDateFrom: DateTimeStringValue(fakeFromDate),
            documentDateTo: DateTimeStringValue(fakeToDate),
          ),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(result, Right(mockList));
      });

      test('=> filterInvoices remote failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock.filterInvoices(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            filterMap: filterMap,
            pageSize: 1,
            offset: 0,
            isMarketPlace: false,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          filter: AllInvoicesFilter.defaultFilter(),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(result.isLeft(), true);
      });
    });

    group('filter Full Summary Test', () {
      test('=> Locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
        ).thenAnswer(
          (invocation) async => mockList,
        );

        final result = await allCreditsAndInvoicesRepository.filterFullSummary(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          filter: FullSummaryFilter.defaultFilter(),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(result, Right(mockList));
      });

      test('=> Locally Failure', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
        ).thenThrow(MockException());

        final result = await allCreditsAndInvoicesRepository.filterFullSummary(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          filter: FullSummaryFilter.defaultFilter(),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );
        expect(
          result,
          Left(
            FailureHandler.handleFailure(MockException()),
          ),
        );
      });

      test('=> Remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock.filterFullSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            pageSize: pageSize,
            filterMap: filterFullSummary,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => mockList,
        );

        final result = await allCreditsAndInvoicesRepository.filterFullSummary(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          filter: FullSummaryFilter.defaultFilter(),
          pageSize: pageSize,
          offset: 0,
          isMarketPlace: false,
        );
        expect(result, Right(mockList));
      });

      test('=> Remote Failure', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(
          () => allCreditsAndInvoicesRemoteDataSourceMock.filterFullSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            pageSize: pageSize,
            filterMap: filterFullSummary,
            isMarketPlace: false,
          ),
        ).thenThrow(MockException());

        final result = await allCreditsAndInvoicesRepository.filterFullSummary(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          filter: FullSummaryFilter.defaultFilter(),
          pageSize: pageSize,
          offset: 0,
          isMarketPlace: false,
        );
        expect(
          result,
          Left(
            FailureHandler.handleFailure(MockException()),
          ),
        );
      });
    });
  });
}
