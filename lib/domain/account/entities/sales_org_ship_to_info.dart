import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_ship_to_info.freezed.dart';

@freezed
class SalesOrgShipToInfo with _$SalesOrgShipToInfo {
  const SalesOrgShipToInfo._();

  const factory SalesOrgShipToInfo({
    required String shipToCustomerCode,
  }) = _SalesOrgShipToInfo;

  factory SalesOrgShipToInfo.empty() => const SalesOrgShipToInfo(
        shipToCustomerCode: '',
      );
}
