import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_license_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class CustomerLicenseLocalDataSourceMock extends Mock
    implements CustomerLicenseLocalDataSource {}

class CustomerLicenseRemoteDataSourceMock extends Mock
    implements CustomerLicenseRemoteDataSource {}

void main() {
  late CustomerLicenseRepository customerLicenseRepository;
  late Config mockConfig;
  late int pageSize;
  late CustomerLicenseLocalDataSource customerLicenseLocalDataSource;
  late CustomerLicenseRemoteDataSource customerLicenseRemoteDataSource;
  late SalesOrganisation mockSalesOrg;
  late CustomerCodeInfo mockCustomerCodeInfo;

  setUpAll(
    () {
      mockConfig = Config()..appFlavor = Flavor.mock;
      pageSize = mockConfig.pageSize;
      customerLicenseLocalDataSource = CustomerLicenseLocalDataSourceMock();
      customerLicenseRemoteDataSource = CustomerLicenseRemoteDataSourceMock();
      customerLicenseRepository = CustomerLicenseRepository(
        config: mockConfig,
        localDataSource: customerLicenseLocalDataSource,
        remoteDataSource: customerLicenseRemoteDataSource,
      );
      mockSalesOrg = SalesOrganisation.empty().copyWith(
        salesOrg: SalesOrg('mockSalesOrg'),
      );
      mockCustomerCodeInfo = CustomerCodeInfo.empty();
    },
  );

  group('CustomerLicenseRepository tests', () {
    test('get CustomerLicense successfully local', () async {
      when(() => customerLicenseLocalDataSource.getCustomerLicense())
          .thenAnswer((invocation) async => <CustomerLicense>[]);

      final result = await customerLicenseRepository.getCustomerLicense(
        pageSize: pageSize,
        offset: 0,
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrg,
        user: fakeClientUser,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get CustomerLicense fail local', () async {
      when(() => customerLicenseLocalDataSource.getCustomerLicense())
          .thenThrow(MockException());

      final result = await customerLicenseRepository.getCustomerLicense(
        pageSize: pageSize,
        offset: 0,
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrg,
        user: fakeClientUser,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'get CustomerLicense successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.dev;
        when(
          () => customerLicenseRemoteDataSource.getCustomerLicense(
            pageSize: pageSize,
            offset: 0,
            customerCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            language: fakeClientUser.preferredLanguage.languageCode,
          ),
        ).thenAnswer((_) async => <CustomerLicense>[]);
        final result = await customerLicenseRepository.getCustomerLicense(
          pageSize: pageSize,
          offset: 0,
          customerCode: mockCustomerCodeInfo,
          salesOrganisation: mockSalesOrg,
          user: fakeClientUser,
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'get CustomerLicense fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.dev;

        when(
          () => customerLicenseRemoteDataSource.getCustomerLicense(
            pageSize: pageSize,
            offset: 0,
            customerCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            language: fakeClientUser.preferredLanguage.languageCode,
          ),
        ).thenThrow(MockException());
        final result = await customerLicenseRepository.getCustomerLicense(
          pageSize: pageSize,
          offset: 0,
          customerCode: mockCustomerCodeInfo,
          salesOrganisation: mockSalesOrg,
          user: fakeClientUser,
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}
