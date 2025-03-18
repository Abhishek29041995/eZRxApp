import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_bonus.freezed.dart';

@freezed
class MaterialItemBonus with _$MaterialItemBonus {
  const MaterialItemBonus._();

  const factory MaterialItemBonus({
    required MaterialInfo materialInfo,
    required int qty,
    required String comment,
    required String materialDescription,
    required DateTimeStringValue expiryDate,
    required String inStock,
    required int remainingQty,
    required bool additionalBonusFlag,
    required bool bonusOverrideFlag,
  }) = _MaterialItemBonus;

  factory MaterialItemBonus.empty() => MaterialItemBonus(
        materialInfo:
            MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('')),
        qty: 0,
        comment: '',
        materialDescription: '',
        expiryDate: DateTimeStringValue(''),
        inStock: '',
        remainingQty: 0,
        additionalBonusFlag: false,
        bonusOverrideFlag: false,
      );

  factory MaterialItemBonus.fromBonusMaterial(BonusMaterial bonusMaterial) =>
      MaterialItemBonus.empty().copyWith(
        materialInfo: MaterialInfo.empty()
            .copyWith(materialNumber: bonusMaterial.materialNumber),
        qty: bonusMaterial.bonusQuantity,
        materialDescription: bonusMaterial.materialDescription,
      );
  MaterialNumber get materialNumber => materialInfo.materialNumber;
}
