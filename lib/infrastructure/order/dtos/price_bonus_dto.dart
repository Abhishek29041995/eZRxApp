import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus_dto.freezed.dart';
part 'price_bonus_dto.g.dart';

@freezed
class PriceBonusDto with _$PriceBonusDto {
  const PriceBonusDto._();

  const factory PriceBonusDto({
    @JsonKey(name: 'bonusTiers', defaultValue: <PriceBonusItemDto>[])
        required List<PriceBonusItemDto> items,
  }) = _PriceBonusDto;

  factory PriceBonusDto.fromDomain(PriceBonus priceBonus) {
    return PriceBonusDto(
      items:
          priceBonus.items.map((e) => PriceBonusItemDto.fromDomain(e)).toList(),
    );
  }

  PriceBonus toDomain() {
    //this sorting to be handle by BE, so we have the temporary fix here
    final sortedItems = List<PriceBonusItemDto>.from(items);
    sortedItems.sort(
      (a, b) => b.qualifyingQuantity.compareTo(a.qualifyingQuantity),
    );

    return PriceBonus(items: sortedItems.map((e) => e.toDomain()).toList());
  }

  factory PriceBonusDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusDtoFromJson(json);
}

@freezed
class PriceBonusItemDto with _$PriceBonusItemDto {
  const PriceBonusItemDto._();

  const factory PriceBonusItemDto({
    @JsonKey(name: 'calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'qualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'bonusMaterial', defaultValue: <BonusMaterialDto>[])
        required List<BonusMaterialDto> bonusMaterials,
  }) = _PriceBonusItemDto;

  factory PriceBonusItemDto.fromDomain(PriceBonusItem priceBonusItem) {
    return PriceBonusItemDto(
      calculation: priceBonusItem.calculation.getOrDefaultValue(''),
      qualifyingQuantity: priceBonusItem.qualifyingQuantity,
      bonusMaterials: priceBonusItem.bonusMaterials
          .map((e) => BonusMaterialDto.fromDomain(e))
          .toList(),
    );
  }

  PriceBonusItem toDomain() => PriceBonusItem(
        calculation: BonusMaterialCalculation(calculation),
        qualifyingQuantity: qualifyingQuantity,
        bonusMaterials: bonusMaterials.map((e) => e.toDomain()).toList(),
      );

  factory PriceBonusItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusItemDtoFromJson(json);
}

@freezed
class BonusMaterialDto with _$BonusMaterialDto {
  const BonusMaterialDto._();

  const factory BonusMaterialDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'bonusRatio', defaultValue: 0) required int bonusRatio,
    @JsonKey(name: 'qualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'bonusQuantity', defaultValue: 0) required int bonusQuantity,
    @JsonKey(name: 'limitPerTransaction', defaultValue: 0)
        required int limitPerTransaction,
    @JsonKey(name: 'conditionId', defaultValue: '') required String conditionId,
    @JsonKey(name: 'oldMaterialCode', defaultValue: '')
        required String oldMaterialCode,
  }) = _BonusMaterialDto;

  factory BonusMaterialDto.fromDomain(BonusMaterial bonusMaterial) {
    return BonusMaterialDto(
      id: bonusMaterial.id,
      materialNumber: bonusMaterial.materialNumber.getOrDefaultValue(''),
      materialDescription: bonusMaterial.materialDescription,
      calculation: bonusMaterial.calculation.getOrDefaultValue(''),
      bonusRatio: bonusMaterial.bonusRatio,
      qualifyingQuantity: bonusMaterial.qualifyingQuantity,
      bonusQuantity: bonusMaterial.bonusQuantity,
      limitPerTransaction: bonusMaterial.limitPerTransaction,
      conditionId: bonusMaterial.conditionId,
      oldMaterialCode: bonusMaterial.oldMaterialCode.getOrDefaultValue(''),
    );
  }

  BonusMaterial toDomain() => BonusMaterial(
        id: id,
        materialNumber: MaterialNumber(materialNumber),
        materialDescription: materialDescription,
        calculation: BonusMaterialCalculation(calculation),
        bonusRatio: bonusRatio,
        qualifyingQuantity: qualifyingQuantity,
        bonusQuantity: bonusQuantity,
        limitPerTransaction: limitPerTransaction,
        conditionId: conditionId,
        oldMaterialCode: MaterialCode(oldMaterialCode),
      );

  factory BonusMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$BonusMaterialDtoFromJson(json);
}
