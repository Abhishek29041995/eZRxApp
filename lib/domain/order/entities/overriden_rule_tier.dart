import 'package:freezed_annotation/freezed_annotation.dart';

part 'overriden_rule_tier.freezed.dart';

@freezed
class OverridenRuleTier with _$OverridenRuleTier {
  const OverridenRuleTier._();
  const factory OverridenRuleTier({
    required double rate,
    required double quantity,
    required String conditions,
    required String tier,
    required String overrider,
  }) = _OverridenRuleTier;

  factory OverridenRuleTier.empty() => const OverridenRuleTier(
        rate: 0,
        quantity: 0,
        conditions: '',
        tier: '',
        overrider: '',
      );
}
