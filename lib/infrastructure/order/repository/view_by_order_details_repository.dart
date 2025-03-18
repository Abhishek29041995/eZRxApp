import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';

class ViewByOrderDetailsRepository implements IViewByOrderDetailsRepository {
  final Config config;
  final ViewByOrderDetailsLocalDataSource localDataSource;
  final ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  final DeviceStorage deviceStorage;
  ViewByOrderDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
    required this.deviceStorage,
  });
  @override
  Future<Either<ApiFailure, OrderHistoryDetails>> getViewByOrderDetails({
    required User user,
    required OrderNumber orderNumber,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.getOrderHistoryDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final orderHistoryDetailsList =
          await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
        searchKey: orderNumber.getOrCrash(),
        language: user.preferredLanguage.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        soldTo: customerCodeInfo.customerCodeSoldTo,
        shipTo: shipToInfo.shipToCustomerCode,
        market: deviceStorage.currentMarket(),
      );

      return Right(orderHistoryDetailsList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
