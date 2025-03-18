import 'package:ezrxmobile/domain/returns/entities/material_basic_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_material_list.freezed.dart';

@freezed
class ReturnMaterialList with _$ReturnMaterialList {
  const ReturnMaterialList._();

  const factory ReturnMaterialList({
    required List<MaterialBasicInformation> basicInformations,
    required List<ReturnMaterial> items,
  }) = _ReturnMaterialList;

  factory ReturnMaterialList.empty() => const ReturnMaterialList(
        basicInformations: <MaterialBasicInformation>[],
        items: <ReturnMaterial>[],
      );
}
