import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 're_order_permission_dto.freezed.dart';
part 're_order_permission_dto.g.dart';

@freezed
class ReOrderPermissionDto with _$ReOrderPermissionDto {
  const ReOrderPermissionDto._();
  factory ReOrderPermissionDto({
    @JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
    required List<ValidMaterialDto> validMaterials,
  }) = _ReOrderPermissionDto;

  factory ReOrderPermissionDto.fromJson(Map<String, dynamic> json) =>
      _$ReOrderPermissionDtoFromJson(json);

  ReOrderPermission get toDomain => ReOrderPermission(
        validMaterials: validMaterials.map((e) => e.toDomain).toList(),
      );
}

@freezed
class ValidMaterialDto with _$ValidMaterialDto {
  const ValidMaterialDto._();
  factory ValidMaterialDto({
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'isValid', defaultValue: false) required bool isValid,
  }) = _ValidMaterialDto;

  factory ValidMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$ValidMaterialDtoFromJson(json);

  ValidMaterial get toDomain => ValidMaterial(
        hidePrice: hidePrice,
        materialNumber: MaterialNumber(materialNumber),
        isValid: isValid,
      );
}
