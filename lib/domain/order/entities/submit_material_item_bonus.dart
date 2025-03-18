import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_item_bonus.freezed.dart';

@freezed
class SubmitMaterialItemBonus with _$SubmitMaterialItemBonus {
  factory SubmitMaterialItemBonus({
    required MaterialNumber materialNumber,
    required int qty,
  }) = _SubmitMaterialItemBonus;

  factory SubmitMaterialItemBonus.empty() => SubmitMaterialItemBonus(
        materialNumber: MaterialNumber(''),
        qty: 0,
      );
}
