import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ViewByOrderLocalDataSourceMock extends Mock
    implements ViewByOrderLocalDataSource {}

class ViewByOrderRemoteDataSourceMock extends Mock
    implements ViewByOrderRemoteDataSource {}

void main() {
  late Config mockConfig;
  late ViewByOrderRepository viewByOrderRepository;
  late ViewByOrderLocalDataSource viewByOrderLocalDataSource;
  late ViewByOrder fakeViewByOrder;
  late ViewByOrderRemoteDataSource viewByOrderRemoteDataSource;
  late DeviceStorage deviceStorage;

  const fakeSort = 'desc';
  const fakeOrderBy = 'datetime';
  final fakeSearchKey = SearchKey.empty();
  final fakeFilter = ViewByOrdersFilter.empty();
  const fakePageSize = 10;
  const fakeOffSet = 0;
  const fakeMarket = 'fake-market';

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockConfig = MockConfig();
    viewByOrderLocalDataSource = ViewByOrderLocalDataSourceMock();
    viewByOrderRemoteDataSource = ViewByOrderRemoteDataSourceMock();
    deviceStorage = DeviceStorageMock();
    viewByOrderRepository = ViewByOrderRepository(
      config: mockConfig,
      localDataSource: viewByOrderLocalDataSource,
      remoteDataSource: viewByOrderRemoteDataSource,
      deviceStorage: deviceStorage,
    );
    fakeViewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
  });

  group('=> get View By Orders Test', () {
    test('=> get locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => viewByOrderLocalDataSource.getViewByOrders())
          .thenThrow((invocation) async => MockException());

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
        isDetailsPage: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> get locally success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => viewByOrderLocalDataSource.getViewByOrders()).thenAnswer(
        (invocation) async => fakeViewByOrder,
      );

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
        isDetailsPage: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> get remotely fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(
        () => viewByOrderRemoteDataSource.getViewByOrders(
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          pageSize: fakePageSize,
          offset: fakeOffSet,
          language: fakeClientUser.preferredLanguage.languageCode,
          searchKey: fakeSearchKey.getOrCrash(),
          orderBy: fakeOrderBy,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          filterQuery: ViewByOrdersFilterDto.fromDomain(fakeFilter).toJson(),
          sort: fakeSort,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          isDetailsPage: false,
          market: fakeMarket,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
        isDetailsPage: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> get remotely success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(
        () => viewByOrderRemoteDataSource.getViewByOrders(
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          pageSize: fakePageSize,
          offset: fakeOffSet,
          language: fakeClientUser.preferredLanguage.languageCode,
          searchKey: fakeSearchKey.getOrCrash(),
          orderBy: fakeOrderBy,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          filterQuery: ViewByOrdersFilterDto.fromDomain(fakeFilter).toJson(),
          sort: fakeSort,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          isDetailsPage: false,
          market: fakeMarket,
        ),
      ).thenAnswer(
        (invocation) async => fakeViewByOrder,
      );

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
        isDetailsPage: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> get remotely success with search ket not empty', () async {
      final searchKey = SearchKey.search('fake-search-key');
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(
        () => viewByOrderRemoteDataSource.getViewByOrders(
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          pageSize: fakePageSize,
          offset: fakeOffSet,
          language: fakeClientUser.preferredLanguage.languageCode,
          searchKey: searchKey.getOrCrash(),
          orderBy: fakeOrderBy,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          filterQuery: ViewByOrdersFilterDto.fromDomain(
            fakeFilter.copyWith(
              orderDateFrom: DateTimeStringValue(
                getDateStringByDateTime(DateTime(1900)),
              ),
              orderDateTo: DateTimeStringValue(
                getDateStringByDateTime(DateTime.now()),
              ),
            ),
          ).toJson(),
          sort: fakeSort,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          isDetailsPage: false,
          market: fakeMarket,
        ),
      ).thenAnswer(
        (invocation) async => fakeViewByOrder,
      );

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: searchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
        isDetailsPage: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
  });
}
