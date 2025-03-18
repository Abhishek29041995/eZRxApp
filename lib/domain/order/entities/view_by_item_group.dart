import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_group.freezed.dart';

@freezed
class ViewByItemGroup with _$ViewByItemGroup {
  factory ViewByItemGroup({
    required DateTimeStringValue createdDate,
    required PrincipalName manufactureName,
    required List<OrderHistoryItem> orderHistoryItem,
  }) = _ViewByItemGroup;

  factory ViewByItemGroup.empty() => ViewByItemGroup(
        createdDate: DateTimeStringValue(''),
        orderHistoryItem: <OrderHistoryItem>[],
        manufactureName: PrincipalName(''),
      );
}
