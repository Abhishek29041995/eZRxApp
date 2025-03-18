import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus.freezed.dart';

@freezed
class PriceBonus with _$PriceBonus {
  const PriceBonus._();
  const factory PriceBonus({
    required List<PriceBonusItem> items,
  }) = _PriceBonus;

  factory PriceBonus.empty() => const PriceBonus(
        items: [],
      );
}

@freezed
class PriceBonusItem with _$PriceBonusItem {
  const PriceBonusItem._();
  const factory PriceBonusItem({
    required BonusMaterialCalculation calculation,
    required int qualifyingQuantity,
    required List<BonusMaterial> bonusMaterials,
  }) = _PriceBonusItem;

  factory PriceBonusItem.empty() => PriceBonusItem(
        calculation: BonusMaterialCalculation(''),
        qualifyingQuantity: 0,
        bonusMaterials: [],
      );
}

@freezed
class BonusMaterial with _$BonusMaterial {
  const BonusMaterial._();
  const factory BonusMaterial({
    required int id,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required BonusMaterialCalculation calculation,
    required int bonusRatio,
    required int qualifyingQuantity,
    required int bonusQuantity,
    required int limitPerTransaction,
    required String conditionId,
    required MaterialCode oldMaterialCode,
  }) = _BonusMaterial;

  factory BonusMaterial.empty() => BonusMaterial(
        id: 0,
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        calculation: BonusMaterialCalculation(''),
        bonusRatio: 0,
        qualifyingQuantity: 0,
        bonusQuantity: 0,
        limitPerTransaction: 0,
        conditionId: '',
        oldMaterialCode: MaterialCode(''),
      );
}

enum BonusMaterialCalculationEnum {
  calculation915,
  calculation914,
  calculation913,
  calculation912,
  calculation911,
  apl001,
  apl002,
}
