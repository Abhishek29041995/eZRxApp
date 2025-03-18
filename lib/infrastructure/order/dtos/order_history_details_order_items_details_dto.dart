import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_details_dto.freezed.dart';
part 'order_history_details_order_items_details_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderItemDetailsDto
    with _$OrderHistoryDetailsOrderItemDetailsDto {
  const OrderHistoryDetailsOrderItemDetailsDto._();
  const factory OrderHistoryDetailsOrderItemDetailsDto({
    @JsonKey(name: 'discountCode', defaultValue: '')
        required String discountCode,
    @JsonKey(name: 'discountDescription', defaultValue: '')
        required String discountDescription,
    @JsonKey(name: 'rate', defaultValue: '') required String rate,
  }) = _OrderHistoryDetailsOrderItemDetailsDto;
  factory OrderHistoryDetailsOrderItemDetailsDto.fromDomain(
    OrderHistoryDetailsOrderItemDetails details,
  ) {
    return OrderHistoryDetailsOrderItemDetailsDto(
      discountCode: details.discountCode,
      discountDescription: details.discountDescription,
      rate: details.rate,
    );
  }

  OrderHistoryDetailsOrderItemDetails toDomain() {
    return OrderHistoryDetailsOrderItemDetails(
      discountCode: discountCode,
      discountDescription: discountDescription,
      rate: rate,
    );
  }

  factory OrderHistoryDetailsOrderItemDetailsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderHistoryDetailsOrderItemDetailsDtoFromJson(json);
}
