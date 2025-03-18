import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_search_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';

class CustomerCodeLocalDataSourceMock extends Mock
    implements CustomerCodeLocalDataSource {}

class CustomerCodeRemoteDataSourceMock extends Mock
    implements CustomerCodeRemoteDataSource {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class ConfigMock extends Mock implements Config {}

void main() {
  late int offset;
  late int pageSize;
  late Config configMock;
  late bool hideCustomer;
  late String mockCustomerCode;
  late SalesOrganisation mockSalesOrg;
  late User mockClientUser;
  late User mockSalesRepUser;
  late CustomerCodeRepository customerCodeRepository;
  late AccountSelectorStorage accountSelectorStorageMock;
  late CustomerCodeLocalDataSource customerCodeLocalDataSourceMock;
  late CustomerCodeRemoteDataSource customerCodeRemoteDataSourceMock;
  late DeviceStorage deviceStorage;
  const fakeMarket = 'fake-market';
  late CustomerCodeConfig customerCodeConfig;

  final fakeException = Exception('fake_error');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    accountSelectorStorageMock = AccountSelectorStorageMock();
    customerCodeLocalDataSourceMock = CustomerCodeLocalDataSourceMock();
    customerCodeRemoteDataSourceMock = CustomerCodeRemoteDataSourceMock();

    offset = 0;
    pageSize = 20;
    hideCustomer = true;
    mockCustomerCode = 'mockCustomerCode';
    mockSalesOrg = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('mockSalesOrg'),
    );

    mockClientUser = User.empty().copyWith(
      username: Username('mockUserName'),
      role: Role.empty().copyWith(
        type: RoleType('client'),
      ),
    );

    mockSalesRepUser = User.empty().copyWith(
      username: Username('mockUserName'),
      role: Role.empty().copyWith(
        type: RoleType('internal_sales_rep'),
      ),
    );
    deviceStorage = DeviceStorageMock();

    customerCodeRepository = CustomerCodeRepository(
      config: configMock,
      accountSelectorStorage: accountSelectorStorageMock,
      remoteDataSource: customerCodeRemoteDataSourceMock,
      localCustomerCodeDataSource: customerCodeLocalDataSourceMock,
      deviceStorage: deviceStorage,
    );

    customerCodeConfig =
        await CustomerCodeLocalDataSource().getCustomerCodeConfig();
    registerFallbackValue(AccountSelectorStorageDto.empty());
    when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
  });

  group('CustomerCode Repository Test', () {
    test(
        'Get Customer Code from local data source successfully for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getSalesRepCustomerCodeList())
          .thenAnswer(
        (invocation) async => CustomerInformation.empty(),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(mockCustomerCode),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
    });

    test('Get Customer Code from local data source failed for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getSalesRepCustomerCodeList())
          .thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(mockCustomerCode),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test(
        'Get Customer Code from local data source successfully for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getCustomerCodeList())
          .thenAnswer(
        (invocation) async => CustomerInformation.empty(),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(mockCustomerCode),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
    });

    test(
        'Get Customer Code from local data source failed for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getCustomerCodeList())
          .thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(mockCustomerCode),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test(
        'Get Customer Code from remote data source successfully for sales rep test',
        () async {
      final customerCodeList = [
        mockCustomerCode,
        '${mockCustomerCode}1',
        '${mockCustomerCode}2',
      ];
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: hideCustomer,
            after: offset,
            searchKey: customerCodeList.join(','),
          ),
        ),
      ).thenAnswer(
        (invocation) async => CustomerInformation.empty().copyWith(
          soldToInformation: [
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
          ],
        ),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(customerCodeList.join(',')),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.soldToInformation.length, 3));
    });

    test(
        'Get all Customer Code from remote data source successfully for sales rep test',
        () async {
      final customerCodeList = [''];
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: hideCustomer,
            after: offset,
            searchKey: customerCodeList.join(','),
          ),
        ),
      ).thenAnswer(
        (invocation) async => CustomerInformation.empty().copyWith(
          soldToInformation: [
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
          ],
        ),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(customerCodeList.join(',')),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.soldToInformation.length, 3));
    });

    test(
        'Get Customer Code from remote data source successfully for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      final customerCodeList = [
        mockCustomerCode,
        '${mockCustomerCode}1',
        '${mockCustomerCode}2',
      ];

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          searchKey: customerCodeList.join(','),
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
          market: fakeMarket,
        ),
      ).thenAnswer(
        (invocation) async => CustomerInformation.empty().copyWith(
          soldToInformation: [
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
          ],
        ),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(customerCodeList.join(',')),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.soldToInformation.length, 3));
    });

    test(
        'Get all Customer Code from remote data source successfully for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      final customerCodeList = [''];

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          searchKey: customerCodeList.join(','),
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
          market: fakeMarket,
        ),
      ).thenAnswer(
        (invocation) async => CustomerInformation.empty().copyWith(
          soldToInformation: [
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
            CustomerCodeInfo.empty(),
          ],
        ),
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(customerCodeList.join(',')),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.soldToInformation.length, 3));
    });

    test('Get customer code from account storage successfully test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      final result = await customerCodeRepository.getCustomerCodeStorage();

      expect(result.isRight(), true);
    });

    test('Get customer code from account storage failed test', () async {
      when(() => accountSelectorStorageMock.get()).thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCodeStorage();

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('Store customer code in account storage successfully test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenAnswer((invocation) async {
        return;
      });

      final result = await customerCodeRepository.storeCustomerInfo(
        customerCode: mockCustomerCode,
        shippingAddress: 'mockShippingAddress',
      );

      expect(result.isRight(), true);
    });

    test('Store customer code in account storage failure test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenThrow(fakeException);

      final result = await customerCodeRepository.storeCustomerInfo(
        customerCode: mockCustomerCode,
        shippingAddress: 'mockShippingAddress',
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test(
        'Get Customer Code from remote data source failed for sales rep test for single customer code',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: hideCustomer,
            after: offset,
            searchKey: mockCustomerCode,
          ),
        ),
      ).thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        searchKey: SearchKey.search(mockCustomerCode),
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('Get Customer Code Config from local data source successful',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => customerCodeLocalDataSourceMock.getCustomerCodeConfig(),
      ).thenAnswer(
        (invocation) async => customerCodeConfig,
      );

      final result = await customerCodeRepository.getCustomerCodeConfig(
        customerCodeInfo: fakeCustomerCodeInfo,
      );

      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => CustomerCodeConfig.empty()),
        customerCodeConfig,
      );
    });

    test('Get Customer Code Config from local data source fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => customerCodeLocalDataSourceMock.getCustomerCodeConfig(),
      ).thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCodeConfig(
        customerCodeInfo: fakeCustomerCodeInfo,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('Get Customer Code Config from Remote data source successful ',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeConfig(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => customerCodeConfig,
      );

      final result = await customerCodeRepository.getCustomerCodeConfig(
        customerCodeInfo: fakeCustomerCodeInfo,
      );

      expect(result.isRight(), true);
      expect(
        result.getOrElse(() => CustomerCodeConfig.empty()),
        customerCodeConfig,
      );
    });

    test('Get Customer Code Config from local data source fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeConfig(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenThrow(fakeException);

      final result = await customerCodeRepository.getCustomerCodeConfig(
        customerCodeInfo: fakeCustomerCodeInfo,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
  });
}
