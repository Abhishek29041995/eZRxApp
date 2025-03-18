import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_params.freezed.dart';

@freezed
class OrderItemParams with _$OrderItemParams {
  const OrderItemParams._();
  factory OrderItemParams({
    required OrderNumber orderNumber,
    required LineNumber lineNumber,
  }) = _OrderItemParams;

  factory OrderItemParams.empty() => OrderItemParams(
        orderNumber: OrderNumber(''),
        lineNumber: LineNumber(''),
      );
}
