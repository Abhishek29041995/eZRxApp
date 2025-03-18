import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_remote.dart';

class OrderStatusTrackerRepository implements IOrderStatusTrackerRepository {
  final Config config;
  final OrderStatusTrackerLocalDataSource localDataSource;
  final OrderStatusTrackerRemoteDataSource remoteDataSource;

  OrderStatusTrackerRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<OrderStatusTracker>>> getOrderStatusTracker({
    required StringValue invoiceNumber,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderStatusList = await localDataSource.getOrderStatusTracker();

        return Right(orderStatusList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final orderStatusList = await remoteDataSource.getOrderStatusTracker(
        invoiceNumber: invoiceNumber.getOrCrash(),
      );

      return Right(orderStatusList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
