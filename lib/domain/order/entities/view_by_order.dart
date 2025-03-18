import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order.freezed.dart';

@freezed
class ViewByOrder with _$ViewByOrder {
  const ViewByOrder._();
  factory ViewByOrder({
    required int orderCount,
    required List<String> creatingOrderIds,
    required List<OrderHistoryDetails> orderHeaders,
  }) = _ViewByOrder;

  factory ViewByOrder.empty() => ViewByOrder(
        creatingOrderIds: [],
        orderCount: 0,
        orderHeaders: <OrderHistoryDetails>[],
      );
}
