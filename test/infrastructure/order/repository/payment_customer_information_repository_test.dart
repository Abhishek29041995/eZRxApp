import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class PaymentCustomerInformationLocalDataSourceMock extends Mock
    implements PaymentCustomerInformationLocalDataSource {}

class PaymentCustomerInformationRemoteDataSourceMock extends Mock
    implements PaymentCustomerInformationRemoteDataSource {}

void main() {
  late PaymentCustomerInformationRepository
      paymentCustomerInformationRepository;
  late Config mockConfig;
  late PaymentCustomerInformationLocalDataSource
      paymentCustomerInformationLocalDataSource;
  late PaymentCustomerInformationRemoteDataSource
      paymentCustomerInformationRemoteDataSource;

  final mockSalesOrganisation = SalesOrganisation.empty();

  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '000001000813');

  setUpAll(() {
    mockConfig = MockConfig();
    paymentCustomerInformationLocalDataSource =
        PaymentCustomerInformationLocalDataSourceMock();
    paymentCustomerInformationRemoteDataSource =
        PaymentCustomerInformationRemoteDataSourceMock();

    paymentCustomerInformationRepository = PaymentCustomerInformationRepository(
      config: mockConfig,
      localDataSource: paymentCustomerInformationLocalDataSource,
      remoteDataSource: paymentCustomerInformationRemoteDataSource,
    );
  });

  group('paymentCustomerInformation should - ', () {
    test('get paymentCustomerInformation successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => paymentCustomerInformationLocalDataSource
            .getPaymentCustomerInformation(),
      ).thenAnswer((invocation) async => PaymentCustomerInformation.empty());

      final result = await paymentCustomerInformationRepository
          .getPaymentCustomerInformation(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get paymentCustomerInformation fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => paymentCustomerInformationLocalDataSource
            .getPaymentCustomerInformation(),
      ).thenThrow((invocation) async => MockException());

      final result = await paymentCustomerInformationRepository
          .getPaymentCustomerInformation(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get paymentCustomerInformation successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => paymentCustomerInformationRemoteDataSource
            .getPaymentCustomerInformation(
          customer: '0000002510',
          salesOrganisation: '2601-ZPSG',
        ),
      ).thenAnswer((invocation) async => PaymentCustomerInformation.empty());

      final result = await paymentCustomerInformationRepository
          .getPaymentCustomerInformation(
        customerCodeInfo: mockCustomerCodeInfo.copyWith(
          customerCodeSoldTo: '0000002510',
        ),
        salesOrganisation: mockSalesOrganisation.copyWith(
          salesOrg: SalesOrg('2601-ZPSG'),
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get paymentCustomerInformation fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => paymentCustomerInformationRemoteDataSource
            .getPaymentCustomerInformation(
          customer: '',
          salesOrganisation: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await paymentCustomerInformationRepository
          .getPaymentCustomerInformation(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
