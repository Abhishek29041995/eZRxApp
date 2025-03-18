import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_rule.freezed.dart';

@freezed
class PriceRule with _$PriceRule {
  const PriceRule._();
  const factory PriceRule({
    required String type,
    required double rate,
    required String condition,
    required TieredRules tieredRules,
    required String conditionNumber,
    required String overriddenBy,
    required String maxQuota,
    required String remainingQuota,
    required bool bonusEligible,
  }) = _PriceRule;

  factory PriceRule.empty() => PriceRule(
        type: '',
        rate: 0,
        condition: '',
        tieredRules: TieredRules.empty(),
        conditionNumber: '',
        overriddenBy: '',
        maxQuota: '',
        remainingQuota: '',
        bonusEligible: false,
      );
}

@freezed
class TieredRules with _$TieredRules {
  // const TieredRules._();
  const factory TieredRules({
    required String tier,
    required List<RuleTier> ruleTier,
  }) = _TieredRules;

  factory TieredRules.empty() => const TieredRules(
        tier: '',
        ruleTier: [],
      );
}

@freezed
class RuleTier with _$RuleTier {
  // const RuleTier._();
  const factory RuleTier({
    required double rate,
    required double quantity,
  }) = _RuleTier;

  factory RuleTier.empty() => const RuleTier(
        rate: 0,
        quantity: 0,
      );
}
