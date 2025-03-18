import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/material_basic_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_basic_information_dto.freezed.dart';
part 'material_basic_information_dto.g.dart';

@freezed
class MaterialBasicInformationDto with _$MaterialBasicInformationDto {
  const MaterialBasicInformationDto._();

  const factory MaterialBasicInformationDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'partnerRole', defaultValue: '') required String partnerRole,
    @JsonKey(name: 'partnerNumber', defaultValue: '')
        required String partnerNumber,
  }) = _MaterialBasicInformationDto;

  factory MaterialBasicInformationDto.fromDomain(
    MaterialBasicInformation basicInfo,
  ) {
    return MaterialBasicInformationDto(
      salesOrg: basicInfo.salesOrg.getOrCrash(),
      partnerRole: basicInfo.partnerRole,
      partnerNumber: basicInfo.partnerNumber,
    );
  }

  MaterialBasicInformation toDomain() {
    return MaterialBasicInformation(
      salesOrg: SalesOrg(salesOrg),
      partnerRole: partnerRole,
      partnerNumber: partnerNumber,
    );
  }

  factory MaterialBasicInformationDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialBasicInformationDtoFromJson(json);
}
