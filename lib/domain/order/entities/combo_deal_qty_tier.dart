import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_qty_tier.freezed.dart';

@freezed
class ComboDealQtyTier with _$ComboDealQtyTier {
  const ComboDealQtyTier._();

  const factory ComboDealQtyTier({
    required double rate,
    required String conditionNumber,
    required int minQty,
    required DiscountType type,
    required ComboSuffix suffix,
  }) = _ComboDealQtyTier;

  factory ComboDealQtyTier.empty() => ComboDealQtyTier(
        rate: 0,
        conditionNumber: '',
        minQty: 0,
        type: DiscountType(''),
        suffix: ComboSuffix(''),
      );

  DiscountInfo get discountInfo => DiscountInfo(
        type: type,
        rate: rate,
        minQty: minQty,
      );
}
