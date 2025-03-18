import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_material.freezed.dart';

@freezed
class ComboDealMaterialSet with _$ComboDealMaterialSet {
  const ComboDealMaterialSet._();

  const factory ComboDealMaterialSet({
    required String setNo,
    required List<ComboDealMaterial> materials,
  }) = _ComboDealMaterialSet;

  List<MaterialNumber> get materialNumbers =>
      materials.map((e) => e.materialNumber).toList();

  factory ComboDealMaterialSet.empty() => const ComboDealMaterialSet(
        setNo: '',
        materials: <ComboDealMaterial>[],
      );
}

@freezed
class ComboDealMaterial with _$ComboDealMaterial {
  const ComboDealMaterial._();

  const factory ComboDealMaterial({
    required int minQty,
    required MaterialNumber materialNumber,
    required double rate,
    required DiscountType type,
    required String conditionNumber,
    required bool mandatory,
    required ComboSuffix suffix,
  }) = _ComboDealMaterial;

  factory ComboDealMaterial.empty() => ComboDealMaterial(
        minQty: 0,
        materialNumber: MaterialNumber(''),
        rate: 0,
        type: DiscountType(''),
        conditionNumber: '',
        mandatory: false,
        suffix: ComboSuffix(''),
      );

  DiscountInfo get discountInfo => DiscountInfo(
        type: type,
        rate: rate,
        minQty: minQty,
      );
}
