import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_tier_rule.freezed.dart';

@freezed
class ComboDealTierRule with _$ComboDealTierRule {
  const ComboDealTierRule._();

  const factory ComboDealTierRule({
    required double rate,
    required String conditionNumber,
    required double minTotalAmount,
    required String minTotalCurrency,
    required double maxTotalAmount,
    required String maxTotalCurrency,
    required DiscountType type,
    required int minQty,
  }) = _ComboDealTierRule;

  factory ComboDealTierRule.empty() => ComboDealTierRule(
        rate: 0,
        conditionNumber: '',
        minTotalAmount: 0,
        minTotalCurrency: '',
        maxTotalAmount: 0,
        maxTotalCurrency: '',
        type: DiscountType(''),
        minQty: 0,
      );

  DiscountInfo get discountInfo => DiscountInfo(
        type: type,
        rate: rate,
        minQty: minQty,
      );
}
