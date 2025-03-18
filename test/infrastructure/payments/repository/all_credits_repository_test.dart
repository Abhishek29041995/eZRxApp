import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
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
  late AllCreditsFilter allCreditsFilter;
  late List<CreditAndInvoiceItem> mockList;
  late AllCreditsAndInvoicesLocalDataSource
      allCreditsAndInvoicesLocalDataSourceMock;
  late AllCreditsAndInvoicesRemoteDataSource
      allCreditsAndInvoicesRemoteDataSourceMock;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  final fakeToDate = DateTime.now();
  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 29),
  );

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
    mockList = List<CreditAndInvoiceItem>.empty();
    allCreditsFilter = AllCreditsFilter.defaultFilter().copyWith(
      documentDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      documentDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      amountValueTo: RangeValue('100'),
      amountValueFrom: RangeValue('1000'),
    );
  });

  group('All Credits Repository Test', () {
    test('=> filterCredits locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
        isMarketPlace: false,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
      ).thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
        isMarketPlace: false,
      );
      expect(result.isLeft(), true);
    });
    test('=> filterCredits remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.defaultFilter().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toMapList,
          isMarketPlace: false,
        ),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty()
            .copyWith(customerCodeSoldTo: 'mock_soldTo'),
        salesOrganisation: SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
        isMarketPlace: false,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits remote success for ID market', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeIDSalesOrganisation.salesOrg.getValue(),
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.defaultFilter().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toIDCreditFilterMapList,
          isMarketPlace: false,
        ),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeIDSalesOrganisation,
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
        isMarketPlace: false,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.defaultFilter().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toMapList,
          isMarketPlace: false,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
        isMarketPlace: false,
      );
      expect(result.isLeft(), true);
    });
  });
}
