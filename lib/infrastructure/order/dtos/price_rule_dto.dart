import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_rule_dto.freezed.dart';
part 'price_rule_dto.g.dart';

@freezed
class PriceRuleDto with _$PriceRuleDto {
  const PriceRuleDto._();

  const factory PriceRuleDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'conditions', defaultValue: '') required String condition,
    @Default(TieredRulesDto.empty)
    @JsonKey(name: 'tieredRules')
        TieredRulesDto tieredRules,
    @JsonKey(name: 'bonusEligible', defaultValue: false)
        required bool bonusEligible,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'overriddenBy', defaultValue: '')
        required String overriddenBy,
    @JsonKey(name: 'maxQuota', defaultValue: '') required String maxQuota,
    @JsonKey(name: 'remainingQuota', defaultValue: '')
        required String remainingQuota,
  }) = _PriceRuleDto;

  factory PriceRuleDto.fromDomain(PriceRule priceRule) {
    return PriceRuleDto(
      type: priceRule.type,
      rate: priceRule.rate,
      condition: priceRule.condition,
      tieredRules: TieredRulesDto.fromDomain(priceRule.tieredRules),
      bonusEligible: priceRule.bonusEligible,
      conditionNumber: priceRule.conditionNumber,
      overriddenBy: priceRule.overriddenBy,
      maxQuota: priceRule.maxQuota,
      remainingQuota: priceRule.remainingQuota,
    );
  }

  PriceRule toDomain() => PriceRule(
        type: type,
        rate: rate,
        condition: condition,
        tieredRules: tieredRules.toDomain(),
        bonusEligible: bonusEligible,
        conditionNumber: conditionNumber,
        overriddenBy: overriddenBy,
        maxQuota: maxQuota,
        remainingQuota: remainingQuota,
      );

  factory PriceRuleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceRuleDtoFromJson(json);
}

@freezed
class TieredRulesDto with _$TieredRulesDto {
  const TieredRulesDto._();

  const factory TieredRulesDto({
    @JsonKey(name: 'tier', defaultValue: '') required String tier,
    @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
        required List<RuleTierDto> ruleTier,
  }) = _TieredRulesDto;

  factory TieredRulesDto.fromDomain(TieredRules tieredRules) {
    return TieredRulesDto(
      tier: tieredRules.tier,
      ruleTier:
          tieredRules.ruleTier.map((e) => RuleTierDto.fromDomain(e)).toList(),
    );
  }

  TieredRules toDomain() => TieredRules(
        tier: tier,
        ruleTier: ruleTier.map((e) => e.toDomain()).toList(),
      );

  static const empty = TieredRulesDto(
    tier: '',
    ruleTier: [],
  );

  factory TieredRulesDto.fromJson(Map<String, dynamic> json) =>
      _$TieredRulesDtoFromJson(json);
}

@freezed
class RuleTierDto with _$RuleTierDto {
  const RuleTierDto._();

  const factory RuleTierDto({
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'quantity', defaultValue: 0) required double quantity,
  }) = _RuleTierDto;

  factory RuleTierDto.fromDomain(RuleTier ruleTier) {
    return RuleTierDto(
      rate: ruleTier.rate,
      quantity: ruleTier.quantity,
    );
  }

  RuleTier toDomain() => RuleTier(
        rate: rate,
        quantity: quantity,
      );

  factory RuleTierDto.fromJson(Map<String, dynamic> json) =>
      _$RuleTierDtoFromJson(json);
}
