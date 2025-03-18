import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_organisation_configs_principal.freezed.dart';

@freezed
class SalesOrganisationConfigsPrincipal
    with _$SalesOrganisationConfigsPrincipal {
  const SalesOrganisationConfigsPrincipal._();

  const factory SalesOrganisationConfigsPrincipal({
    required DateTimeStringValue date,
    required PrincipalCode principalCode,
  }) = _SalesOrganisationConfigsPrincipal;

  factory SalesOrganisationConfigsPrincipal.empty() =>
      SalesOrganisationConfigsPrincipal(
        date: DateTimeStringValue(''),
        principalCode: PrincipalCode(''),
      );
}
