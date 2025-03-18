import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_representative_info_dto.freezed.dart';
part 'sales_representative_info_dto.g.dart';

@freezed
class SalesRepresentativeInfoDto with _$SalesRepresentativeInfoDto {
  const SalesRepresentativeInfoDto._();

  const factory SalesRepresentativeInfoDto({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'uniquePrincipalGroup')
        required List<String> uniquePrincipalGroups,
    @JsonKey(name: 'uniquePrincipalNumber')
        required List<String> uniquePrincipalNumbers,
    @JsonKey(name: 'uniqueSalesOrganisation')
        required List<String> uniqueSalesOrganisations,
  }) = _SalesRepresentativeInfoDto;

  SalesRepresentativeInfo toDomain() {
    return SalesRepresentativeInfo(
      count: count,
      uniquePrincipalGroup: uniquePrincipalGroups,
      uniquePrincipalNumber: uniquePrincipalNumbers,
      uniqueSalesOrganisation: uniqueSalesOrganisations,
    );
  }

  factory SalesRepresentativeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SalesRepresentativeInfoDtoFromJson(json);
}
