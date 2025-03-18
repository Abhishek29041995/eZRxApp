import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_material_dto.freezed.dart';
part 'combo_deal_material_dto.g.dart';

@freezed
class ComboDealMaterialSetDto with _$ComboDealMaterialSetDto {
  const ComboDealMaterialSetDto._();

  const factory ComboDealMaterialSetDto({
    @JsonKey(name: 'setNo', defaultValue: '') required String setNo,
    @JsonKey(name: 'materials', defaultValue: [])
    required List<ComboDealMaterialDto> materials,
  }) = _ComboDealMaterialSetDto;

  factory ComboDealMaterialSetDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealMaterialSetDtoFromJson(json);

  ComboDealMaterialSet get toDomain => ComboDealMaterialSet(
        setNo: setNo,
        materials: materials.map((e) => e.toDomain).toList(),
      );

  factory ComboDealMaterialSetDto.fromDomain(ComboDealMaterialSet domain) =>
      ComboDealMaterialSetDto(
        materials: domain.materials
            .map(
              (e) => ComboDealMaterialDto.fromDomain(e),
            )
            .toList(),
        setNo: domain.setNo,
      );
}

@freezed
class ComboDealMaterialDto with _$ComboDealMaterialDto {
  const ComboDealMaterialDto._();

  const factory ComboDealMaterialDto({
    @StringToIntConverter()
    @JsonKey(
      name: 'minQty',
      defaultValue: 0,
      readValue: JsonReadValueHelper.handleMinQty,
    )
    required int minQty,
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @StringToDoubleConverter()
    @JsonKey(name: 'rate', defaultValue: 0)
    required double rate,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
    required String conditionNumber,
    @JsonKey(name: 'mandatory', defaultValue: false) required bool mandatory,
    @JsonKey(name: 'suffix', defaultValue: '') required String suffix,
  }) = _ComboDealMaterialDto;

  factory ComboDealMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealMaterialDtoFromJson(json);

  ComboDealMaterial get toDomain => ComboDealMaterial(
        minQty: minQty,
        materialNumber: MaterialNumber(materialNumber),
        rate: rate,
        type: DiscountType(type),
        conditionNumber: conditionNumber,
        mandatory: mandatory,
        suffix: ComboSuffix(suffix),
      );

  factory ComboDealMaterialDto.fromDomain(ComboDealMaterial domain) =>
      ComboDealMaterialDto(
        minQty: domain.minQty,
        materialNumber: domain.materialNumber.getOrDefaultValue(''),
        rate: domain.rate,
        type: domain.type.getOrDefaultValue(''),
        conditionNumber: domain.conditionNumber,
        mandatory: domain.mandatory,
        suffix: domain.suffix.stringValue,
      );
}
