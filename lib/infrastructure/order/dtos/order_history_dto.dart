import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_basic_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_dto.freezed.dart';
part 'order_history_dto.g.dart';

@freezed
class OrderHistoryDto with _$OrderHistoryDto {
  const OrderHistoryDto._();
  const factory OrderHistoryDto({
    @JsonKey(name: 'orderBasicInformation')
        required OrderHistoryBasicInfoDto orderBasicInformation,
    @JsonKey(name: 'orderItems') required List<OrderHistoryItemDto> orderItems,
  }) = _OrderHistoryDto;
  factory OrderHistoryDto.fromDomain(
    OrderHistory orderHistory,
  ) {
    return OrderHistoryDto(
      orderBasicInformation: OrderHistoryBasicInfoDto.fromDomain(
        orderHistory.orderBasicInformation,
      ),
      orderItems: List.from(orderHistory.orderHistoryItems)
          .map((e) => OrderHistoryItemDto.fromDomain(e))
          .toList(),
    );
  }
  OrderHistory toDomain() {
    return OrderHistory(
      orderBasicInformation: OrderHistoryBasicInfo(
        soldTo: orderBasicInformation.soldTo,
        shipTo: orderBasicInformation.shipTo,
        companyName: CompanyName(orderBasicInformation.companyName),
        paymentTerm: orderBasicInformation.paymentTerm.toDomain(),
      ),
      orderHistoryItems: orderItems.map((e) => e.toDomain()).toList(),
    );
  }

  factory OrderHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDtoFromJson(json);
}
