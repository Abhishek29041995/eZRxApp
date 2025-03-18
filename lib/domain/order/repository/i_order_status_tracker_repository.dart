import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';

abstract class IOrderStatusTrackerRepository {
  Future<Either<ApiFailure, List<OrderStatusTracker>>> getOrderStatusTracker({
    required StringValue invoiceNumber,
  });
}
