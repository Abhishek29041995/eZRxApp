import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_sku_tier.freezed.dart';

@freezed
class ComboDealSKUTier with _$ComboDealSKUTier {
  const ComboDealSKUTier._();

  const factory ComboDealSKUTier({
    required double rate,
    required String conditionNumber,
    required int minQty,
    required DiscountType type,
  }) = _ComboDealSKUTier;

  factory ComboDealSKUTier.empty() => ComboDealSKUTier(
        minQty: 0,
        rate: 0,
        type: DiscountType(''),
        conditionNumber: '',
      );

  DiscountInfo get discountInfo => DiscountInfo(
        type: type,
        rate: rate,
        minQty: minQty,
      );
}
