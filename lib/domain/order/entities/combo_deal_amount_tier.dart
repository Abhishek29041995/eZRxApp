import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_amount_tier.freezed.dart';

@freezed
class ComboDealAmountTier with _$ComboDealAmountTier {
  const ComboDealAmountTier._();

  const factory ComboDealAmountTier({
    required String rate,
    required String conditionNumber,
    required String minTotalAmount,
    required String minTotalCurrency,
    required String maxTotalAmount,
    required String maxTotalCurrency,
    required String type,
  }) = _ComboDealAmountTier;
}
