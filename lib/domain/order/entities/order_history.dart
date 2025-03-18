import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history.freezed.dart';

@freezed
class OrderHistory with _$OrderHistory {
  const OrderHistory._();
  factory OrderHistory({
    required OrderHistoryBasicInfo orderBasicInformation,
    required List<OrderHistoryItem> orderHistoryItems,
  }) = _OrderHistory;

  factory OrderHistory.empty() => OrderHistory(
        orderBasicInformation: OrderHistoryBasicInfo.empty(),
        orderHistoryItems: <OrderHistoryItem>[],
      );

  OrderHistory filterItemsByOrderId(OrderNumber orderNumber) => copyWith(
        orderHistoryItems: orderHistoryItems
            .where((e) => e.orderNumber == orderNumber)
            .toList(),
      );

  OrderHistoryItem getParentMaterial(OrderHistoryItem bonusMaterial) {
    if (!bonusMaterial.isBonusMaterial || !bonusMaterial.lineNumber.isValid()) {
      return OrderHistoryItem.empty();
    }

    return orderHistoryItems.firstWhere(
      (item) =>
          !item.isBonusMaterial &&
          bonusMaterial.lineNumber.parentIntValue == item.lineNumber.intValue,
      orElse: () => OrderHistoryItem.empty(),
    );
  }

  bool get isCovidMaterialAvailable =>
      orderHistoryItems.any((element) => element.isCovid);

  bool get isTenderContractAvailable => orderHistoryItems.any(
        (element) =>
            element.tenderContractNumber.isContractNumberNotEmpty &&
            element.tenderOrderReason.isNotEmpty,
      );
  bool get isNotValidTenderContract => orderHistoryItems.any(
        (element) =>
            element.tenderContractNumber.isContractNumberNotEmpty &&
            element.isTenderExpired,
      );

  TenderContractReason get getTenderReason => orderHistoryItems
      .firstWhere(
        (element) => element.tenderOrderReason.isNotEmpty,
        orElse: () => OrderHistoryItem.empty(),
      )
      .tenderOrderReason;
}
