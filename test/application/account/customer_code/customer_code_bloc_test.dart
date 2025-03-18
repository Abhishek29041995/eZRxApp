import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/customer_code_mock.dart';

class CustomerCodeMockRepo extends Mock implements CustomerCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CustomerInformation customerMockData;
  final CustomerCodeRepository customerCodeMockRepo = CustomerCodeMockRepo();
  late Config config;
  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: <SalesOrgShipToInfo>[],
    ),
  ];

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(type: RoleType('client')),
  );
  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeSalesOrgCustomerInfos,
  );

  const apiFailure = ApiFailure.other('fake-error');
  late CustomerCodeConfig customerCodeConfig;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    customerMockData =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
    config = Config()..appFlavor = Flavor.mock;
    customerCodeConfig =
        await CustomerCodeLocalDataSource().getCustomerCodeConfig();
  });

  group('Customer Code Bloc', () {
    blocTest(
      'Customer code Initial',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.initialized(
            hideCustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
        ),
      ],
    );

    blocTest(
      'Customer Code Fetch fail',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search(
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search(
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          searchKey: SearchKey.search(
            fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
          ),
          canLoadMore: false,
        ),
        CustomerCodeState.initial().copyWith(
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          searchKey: SearchKey.search(
            fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
          ),
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Fetch Success',
      build: () => CustomerCodeBloc(
        config: config,
        customerCodeRepository: customerCodeMockRepo,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: SalesOrganisation(
          salesOrg: SalesOrg('2001'),
          customerInfos: [
            ...fakeSalesOrgCustomerInfos,
          ],
        ),
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: SalesOrganisation(
              salesOrg: SalesOrg('2001'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            searchKey: SearchKey.search(
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search(
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: SalesOrganisation(
            salesOrg: SalesOrg('2001'),
            customerInfos: [
              ...fakeSalesOrgCustomerInfos,
            ],
          ),
          searchKey: SearchKey.search(
            fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
          ),
          customerCodeList: <CustomerCodeInfo>[],
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: SalesOrganisation(
            salesOrg: SalesOrg('2001'),
            customerInfos: [
              ...fakeSalesOrgCustomerInfos,
            ],
          ),
          isFetching: false,
          searchKey: SearchKey.search(
            fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
          ),
          customerCodeList: customerMockData.soldToInformation,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
        ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        customerMockData.soldToInformation,
      ),
    );

    blocTest(
      'Customer Code Validate Offset',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: SalesOrganisation(
          salesOrg: SalesOrg('2902'),
          customerInfos: [
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
          ],
        ),
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: SalesOrganisation(
              salesOrg: SalesOrg('2902'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            searchKey: SearchKey.empty(),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 4,
              soldToInformation: [
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(searchValue: SearchKey.empty()),
        );
      },
      expect: () {
        return [
          CustomerCodeState.initial().copyWith(
            hideCustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: SalesOrganisation(
              salesOrg: SalesOrg('2902'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            isFetching: true,
            customerCodeList: <CustomerCodeInfo>[],
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
          ),
          CustomerCodeState.initial().copyWith(
            hideCustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: SalesOrganisation(
              salesOrg: SalesOrg('2902'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            isFetching: false,
            customerCodeList: [
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
            ],
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
          ),
        ];
      },
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        [
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
        ],
      ),
    );

    blocTest(
      'Customer Code Search Success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('fake-customer-code'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 1,
              soldToInformation: [
                CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: 'fake-customer-code'),
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey.search('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [
            CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-customer-code'),
          ],
          searchKey: SearchKey.search('fake-customer-code'),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Search Success when hide block customer is true',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: true,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('block-customer-code'),
            hideCustomer: true,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            CustomerInformation.empty(),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('block-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: true,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey.search('block-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: true,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: <CustomerCodeInfo>[],
          searchKey: SearchKey.search('block-customer-code'),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Search Failure',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('fake-customer-code'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey.search('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: <CustomerCodeInfo>[],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isFetching: false,
          searchKey: SearchKey.search('fake-customer-code'),
          canLoadMore: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Auto-Search Success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('fake-customer-code'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 1,
              soldToInformation: [
                CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: 'fake-customer-code'),
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('fake-customer-code'),
          ),
        );
      },
      wait: const Duration(milliseconds: 1500),
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey.search('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [
            CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-customer-code'),
          ],
          searchKey: SearchKey.search('fake-customer-code'),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code Auto-Search Failure',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('fake-customer-code'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey.search('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: <CustomerCodeInfo>[],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          searchKey: SearchKey.search('fake-customer-code'),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Customer Code On Load More success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
        customerCodeList: customerMockData.soldToInformation,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            hideCustomer: false,
            offset: 34,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer((_) async => Right(customerMockData));
      },
      act: (bloc) => bloc.add(const CustomerCodeEvent.loadMore()),
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: customerMockData.soldToInformation,
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: false,
          canLoadMore: true,
          customerCodeList: [
            ...customerMockData.soldToInformation,
            ...customerMockData.soldToInformation,
          ],
        ),
      ],
    );

    blocTest(
      'Customer Code On Load More fail',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          // customerCodeList: customerMockData,
        ),
      ],
    );

    blocTest<CustomerCodeBloc, CustomerCodeState>(
      '=> Test if apiSuccess',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      act: (bloc) {
        final isApiSuccess = CustomerCodeState.initial().apiSuccess;
        expect(isApiSuccess, true);
      },
    );

    blocTest<CustomerCodeBloc, CustomerCodeState>(
      'Customer Code config Fetch fail',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCodeConfig(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => const Left(apiFailure),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetchCustomerCodeConfig(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          configFailureOrSuccessOption: optionOf(const Left(apiFailure)),
        ),
      ],
    );

    blocTest<CustomerCodeBloc, CustomerCodeState>(
      'Customer Code Fetch Success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCodeConfig(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerCodeConfig,
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetchCustomerCodeConfig(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          customerCodeConfig: customerCodeConfig,
        ),
      ],
    );
  });
}
