import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/account_summary_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class ConfigMock extends Mock implements Config {}

class AccountSummaryLocalDataSourceMock extends Mock
    implements AccountSummaryLocalDataSource {}

class AccountSummaryRemoteDataSourceMock extends Mock
    implements AccountSummaryRemoteDataSource {}

void main() {
  late Config configMock;
  late CreditLimit creditLimit;
  late OutstandingBalance outstandingBalance;
  late AccountSummaryRepository accountSummaryRepository;
  late AccountSummaryLocalDataSource accountSummaryLocalDataSource;
  late AccountSummaryRemoteDataSource accountSummaryRemoteDataSource;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    accountSummaryLocalDataSource = AccountSummaryLocalDataSourceMock();
    accountSummaryRemoteDataSource = AccountSummaryRemoteDataSourceMock();
    accountSummaryRepository = AccountSummaryRepository(
      config: configMock,
      localDataSource: accountSummaryLocalDataSource,
      remoteDataSource: accountSummaryRemoteDataSource,
    );
    outstandingBalance =
        await AccountSummaryLocalDataSource().fetchInvoiceSummary();
    creditLimit = await AccountSummaryLocalDataSource().fetchCreditSummary();
  });

  group('Account summary Repository fetchInvoiceSummary Test', () {
    test('fetchInvoiceSummary locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => accountSummaryLocalDataSource.fetchInvoiceSummary(),
      ).thenAnswer(
        (invocation) async => outstandingBalance,
      );

      final result = await accountSummaryRepository.fetchInvoiceSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => OutstandingBalance.empty()),
        outstandingBalance,
      );
    });

    test('fetchInvoiceSummary locally fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => accountSummaryLocalDataSource.fetchInvoiceSummary(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await accountSummaryRepository.fetchInvoiceSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });

    test('fetchInvoiceSummary remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => accountSummaryRemoteDataSource.fetchInvoiceSummary(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrg.getValue(),
          isMarketPlace: true,
        ),
      ).thenAnswer(
        (invocation) async => outstandingBalance,
      );

      final result = await accountSummaryRepository.fetchInvoiceSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => OutstandingBalance.empty()),
        outstandingBalance,
      );
    });

    test('fetchInvoiceSummary remote fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => accountSummaryRemoteDataSource.fetchInvoiceSummary(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrg.getValue(),
          isMarketPlace: true,
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await accountSummaryRepository.fetchInvoiceSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });
  });

  group('Account summary Repository fetchCreditSummary Test', () {
    test('fetchCreditSummary locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => accountSummaryLocalDataSource.fetchCreditSummary(),
      ).thenAnswer(
        (invocation) async => creditLimit,
      );

      final result = await accountSummaryRepository.fetchCreditSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => CreditLimit.empty()),
        creditLimit,
      );
    });

    test('fetchCreditSummary locally fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => accountSummaryLocalDataSource.fetchCreditSummary(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await accountSummaryRepository.fetchCreditSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });

    test('fetchCreditSummary remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => accountSummaryRemoteDataSource.fetchCreditLimit(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrg.getValue(),
          isMarketPlace: true,
        ),
      ).thenAnswer(
        (invocation) async => creditLimit,
      );

      final result = await accountSummaryRepository.fetchCreditSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => CreditLimit.empty()),
        creditLimit,
      );
    });

    test('fetchCreditSummary remote fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => accountSummaryRemoteDataSource.fetchCreditLimit(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrg.getValue(),
          isMarketPlace: true,
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await accountSummaryRepository.fetchCreditSummary(
        custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        salesOrg: fakeSalesOrg,
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });
  });
}
