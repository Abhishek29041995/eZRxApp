import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';


class PaymentTermLocalDataSourceMock extends Mock
    implements PaymentTermLocalDataSource {}

class PaymentTermsRemoteDataSourceMock extends Mock
    implements PaymentTermsRemoteDataSource {}

void main() {
  late PaymentTermsRepository paymentTermsRepository;
  late Config mockConfig;
  late PaymentTermLocalDataSource paymentTermLocalDataSource;
  late PaymentTermsRemoteDataSource paymentTermsRemoteDataSource;

  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '000001000813');
  final mockPaymentCustomerInformation = PaymentCustomerInformation.empty();
  final mockSalesRepresentativeInfo = SalesRepresentativeInfo.empty();
  setUpAll(() {
    mockConfig = ConfigMock();
    paymentTermLocalDataSource = PaymentTermLocalDataSourceMock();
    paymentTermsRemoteDataSource = PaymentTermsRemoteDataSourceMock();

    paymentTermsRepository = PaymentTermsRepository(
      config: mockConfig,
      localDataSource: paymentTermLocalDataSource,
      remoteDataSource: paymentTermsRemoteDataSource,
    );
  });

  group('PaymentTermsRepository should - ', () {
    test('get PaymentTermsRepository successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => paymentTermLocalDataSource.getPaymentTerms())
          .thenAnswer((invocation) async => <PaymentTerm>[]);

      final result = await paymentTermsRepository.getPaymentTerms(
        salesOrganisation: fakeMYSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        paymentCustomerInfo: mockPaymentCustomerInformation,
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesRepInfo: mockSalesRepresentativeInfo,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get PaymentTermsRepository fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => paymentTermLocalDataSource.getPaymentTerms())
          .thenThrow((invocation) async => MockException());

      final result = await paymentTermsRepository.getPaymentTerms(
        salesOrganisation: fakeMYSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        paymentCustomerInfo: mockPaymentCustomerInformation,
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesRepInfo: mockSalesRepresentativeInfo,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get PaymentTermsRepository successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => paymentTermsRemoteDataSource.getPaymentTerms(
          salesOrganisation: fakeSGSalesOrganisation.salesOrg.getValue(),
          soldToCustomerCode: '000002510',
          basePaymentTermCode: 'K002',
          language: 'EN',
          principalCode: [
            '0000101991',
            '0000100797',
            '0000101517',
            '0000102272',
          ],
        ),
      ).thenAnswer((invocation) async => <PaymentTerm>[]);

      final result = await paymentTermsRepository.getPaymentTerms(
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo:
            mockCustomerCodeInfo.copyWith(customerCodeSoldTo: '000002510'),
        paymentCustomerInfo:
            mockPaymentCustomerInformation.copyWith(paymentTerm: 'K002'),
        salesOrgConfig: fakeSGSalesOrgConfigs,
        salesRepInfo: mockSalesRepresentativeInfo.copyWith(
          uniquePrincipalNumber: [
            '0000101991',
            '0000100797',
            '0000101517',
            '0000102272',
          ],
        ),
        preferredLanguage: fakeClientUser.preferredLanguage,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get PaymentTermsRepository fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => paymentTermsRemoteDataSource.getPaymentTerms(
          salesOrganisation: '',
          soldToCustomerCode: '',
          basePaymentTermCode: '',
          language: '',
          principalCode: [],
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await paymentTermsRepository.getPaymentTerms(
        salesOrganisation: fakeMYSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        paymentCustomerInfo: mockPaymentCustomerInformation,
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesRepInfo: mockSalesRepresentativeInfo,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
