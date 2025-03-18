import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_in_progress_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class PaymentInProgressLocalDataSourceMock extends Mock
    implements PaymentInProgressLocalDataSource {}

class PaymentInProgressRemoteDataSourceMock extends Mock
    implements PaymentInProgressRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late PaymentInProgressLocalDataSource paymentInProgressLocalDataSource;
  late PaymentInProgressRemoteDataSource paymentInProgressRemoteDataSource;
  late Config configMock;
  late PaymentInProgressRepository paymentInProgressRepository;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    paymentInProgressLocalDataSource = PaymentInProgressLocalDataSourceMock();
    paymentInProgressRemoteDataSource = PaymentInProgressRemoteDataSourceMock();
    paymentInProgressRepository = PaymentInProgressRepository(
      config: configMock,
      localDataSource: paymentInProgressLocalDataSource,
      remoteDataSource: paymentInProgressRemoteDataSource,
    );
  });

  group('Payment in progress Repository Test', () {
    test('getPaymentInProgress locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => paymentInProgressLocalDataSource.getPaymentInProgress(),
      ).thenAnswer(
        (invocation) async => [StringValue('')],
      );

      final result = await paymentInProgressRepository.getPaymentInProgress(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
    });

    test('getPaymentInProgress locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => paymentInProgressLocalDataSource.getPaymentInProgress(),
      ).thenThrow((invocation) async => MockException());

      final result = await paymentInProgressRepository.getPaymentInProgress(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });
    test('getPaymentInProgress remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => paymentInProgressRemoteDataSource.getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: true,
        ),
      ).thenAnswer(
        (invocation) async => [StringValue('100')],
      );

      final result = await paymentInProgressRepository.getPaymentInProgress(
        customerCodeInfo: CustomerCodeInfo.empty()
            .copyWith(customerCodeSoldTo: 'mock_customer_code'),
        salesOrganization: SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
        isMarketPlace: true,
      );
      expect(result.isRight(), true);
    });

    test('getPaymentInProgress remote success with empty value', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => paymentInProgressRemoteDataSource.getPaymentInProgress(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeMYSalesOrganisation.salesOrg.getValue(),
          isMarketPlace: true,
        ),
      ).thenAnswer(
        (invocation) async => [StringValue('')],
      );

      final result = await paymentInProgressRepository.getPaymentInProgress(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganization: fakeMYSalesOrganisation,
        isMarketPlace: true,
      );
      expect(result, Right(StringValue('')));
    });

    test('=> filterCredits remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => paymentInProgressRemoteDataSource.getPaymentInProgress(
          customerCode: 'mock_customer_code',
          salesOrg: 'mock_salesOrg',
          isMarketPlace: true,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await paymentInProgressRepository.getPaymentInProgress(
        customerCodeInfo: CustomerCodeInfo.empty()
            .copyWith(customerCodeSoldTo: 'mock_customer_code'),
        salesOrganization: SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
        isMarketPlace: true,
      );
      expect(result.isLeft(), true);
    });
  });
}
