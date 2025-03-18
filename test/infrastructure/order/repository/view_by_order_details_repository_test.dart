import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryDetailsLocalDataSourceMock extends Mock
    implements ViewByOrderDetailsLocalDataSource {}

class OrderHistoryDetailsRemoteDataSourceMock extends Mock
    implements ViewByOrderDetailsRemoteDataSource {}

void main() {
  late ViewByOrderDetailsRepository orderHistoryDetailsRepository;
  late Config mockConfig;
  late ViewByOrderDetailsLocalDataSource orderHistoryDetailsLocalDataSource;
  late ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  late CustomerCodeInfo customerCodeInfo;
  late SalesOrganisation salesOrganisation;
  late DeviceStorage deviceStorage;
  const fakeMarket = 'fake-market';

  final orderHistoryDetailsMockList = OrderHistoryDetails.empty();

  final mockUser = User.empty().copyWith(
    preferredLanguage: Language.english(),
  );

  final mockOrderHistoryItem = OrderHistoryDetails.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    orderHistoryDetailsLocalDataSource =
        OrderHistoryDetailsLocalDataSourceMock();
    orderHistoryDetailsRemoteDataSource =
        OrderHistoryDetailsRemoteDataSourceMock();
    deviceStorage = DeviceStorageMock();

    orderHistoryDetailsRepository = ViewByOrderDetailsRepository(
      config: mockConfig,
      localDataSource: orderHistoryDetailsLocalDataSource,
      orderHistoryDetailsRemoteDataSource: orderHistoryDetailsRemoteDataSource,
      deviceStorage: deviceStorage,
    );
    customerCodeInfo =
        CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030082707');
    salesOrganisation =
        SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001'));
  });

  group('OrderHistoryDetailsRepository should - ', () {
    test('get OrderHistoryDetails successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails(),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory Details fail locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails(),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get OrderHistoryDetails successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails())
          .thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get OrderHistory fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails())
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );

      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistoryDetails successfully remotely for salesrep',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '0200268014',
          language: 'EN',
          salesOrg: '2001',
          soldTo: '0030082707',
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarket,
        ),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: OrderNumber('0200268014'),
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          username: Username('user_test'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistoryDetails fail remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '',
          language: '',
          salesOrg: '',
          soldTo: '',
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarket,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistoryDetails successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '0200268014',
          language: 'EN',
          salesOrg: '2001',
          soldTo: '0030082707',
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarket,
        ),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: OrderNumber('0200268014'),
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistoryDetails fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: mockOrderHistoryItem.orderNumber.getOrDefaultValue(''),
          language: '',
          salesOrg: '',
          soldTo: '',
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarket,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
