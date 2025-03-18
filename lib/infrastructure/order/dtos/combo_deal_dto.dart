import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_amount_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_group_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_qty_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_sku_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_tier_rule_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_dto.freezed.dart';
part 'combo_deal_dto.g.dart';

@freezed
class ComboDealDto with _$ComboDealDto {
  const ComboDealDto._();

  const factory ComboDealDto({
    @Default(ComboDealGroupDealDto.empty)
    @JsonKey(name: 'groupDeal')
        ComboDealGroupDealDto groupDeal,
    @JsonKey(name: 'flexiSKUTier', defaultValue: [])
        required List<ComboDealSKUTierDto> flexiSKUTier,
    @JsonKey(name: 'flexiQtyTier', defaultValue: [])
        required List<ComboDealQtyTierDto> flexiQtyTier,
    @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
        required List<ComboDealAmountTierDto> flexiAmountTier,
    @JsonKey(name: 'materialComboDeals', defaultValue: [])
        required List<ComboDealMaterialSetDto> materialComboDeals,
    @JsonKey(name: 'flexiTierRule', defaultValue: [])
        required List<ComboDealTierRuleDto> flexiTierRule,
  }) = _ComboDealDto;

  factory ComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealDtoFromJson(json);

  ComboDeal get toDomain => ComboDeal(
        groupDeal: groupDeal.toDomain,
        flexiSKUTier: flexiSKUTier.map((e) => e.toDomain).toList(),
        flexiQtyTier: flexiQtyTier.map((e) => e.toDomain).toList(),
        flexiAmountTier: flexiAmountTier.map((e) => e.toDomain).toList(),
        materialComboDeals: materialComboDeals.map((e) => e.toDomain).toList(),
        flexiTierRule: flexiTierRule.map((e) => e.toDomain).toList(),
      );

  factory ComboDealDto.fromDomain(ComboDeal domain) => ComboDealDto(
        groupDeal: ComboDealGroupDealDto.fromDomain(domain.groupDeal),
        flexiSKUTier: domain.flexiSKUTier
            .map(
              (e) => ComboDealSKUTierDto.fromDomain(e),
            )
            .toList(),
        flexiQtyTier: domain.flexiQtyTier
            .map(
              (e) => ComboDealQtyTierDto.fromDomain(e),
            )
            .toList(),
        flexiAmountTier: domain.flexiAmountTier
            .map(
              (e) => ComboDealAmountTierDto.fromDomain(e),
            )
            .toList(),
        materialComboDeals: domain.materialComboDeals
            .map(
              (e) => ComboDealMaterialSetDto.fromDomain(e),
            )
            .toList(),
        flexiTierRule: domain.flexiTierRule
            .map(
              (e) => ComboDealTierRuleDto.fromDomain(e),
            )
            .toList(),
      );

  static const empty = ComboDealDto(
    flexiSKUTier: [],
    flexiQtyTier: [],
    flexiAmountTier: [],
    materialComboDeals: [],
    flexiTierRule: [],
  );
}
