import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';

part 'apl_simulator_order.freezed.dart';

@freezed
class AplSimulatorOrder with _$AplSimulatorOrder {
  const AplSimulatorOrder._();

  const factory AplSimulatorOrder({
    required double totalPriceWithoutTax,
    required double smallOrderFee,
    required double grandTotal,
    required double totalTax,
    required double totalDiscountValue,
    required List<AplProduct> aplProducts,
  }) = _AplSimulatorOrder;

  factory AplSimulatorOrder.empty() => const AplSimulatorOrder(
        totalPriceWithoutTax: 0,
        smallOrderFee: 0,
        grandTotal: 0,
        totalTax: 0,
        totalDiscountValue: 0,
        aplProducts: <AplProduct>[],
      );

  double get subTotalPriceInclTax => totalPriceWithoutTax + totalTax;

  List<AplProduct> productDeterminationList(
    List<PriceAggregate> currentCartItems,
  ) {
    final currentMaterialNumbers = currentCartItems.materialNumbers;

    return aplProducts
        .where(
          (e) =>
              e.type.typeMaterial &&
              !currentMaterialNumbers.contains(e.materialNumber),
        )
        .toList();
  }

  List<PriceAggregate> toCartItemList(List<PriceAggregate> currentCartItems) {
    final newCartItems = <String, PriceAggregate>{};

    // Sort the list for looping through all material first to add material into the map first
    // and then when looping through bonus, we can add bonus into "addedBonusList" inside current material
    final sortedAplProducts = [...aplProducts]
      ..sort((a, b) => a.type.typeMaterial ? -1 : 1);

    for (final item in sortedAplProducts) {
      if (item.type.typeMaterial) {
        final cartItem = currentCartItems.firstWhereOrNull(
          (e) => e.getMaterialNumber == item.materialNumber,
        );
        if (cartItem != null) {
          newCartItems.addAll({
            item.itemNumber: item.toPriceAggregate(cartItem),
          });
        }
      } else if (item.type.typeBonus) {
        final cartParentItem =
            newCartItems[item.parentItemNumber] ?? PriceAggregate.empty();

        final updatedCartItem = cartParentItem.copyWith(
          bonusSampleItems: cartParentItem.bonusSampleItems
              .map(
                (e) => e.materialNumber == item.materialNumber
                    ? item.toMaterialItemBonus(e)
                    : e,
              )
              .toList(),
        );

        newCartItems.addAll({
          item.parentItemNumber: updatedCartItem,
        });
      }
    }

    return newCartItems.values.toList();
  }
}
