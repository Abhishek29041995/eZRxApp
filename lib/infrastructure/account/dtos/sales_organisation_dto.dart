import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_dto.freezed.dart';
part 'sales_organisation_dto.g.dart';

@freezed
class SalesOrganisationDto with _$SalesOrganisationDto {
  const SalesOrganisationDto._();

  const factory SalesOrganisationDto({
    @JsonKey(name: 'SalesOrg') required String salesOrg,
    @JsonKey(name: 'CustomerCode') required String customerCode,
    @JsonKey(name: 'ShipToCode') required List<String> shipToCodes,
  }) = _SalesOrganisationDto;

  factory SalesOrganisationDto.fromDomain(
    SalesOrganisation salesOrganisation, {
    int index = 0,
  }) {
    return SalesOrganisationDto(
      salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      customerCode: salesOrganisation.customerInfos[index].customerCodeSoldTo
          .getOrCrash(),
      shipToCodes: salesOrganisation.customerInfos[index].shipToInfos
          .map((e) => e.shipToCustomerCode)
          .toList(),
    );
  }

  SalesOrganisation toDomain() {
    return SalesOrganisation(
      salesOrg: SalesOrg(salesOrg),
      customerInfos: [
        SalesOrgCustomerInfo(
          customerCodeSoldTo: CustomerCode(customerCode),
          shipToInfos: shipToCodes
              .map((e) => SalesOrgShipToInfo(shipToCustomerCode: e))
              .toList(),
        ),
      ],
    );
  }

  factory SalesOrganisationDto.empty() => const SalesOrganisationDto(
        salesOrg: '',
        customerCode: '',
        shipToCodes: [],
      );

  factory SalesOrganisationDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationDtoFromJson(json);
}
