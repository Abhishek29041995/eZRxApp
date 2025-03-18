import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_detail.freezed.dart';

@freezed
class MaterialPriceDetail with _$MaterialPriceDetail {
  const MaterialPriceDetail._();
  const factory MaterialPriceDetail({
    required Price price,
    required MaterialInfo info,
  }) = _MaterialPriceDetail;

  factory MaterialPriceDetail.defaultWithPrice({
    required MaterialQueryInfo query,
    required Price price,
  }) =>
      MaterialPriceDetail(
        info: MaterialInfo.empty().copyWith(
          materialNumber: query.value,
          materialDescription: query.description,
          materialGroup2: query.materialGroup2,
          materialGroup4: query.materialGroup4,
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName(query.principalName),
          ),
        ),
        price: price.copyWith(
          materialNumber: query.value,
        ),
      );

  factory MaterialPriceDetail.empty() => MaterialPriceDetail(
        price: Price.empty(),
        info: MaterialInfo.empty(),
      );
}
