import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_representative_info.freezed.dart';

@freezed
class SalesRepresentativeInfo with _$SalesRepresentativeInfo {
  const SalesRepresentativeInfo._();

  const factory SalesRepresentativeInfo({
    required int count,
    required List<String> uniquePrincipalGroup,
    required List<String> uniquePrincipalNumber,
    required List<String> uniqueSalesOrganisation,
  }) = _SalesRepresentativeInfo;

  factory SalesRepresentativeInfo.empty() => const SalesRepresentativeInfo(
        count: 1,
        uniquePrincipalGroup: [],
        uniquePrincipalNumber: [],
        uniqueSalesOrganisation: [],
      );
}
