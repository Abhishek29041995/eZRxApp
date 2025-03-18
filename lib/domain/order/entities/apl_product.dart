import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/order/entities/apl_promotions.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_product.freezed.dart';

@freezed
class AplProduct with _$AplProduct {
  const AplProduct._();

  const factory AplProduct({
    required MaterialInfoType type,
    required String itemNumber,
    required String parentItemNumber,
    required MaterialNumber materialNumber,
    required MaterialPrice finalPriceTotal,
    required MaterialPrice finalPrice,
    required MaterialQty productQty,
    required double tax,
    required List<AplPromotions> aplPromotions,
  }) = _AplProduct;

  factory AplProduct.empty() => AplProduct(
        type: MaterialInfoType(''),
        itemNumber: '',
        parentItemNumber: '',
        materialNumber: MaterialNumber(''),
        finalPrice: MaterialPrice(0),
        finalPriceTotal: MaterialPrice(0),
        productQty: MaterialQty(0),
        tax: 0,
        aplPromotions: [],
      );

  PriceAggregate toPriceAggregate(
    PriceAggregate cartItemDetails,
  ) =>
      cartItemDetails.copyWith(
        price: cartItemDetails.price
            .copyWith(finalPrice: finalPrice, finalTotalPrice: finalPriceTotal),
        quantity: productQty.intValue,
        materialInfo: cartItemDetails.materialInfo.copyWith(tax: tax),
      );

  BonusSampleItem toMaterialItemBonus(BonusSampleItem cartItemBonus) =>
      cartItemBonus.copyWith(
        qty: productQty,
      );

  List<TRObject> get promotionValue => aplPromotions
          .where((element) => element.discountValue.abs() > 0)
          .map((element) {
        return element.discountTypeValue.isPercent
            ? TRObject(
                '{discountValue} discount',
                arguments: {'discountValue': '${element.discountValue.abs()}%'},
              )
            : TRObject(
                '${element.discountTypeValue.getValue()} ${element.discountValue.abs()}',
              );
      }).toList();

  
}
  