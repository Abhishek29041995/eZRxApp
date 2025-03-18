import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

part 'submit_material_item_bonus_dto.freezed.dart';
part 'submit_material_item_bonus_dto.g.dart';

@freezed
class SubmitMaterialItemBonusDto with _$SubmitMaterialItemBonusDto {
  const SubmitMaterialItemBonusDto._();

  factory SubmitMaterialItemBonusDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
  }) = _SubmitMaterialItemBonusDto;

  factory SubmitMaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitMaterialItemBonusDtoFromJson(json);

  factory SubmitMaterialItemBonusDto.fromBonusOvveride(
    BonusSampleItem bonus,
  ) {
    return SubmitMaterialItemBonusDto(
      materialNumber: bonus.materialNumber.getOrDefaultValue(''),
      qty: bonus.qty.getOrCrash(),
    );
  }

  factory SubmitMaterialItemBonusDto.fromDomain(
    SubmitMaterialItemBonus bonus,
  ) {
    return SubmitMaterialItemBonusDto(
      materialNumber: bonus.materialNumber.getOrDefaultValue(''),
      qty: bonus.qty,
    );
  }

  SubmitMaterialItemBonus toDomain() {
    return SubmitMaterialItemBonus(
      materialNumber: MaterialNumber(materialNumber),
      qty: qty,
    );
  }
}
