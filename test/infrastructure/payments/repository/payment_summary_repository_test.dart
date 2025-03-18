import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/transaction_params.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_params_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class PaymentSummaryLocalDataSourceMock extends Mock
    implements PaymentSummaryLocalDataSource {}

class PaymentSummaryRemoteDataSourceMock extends Mock
    implements PaymentSummaryRemoteDataSource {}

void main() {
  late PaymentSummaryRepository paymentSummaryRepository;
  late Config mockConfig;
  late PaymentSummaryLocalDataSource localDataSource;
  late PaymentSummaryRemoteDataSource remoteDataSource;
  late List<PaymentSummaryDetails> fakePaymentList;
  late List<PaymentSummaryDetails> fakeTransactionList;
  final fakeFilter = PaymentSummaryFilter.defaultFilter()
      .copyWith(searchKey: SearchKey.search('FAKE_SEARCH_KEY'));
  final filterList = PaymentSummaryFilterDto.fromDomain(fakeFilter).toMapList;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockConfig = Config()..appFlavor = Flavor.mock;
      localDataSource = PaymentSummaryLocalDataSourceMock();
      remoteDataSource = PaymentSummaryRemoteDataSourceMock();
      paymentSummaryRepository = PaymentSummaryRepository(
        config: mockConfig,
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
      );

      fakePaymentList =
          await PaymentSummaryLocalDataSource().getPaymentSummary();
      fakeTransactionList =
          await PaymentSummaryLocalDataSource().getTransactions();
    },
  );

  group('PaymentSummaryRepository tests', () {
    test('fetch Payment Summary List successfully local', () async {
      when(() => localDataSource.getPaymentSummary())
          .thenAnswer((invocation) async => fakePaymentList);

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeSalesOrganisation,
        isMarketPlace: true,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('fetch Payment Summary List fail local', () async {
      when(() => localDataSource.getPaymentSummary())
          .thenThrow(MockException());

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeSalesOrganisation,
        isMarketPlace: true,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'fetch Payment Summary List successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;

        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList: filterList,
            pageSize: mockConfig.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => fakePaymentList);

        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          isMarketPlace: false,
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'fetch Payment Summary List successfully remote when searck key is blank',
      () async {
        mockConfig.appFlavor = Flavor.uat;

        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList:
                PaymentSummaryFilterDto.fromDomain(fakeFilter).toMapList,
            pageSize: mockConfig.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => fakePaymentList);

        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          isMarketPlace: false,
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'fetch Payment Summary List fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList: filterList,
            pageSize: mockConfig.pageSize,
            isMarketPlace: false,
          ),
        ).thenThrow(MockException());
        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          isMarketPlace: false,
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );

    test('fetch Payment Summary List successfully local for ID market',
        () async {
      mockConfig.appFlavor = Flavor.mock;
      when(() => localDataSource.getTransactions())
          .thenAnswer((invocation) async => fakeTransactionList);

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeIDSalesOrganisation,
        isMarketPlace: false,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => <PaymentSummaryDetails>[]),
        fakeTransactionList,
      );
    });
    test('fetch Payment Summary List fail local for ID market', () async {
      mockConfig.appFlavor = Flavor.mock;
      when(() => localDataSource.getTransactions()).thenThrow(MockException());

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeIDSalesOrganisation,
        isMarketPlace: false,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(
          FailureHandler.handleFailure(MockException()),
        ),
      );
    });

    test('fetch Payment Summary List successfully remote for ID market',
        () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getTransactions(
          requestParams: TransactionParamsDto.fromDomain(
            TransactionParams(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              filter: fakeFilter,
              first: mockConfig.pageSize,
              after: 0,
            ),
          ).toMap(),
        ),
      ).thenAnswer((invocation) async => fakeTransactionList);

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeIDSalesOrganisation,
        isMarketPlace: false,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => <PaymentSummaryDetails>[]),
        fakeTransactionList,
      );
    });
    test('fetch Payment Summary List fail local for ID market', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getTransactions(
          requestParams: TransactionParamsDto.fromDomain(
            TransactionParams(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              filter: fakeFilter,
              first: mockConfig.pageSize,
              after: 0,
            ),
          ).toMap(),
        ),
      ).thenThrow(MockException());

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeIDSalesOrganisation,
        isMarketPlace: false,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(
          FailureHandler.handleFailure(MockException()),
        ),
      );
    });
  });
}
