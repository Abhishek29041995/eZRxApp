import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 're_order_permission.freezed.dart';

@freezed
class ReOrderPermission with _$ReOrderPermission {
  factory ReOrderPermission({
    required List<ValidMaterial> validMaterials,
  }) = _ReOrderPermission;

  factory ReOrderPermission.empty() => ReOrderPermission(
        validMaterials: <ValidMaterial>[],
      );
}

@freezed
class ValidMaterial with _$ValidMaterial {
  factory ValidMaterial({
    required bool hidePrice,
    required MaterialNumber materialNumber,
    required bool isValid,
  }) = _ValidMaterial;

  factory ValidMaterial.empty() => ValidMaterial(
        hidePrice: false,
        materialNumber: MaterialNumber(''),
        isValid: false,
      );
}
