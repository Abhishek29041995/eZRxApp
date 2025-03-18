import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_by_order_request.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_request.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';

import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_by_order_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_request_dto.dart';

class ViewByItemRepository implements IViewByItemRepository {
  final Config config;
  final ViewByItemLocalDataSource viewByItemLocalDataSource;
  final ViewByItemRemoteDataSource viewByItemRemoteDataSource;
  final DeviceStorage deviceStorage;

  ViewByItemRepository({
    required this.config,
    required this.viewByItemLocalDataSource,
    required this.viewByItemRemoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItems({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderHistoryItemsList =
            await viewByItemLocalDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    final applyNoDateFiler =
        searchKey.validateNotEmpty && viewByItemFilter.dateRangeEmpty;

    try {
      final viewByItemsRequest = ViewByItemRequest.empty().copyWith(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCodeSoldTo: soldTo.customerCodeSoldTo,
        shipToCustomerCode: shipTo.shipToCustomerCode,
        language: user.preferredLanguage.languageCode,
        pageSize: pageSize,
        offSet: offset,
        searchKey: searchKey.getOrDefaultValue(''),
        viewByItemFilter: applyNoDateFiler
            ? viewByItemFilter.copyWith(
                orderDateFrom: DateTimeStringValue(
                  getDateStringByDateTime(DateTime(1900)),
                ),
                orderDateTo: DateTimeStringValue(
                  getDateStringByDateTime(DateTime.now()),
                ),
              )
            : viewByItemFilter,
      );
      final orderHistoryItemList =
          await viewByItemRemoteDataSource.getOrderHistory(
        variables:
            ViewByItemRequestDto.fromDomain(viewByItemsRequest).toMapJson(),
        market: deviceStorage.currentMarket(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItemDetails({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required User user,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderHistoryItemsList =
            await viewByItemLocalDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final viewByItemDetailRequest = ViewByItemRequest.empty().copyWith(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCodeSoldTo: soldTo.customerCodeSoldTo,
        language: user.preferredLanguage.languageCode,
        orderNumber: searchKey.getOrCrash(),
        pageSize: 1,
        isDetailsPage: true,
      );

      final orderHistoryItemList =
          await viewByItemRemoteDataSource.getOrderHistory(
        variables: ViewByItemRequestDto.fromDomain(viewByItemDetailRequest)
            .toMapJson(),
        market: deviceStorage.currentMarket(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<StringValue, InvoiceData>>>
      getOrdersInvoiceData({
    required List<OrderNumber> orderNumbers,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ordersInvoiceData =
            await viewByItemLocalDataSource.getInvoiceDataForOrders();

        final invoiceDataMap =
            _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

        return Right(invoiceDataMap);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final queryOrderNumbers = orderNumbers
          .where((e) => e.isValid())
          .map((e) => e.getOrCrash())
          .toList();

      final ordersInvoiceData = await viewByItemRemoteDataSource
          .getInvoiceDataForOrders(orderNumbers: queryOrderNumbers);

      final invoiceDataMap =
          _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

      return Right(invoiceDataMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, InvoiceDetailResponse>> getInvoiceDetailsForOrder({
    required OrderNumber orderNumber,
    required CustomerCodeInfo customerCodeInfo,
    required Language language,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final invoiceList =
            await viewByItemLocalDataSource.getInvoiceDetailsForOrder();

        return Right(invoiceList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final invoiceByOrderRequest = InvoiceByOrderRequest(
        customerCodeSoldTo: customerCodeInfo.customerCodeSoldTo,
        language: language.languageCode,
        orderNumber: orderNumber.getOrDefaultValue(''),
        pageSize: config.pageSize,
        offSet: offset,
      );

      final invoiceList =
          await viewByItemRemoteDataSource.getInvoiceDetailsForOrder(
        invoicesByOrderRequest:
            InvoiceByOrderRequestDto.fromDomain(invoiceByOrderRequest)
                .toMapJson(),
      );

      return Right(invoiceList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Map<StringValue, InvoiceData> _getInvoiceMapData({
    required List<InvoiceData> ordersInvoiceData,
  }) {
    return ordersInvoiceData.fold<Map<StringValue, InvoiceData>>(
      <StringValue, InvoiceData>{},
      (map, invoiceData) => map..[invoiceData.hashId] = invoiceData,
    );
  }
}
