import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bonus_aggregate.freezed.dart';

@freezed
class OrderHistoryDetailsBonusAggregate
    with _$OrderHistoryDetailsBonusAggregate {
  const OrderHistoryDetailsBonusAggregate._();

  factory OrderHistoryDetailsBonusAggregate({
    required OrderHistoryDetailsOrderItem orderItem,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsTenderContract tenderContractDetails,
    required List<OrderHistoryDetailsOrderItem> bonusList,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsBonusAggregate.empty() =>
      OrderHistoryDetailsBonusAggregate(
        orderItem: OrderHistoryDetailsOrderItem.empty(),
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails: OrderHistoryDetailsTenderContract.empty(),
        bonusList: <OrderHistoryDetailsOrderItem>[],
      );

  PriceAggregate get toPriceAggregate => PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          materialNumber: orderItem.materialNumber,
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: orderItem.materialNumber,
          materialDescription: orderItem.materialDescription,
          defaultMaterialDescription: orderItem.materialDescription,
        ),
        quantity: orderItem.qty,
        bonusSampleItems: bonusList
            .map(
              (bonus) => BonusSampleItem.empty().copyWith(
                materialNumber: bonus.materialNumber,
                qty: MaterialQty(bonus.qty),
                materialDescription: bonus.materialDescription,
              ),
            )
            .toList(),
        tenderContract: TenderContract.empty().copyWith(
          contractNumber: tenderContractDetails.contractNumber,
          contractReference: StringValue(
            tenderContractDetails.contractReference,
          ),
        ),
      );
}
