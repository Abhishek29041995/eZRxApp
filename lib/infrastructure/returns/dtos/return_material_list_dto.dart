import 'package:ezrxmobile/infrastructure/returns/dtos/material_basic_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_dto.dart';

part 'return_material_list_dto.freezed.dart';
part 'return_material_list_dto.g.dart';

@freezed
class ReturnMaterialListDto with _$ReturnMaterialListDto {
  const ReturnMaterialListDto._();

  const factory ReturnMaterialListDto({
    @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[],
    )
        required List<MaterialBasicInformationDto> basicInformations,
    @JsonKey(
      name: 'materials',
      fromJson: _mappingReturnMaterial,
      defaultValue: <ReturnMaterialDto>[],
    )
        required List<ReturnMaterialDto> items,
  }) = _ReturnMaterialListDto;

  factory ReturnMaterialListDto.fromDomain(
    ReturnMaterialList returnRequest,
  ) {
    return ReturnMaterialListDto(
      basicInformations: returnRequest.basicInformations
          .map((basicInfo) => MaterialBasicInformationDto.fromDomain(basicInfo))
          .toList(),
      items: returnRequest.items
          .map((item) => ReturnMaterialDto.fromDomain(item))
          .toList(),
    );
  }

  ReturnMaterialList toDomain() {
    return ReturnMaterialList(
      basicInformations:
          basicInformations.map((basicInfo) => basicInfo.toDomain()).toList(),
      items: items.map((item) => item.toDomain()).toList(),
    );
  }

  factory ReturnMaterialListDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnMaterialListDtoFromJson(json);
}

List<ReturnMaterialDto> _mappingReturnMaterial(dynamic json) =>
    List<Map<String, dynamic>>.from(json)
        .map((e) => ReturnMaterialDto.fromJson(e['item']))
        .toList();
