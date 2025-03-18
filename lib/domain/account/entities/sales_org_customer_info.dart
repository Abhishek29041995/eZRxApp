import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_customer_info.freezed.dart';

@freezed
class SalesOrgCustomerInfo with _$SalesOrgCustomerInfo {
  const SalesOrgCustomerInfo._();

  const factory SalesOrgCustomerInfo({
    required CustomerCode customerCodeSoldTo,
    required List<SalesOrgShipToInfo> shipToInfos,
  }) = _SalesOrgCustomerInfo;

  factory SalesOrgCustomerInfo.empty() => SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode(''),
        shipToInfos: <SalesOrgShipToInfo>[],
      );

  factory SalesOrgCustomerInfo.all() => SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('all'),
        shipToInfos: <SalesOrgShipToInfo>[],
      );
}
