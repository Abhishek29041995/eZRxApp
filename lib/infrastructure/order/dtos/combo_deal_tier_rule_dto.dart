import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_tier_rule_dto.freezed.dart';
part 'combo_deal_tier_rule_dto.g.dart';

@freezed
class ComboDealTierRuleDto with _$ComboDealTierRuleDto {
  const ComboDealTierRuleDto._();

  const factory ComboDealTierRuleDto({
    @StringToDoubleConverter()
    @JsonKey(name: 'rate', defaultValue: 0)
        required double rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @StringToDoubleConverter()
    @JsonKey(name: 'minTotalAmount', defaultValue: 0)
        required double minTotalAmount,
    @JsonKey(name: 'minTotalCurrency', defaultValue: '')
        required String minTotalCurrency,
    @StringToDoubleConverter()
    @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
        required double maxTotalAmount,
    @JsonKey(name: 'maxTotalCurrency', defaultValue: '')
        required String maxTotalCurrency,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @StringToIntConverter()
    @JsonKey(name: 'minQty', defaultValue: 0)
        required int minQty,
  }) = _ComboDealTierRuleDto;

  factory ComboDealTierRuleDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealTierRuleDtoFromJson(json);

  ComboDealTierRule get toDomain => ComboDealTierRule(
        rate: rate,
        conditionNumber: conditionNumber,
        minTotalAmount: minTotalAmount,
        minTotalCurrency: minTotalCurrency,
        maxTotalAmount: maxTotalAmount,
        maxTotalCurrency: maxTotalCurrency,
        type: DiscountType(type),
        minQty: minQty,
      );

  factory ComboDealTierRuleDto.fromDomain(ComboDealTierRule domain) =>
      ComboDealTierRuleDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        type: domain.type.getOrDefaultValue(''),
        maxTotalAmount: domain.maxTotalAmount,
        maxTotalCurrency: domain.maxTotalCurrency,
        minTotalAmount: domain.minTotalAmount,
        minTotalCurrency: domain.minTotalCurrency,
        minQty: domain.minQty,
      );
}
