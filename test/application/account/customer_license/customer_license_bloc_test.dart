import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_license_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class CustomerLicenseRepositoryMock extends Mock
    implements CustomerLicenseRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final CustomerLicenseRepository customerLicenseRepo =
      CustomerLicenseRepositoryMock();
  late Config config;
  const apiFailure = ApiFailure.other('fake-error');
  final fakeLicense = CustomerLicense(
    licenseNumbers: StringValue('fake1'),
    licenseType: StringValue('fake2'),
    licenseDescription: StringValue('fake3'),
    validFrom: DateTimeStringValue('fake4'),
    validTo: DateTimeStringValue('fake4'),
    status: StatusType('fake5'),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    config = Config()..appFlavor = Flavor.mock;
  });

  group('Customer License Bloc', () {
    blocTest(
      'Customer code Initial',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCode: fakeCustomerCodeInfo,
            user: fakeClientUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          CustomerLicenseEvent.initialized(
            salesOrganization: fakeIDSalesOrganisation,
            customerInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        );
      },
      verify: (CustomerLicenseBloc bloc) {
        expect(
          bloc.state.salesOrganization,
          fakeIDSalesOrganisation,
        );
        expect(
          bloc.state.customerInfo,
          fakeCustomerCodeInfo,
        );
        expect(
          bloc.state.user,
          fakeClientUser,
        );
      },
    );

    blocTest(
      'Customer License Fetch fail',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCode: fakeCustomerCodeInfo,
            user: fakeClientUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.fetch(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: true,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Fetch success',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCode: fakeCustomerCodeInfo,
            user: fakeClientUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer((_) async => Right([fakeLicense]));
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.fetch(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          customerLicenses: [fakeLicense],
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Load more success',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCode: fakeCustomerCodeInfo,
            user: fakeClientUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer((_) async => Right([fakeLicense]));
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          customerLicenses: [fakeLicense],
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer License Load more fail',
      build: () => CustomerLicenseBloc(
        customerLicenseRepository: customerLicenseRepo,
        config: config,
      ),
      seed: () => CustomerLicenseState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => customerLicenseRepo.getCustomerLicense(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCode: fakeCustomerCodeInfo,
            user: fakeClientUser,
            pageSize: config.pageSize,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerLicenseBloc bloc) {
        bloc.add(
          const CustomerLicenseEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isFetching: true,
          canLoadMore: true,
        ),
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: true,
          isFetching: false,
        ),
      ],
    );

    test('isLicenseExpired getter', () {
      final expiredLicense = fakeLicense.copyWith(
        validTo: DateTimeStringValue(DateTime(1900).toIso8601String()),
      );
      final validLicense = fakeLicense.copyWith(
        validTo: DateTimeStringValue(
          DateTime.now().add(const Duration(days: 9)).toIso8601String(),
        ),
      );

      expect(
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerLicenses: [expiredLicense],
        ).isLicenseExpired,
        false,
      );

      expect(
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerLicenses: [expiredLicense],
        ).isLicenseExpired,
        true,
      );

      expect(
        CustomerLicenseState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerLicenses: [validLicense],
        ).isLicenseExpired,
        false,
      );
    });
  });
}
