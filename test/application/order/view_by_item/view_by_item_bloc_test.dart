import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ViewByItemRepository viewByItemRepositoryMock;
  late OrderHistory orderHistoryMock;
  late List<OrderNumber> orderNumbersMock;
  late Map<StringValue, InvoiceData> invoiceMapDataMock;
  late List<OrderHistoryItem> orderHistoryItemsListMock;
  final config = Config()..appFlavor = Flavor.mock;
  final fakeShipToInfo = fakeCustomerCodeInfo.shipToInfos.first;
  final searchKey = SearchKey.empty();
  final viewByItemFilter = ViewByItemFilter.empty();

  const offSet = 0;
  group('Orders View By Item', () {
    Map<StringValue, InvoiceData> getInvoiceMapData({
      required List<InvoiceData> ordersInvoiceData,
    }) {
      return ordersInvoiceData.fold<Map<StringValue, InvoiceData>>(
        <StringValue, InvoiceData>{},
        (map, invoiceData) => map..[invoiceData.hashId] = invoiceData,
      );
    }

    setUp(() async {
      viewByItemRepositoryMock = ViewByItemRepositoryMock();
      orderHistoryMock = await ViewByItemLocalDataSource().getViewByItems();
      orderNumbersMock =
          orderHistoryMock.orderHistoryItems.map((e) => e.orderNumber).toList();
      final invoiceDataMock =
          await ViewByItemLocalDataSource().getInvoiceDataForOrders();
      invoiceMapDataMock =
          getInvoiceMapData(ordersInvoiceData: invoiceDataMock);
      invoiceMapDataMock.remove(OrderNumber('0200261763'));
      orderHistoryItemsListMock = List<OrderHistoryItem>.from(
        orderHistoryMock.orderHistoryItems,
      )
          .map(
            (orderItem) => orderItem.copyWith(
              invoiceNumber:
                  invoiceMapDataMock[orderItem.hashId]?.invoiceNumber ??
                      orderItem.invoiceNumber,
            ),
          )
          .toList();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item init happy case',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => viewByItemRepositoryMock.getViewByItems(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            soldTo: fakeCustomerCodeInfo,
            shipTo: fakeShipToInfo,
            user: fakeClient,
            pageSize: config.pageSize,
            offset: offSet,
            searchKey: searchKey,
            viewByItemFilter: viewByItemFilter,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            orderHistoryMock,
          ),
        );
        when(
          () => viewByItemRepositoryMock.getOrdersInvoiceData(
            orderNumbers: orderNumbersMock,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            invoiceMapDataMock,
          ),
        );
      },
      act: (ViewByItemsBloc bloc) => bloc.add(
        ViewByItemsEvent.initialized(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClient,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ViewByItemsState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
          isFetching: true,
          nextPageIndex: 0,
          searchKey: searchKey,
          appliedFilter: viewByItemFilter,
        ),
        ViewByItemsState.initial().copyWith(
          orderHistory: orderHistoryMock,
          failureOrSuccessOption: optionOf(
            Right(orderHistoryMock),
          ),
          canLoadMore:
              orderHistoryMock.orderHistoryItems.length >= config.pageSize,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryMock,
          canLoadMore:
              orderHistoryMock.orderHistoryItems.length >= config.pageSize,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ViewByItemsState.initial().copyWith(
          orderHistory: orderHistoryMock.copyWith(
            orderHistoryItems: orderHistoryItemsListMock,
          ),
          canLoadMore:
              orderHistoryMock.orderHistoryItems.length >= config.pageSize,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );

    blocTest(
      'Orders view by item fetch fail',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepositoryMock,
        config: config,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClient,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      setUp: () {
        when(
          () => viewByItemRepositoryMock.getViewByItems(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            soldTo: fakeCustomerCodeInfo,
            shipTo: fakeShipToInfo,
            user: fakeClient,
            pageSize: config.pageSize,
            offset: offSet,
            searchKey: searchKey,
            viewByItemFilter: viewByItemFilter,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ViewByItemsBloc bloc) => bloc.add(
        ViewByItemsEvent.fetch(
          viewByItemFilter: viewByItemFilter,
          searchKey: searchKey,
        ),
      ),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
          isFetching: true,
          searchKey: searchKey,
          appliedFilter: viewByItemFilter,
        ),
        ViewByItemsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
          searchKey: searchKey,
          appliedFilter: viewByItemFilter,
        ),
      ],
    );

    blocTest(
      'Fetch order invoice data fail',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepositoryMock,
        config: config,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        orderHistory: orderHistoryMock,
        failureOrSuccessOption: optionOf(
          Right(orderHistoryMock),
        ),
        canLoadMore:
            orderHistoryMock.orderHistoryItems.length >= config.pageSize,
        nextPageIndex: 1,
        appliedFilter: viewByItemFilter,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClient,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      setUp: () {
        when(
          () => viewByItemRepositoryMock.getOrdersInvoiceData(
            orderNumbers: orderNumbersMock,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ViewByItemsBloc bloc) => bloc.add(
        ViewByItemsEvent.fetchOrdersInvoiceData(
          orderHistoryItems: orderHistoryItemsListMock,
        ),
      ),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryMock,
          canLoadMore:
              orderHistoryMock.orderHistoryItems.length >= config.pageSize,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ViewByItemsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          orderHistory: orderHistoryMock,
          canLoadMore:
              orderHistoryMock.orderHistoryItems.length >= config.pageSize,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item loadMore success',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepositoryMock,
        config: config,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        orderHistory: orderHistoryMock.copyWith(
          orderHistoryItems: orderHistoryItemsListMock,
        ),
        canLoadMore: true,
        nextPageIndex: 1,
        appliedFilter: viewByItemFilter,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClient,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      setUp: () {
        when(
          () => viewByItemRepositoryMock.getViewByItems(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            soldTo: fakeCustomerCodeInfo,
            shipTo: fakeShipToInfo,
            user: fakeClient,
            pageSize: config.pageSize,
            offset: orderHistoryItemsListMock.length,
            searchKey: searchKey,
            viewByItemFilter: viewByItemFilter,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            orderHistoryMock,
          ),
        );
        when(
          () => viewByItemRepositoryMock.getOrdersInvoiceData(
            orderNumbers: orderNumbersMock,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            invoiceMapDataMock,
          ),
        );
      },
      act: (bloc) {
        bloc.add(
          const ViewByItemsEvent.loadMore(),
        );
      },
      expect: () {
        final newOrderHistoryList = List<OrderHistoryItem>.from(
          orderHistoryItemsListMock,
        )..addAll(orderHistoryMock.orderHistoryItems);
        final newOrderHistoryItemsListMock = List<OrderHistoryItem>.from(
          newOrderHistoryList,
        )
            .map(
              (orderItem) => orderItem.copyWith(
                invoiceNumber:
                    invoiceMapDataMock[orderItem.hashId]?.invoiceNumber ??
                        orderItem.invoiceNumber,
              ),
            )
            .toList();
        return [
          ViewByItemsState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            orderHistory: orderHistoryMock.copyWith(
              orderHistoryItems: orderHistoryItemsListMock,
            ),
            canLoadMore: true,
            nextPageIndex: 1,
            appliedFilter: viewByItemFilter,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
          ViewByItemsState.initial().copyWith(
            orderHistory: orderHistoryMock.copyWith(
              orderHistoryItems: newOrderHistoryList,
            ),
            failureOrSuccessOption: optionOf(
              Right(
                orderHistoryMock,
              ),
            ),
            canLoadMore: orderHistoryItemsListMock.length >= config.pageSize,
            nextPageIndex: 2,
            appliedFilter: viewByItemFilter,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
          ViewByItemsState.initial().copyWith(
            isFetchingInvoices: true,
            orderHistory: orderHistoryMock.copyWith(
              orderHistoryItems: newOrderHistoryList,
            ),
            canLoadMore: orderHistoryItemsListMock.length >= config.pageSize,
            nextPageIndex: 2,
            appliedFilter: viewByItemFilter,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
          ViewByItemsState.initial().copyWith(
            orderHistory: orderHistoryMock.copyWith(
              orderHistoryItems: newOrderHistoryItemsListMock,
            ),
            canLoadMore: orderHistoryItemsListMock.length >= config.pageSize,
            nextPageIndex: 2,
            appliedFilter: viewByItemFilter,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ];
      },
    );

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item loadMore failure',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepositoryMock,
        config: config,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        orderHistory: orderHistoryMock.copyWith(
          orderHistoryItems: orderHistoryItemsListMock,
        ),
        canLoadMore: true,
        nextPageIndex: 1,
        appliedFilter: viewByItemFilter,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClient,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      setUp: () {
        when(
          () => viewByItemRepositoryMock.getViewByItems(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            soldTo: fakeCustomerCodeInfo,
            shipTo: fakeShipToInfo,
            user: fakeClient,
            pageSize: config.pageSize,
            offset: orderHistoryItemsListMock.length,
            searchKey: searchKey,
            viewByItemFilter: viewByItemFilter,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) {
        bloc.add(
          const ViewByItemsEvent.loadMore(),
        );
      },
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          orderHistory: orderHistoryMock.copyWith(
            orderHistoryItems: orderHistoryItemsListMock,
          ),
          canLoadMore: true,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ViewByItemsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          orderHistory: orderHistoryMock.copyWith(
            orderHistoryItems: orderHistoryItemsListMock,
          ),
          canLoadMore: true,
          nextPageIndex: 1,
          appliedFilter: viewByItemFilter,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );

    group('Fetch event do nothing', () {
      blocTest<ViewByItemsBloc, ViewByItemsState>(
        'When search key is invalid',
        build: () => ViewByItemsBloc(
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: viewByItemFilter,
            searchKey: SearchKey.search('1'),
          ),
        ),
        expect: () => [],
      );
    });
  });
}
