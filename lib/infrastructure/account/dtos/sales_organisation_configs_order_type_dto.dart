import 'package:ezrxmobile/domain/account/entities/order_type.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs_order_type_dto.freezed.dart';
part 'sales_organisation_configs_order_type_dto.g.dart';

@freezed
class SalesOrganisationConfigsOrderTypeDto
    with _$SalesOrganisationConfigsOrderTypeDto {
  const SalesOrganisationConfigsOrderTypeDto._();

  const factory SalesOrganisationConfigsOrderTypeDto({
    @JsonKey(name: 'categoryId', defaultValue: '') required String categoryId,
    @JsonKey(name: 'orderType', defaultValue: '') required String orderType,
    @JsonKey(name: 'orderReason', defaultValue: 0) required int orderReason,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'enabled', defaultValue: false) required bool enabled,
  }) = _SalesOrganisationConfigsOrderTypeDto;
  factory SalesOrganisationConfigsOrderTypeDto.fromDomain(
    OrderType orderType,
  ) {
    return SalesOrganisationConfigsOrderTypeDto(
      categoryId: orderType.categoryId.getValue(),
      orderType: orderType.orderType.getValue(),
      orderReason: orderType.orderReason,
      description: orderType.description.getValue(),
      enabled: orderType.enabled,
    );
  }

  OrderType toDomain() {
    return OrderType(
      categoryId: DocumentType(categoryId),
      orderType: StringValue(orderType),
      orderReason: orderReason,
      description: StringValue(description),
      enabled: enabled,
    );
  }

  factory SalesOrganisationConfigsOrderTypeDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SalesOrganisationConfigsOrderTypeDtoFromJson(json);
}
