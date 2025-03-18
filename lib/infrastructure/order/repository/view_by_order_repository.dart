import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_order_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_filter_dto.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

class ViewByOrderRepository implements IViewByOrderRepository {
  final Config config;
  final ViewByOrderLocalDataSource localDataSource;
  final ViewByOrderRemoteDataSource remoteDataSource;
  final DeviceStorage deviceStorage;

  ViewByOrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, ViewByOrder>> getViewByOrders({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required User user,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String sort,
    required SearchKey searchKey,
    required ViewByOrdersFilter viewByOrdersFilter,
    required ViewByOrder viewByOrder,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool isDetailsPage,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.getViewByOrders();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList = await remoteDataSource.getViewByOrders(
        soldTo: soldTo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        language: user.preferredLanguage.languageCode,
        searchKey: searchKey.getOrCrash(),
        orderBy: orderBy,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        filterQuery: ViewByOrdersFilterDto.fromDomain(
          searchKey.isValueEmpty
              ? viewByOrdersFilter
              : viewByOrdersFilter.copyWith(
                  orderDateFrom: DateTimeStringValue(
                    getDateStringByDateTime(DateTime(1900)),
                  ),
                  orderDateTo: DateTimeStringValue(
                    getDateStringByDateTime(DateTime.now()),
                  ),
                ),
        ).toJson(),
        sort: sort,
        shipTo: shipToInfo.shipToCustomerCode,
        isDetailsPage: isDetailsPage,
        market: deviceStorage.currentMarket(),
      );

      final newViewByOrderList = List<OrderHistoryDetails>.from(
        viewByOrder.orderHeaders,
      )..addAll(orderHistoryItemList.orderHeaders);

      return Right(viewByOrder.copyWith(orderHeaders: newViewByOrderList));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
