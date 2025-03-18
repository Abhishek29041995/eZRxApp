import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/overriden_rule_tier.dart';

part 'overriden_rule_tier_dto.freezed.dart';
part 'overriden_rule_tier_dto.g.dart';

@freezed
class OverridenRuleTierDto with _$OverridenRuleTierDto {
  const OverridenRuleTierDto._();

  const factory OverridenRuleTierDto({
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'quantity', defaultValue: 0) required double quantity,
    @JsonKey(name: 'conditions', defaultValue: '') required String conditions,
    @JsonKey(name: 'tier', defaultValue: '') required String tier,
    @JsonKey(name: 'overrider', defaultValue: '') required String overrider,
  }) = _OverridenRuleTierDto;

  OverridenRuleTier toDomain() => OverridenRuleTier(
        rate: rate,
        quantity: quantity,
        conditions: conditions,
        tier: tier,
        overrider: overrider,
      );

  factory OverridenRuleTierDto.fromDomain(OverridenRuleTier overridenRuleTier) {
    return OverridenRuleTierDto(
      rate: overridenRuleTier.rate,
      quantity: overridenRuleTier.quantity,
      conditions: overridenRuleTier.conditions,
      tier: overridenRuleTier.tier,
      overrider: overridenRuleTier.overrider,
    );
  }

  factory OverridenRuleTierDto.fromJson(Map<String, dynamic> json) =>
      _$OverridenRuleTierDtoFromJson(json);
}
