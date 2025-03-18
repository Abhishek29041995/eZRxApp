import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_dto.freezed.dart';
part 'view_by_order_dto.g.dart';

@freezed
class ViewByOrderDto with _$ViewByOrderDto {
  const ViewByOrderDto._();
  const factory ViewByOrderDto({
    @JsonKey(name: 'orderCount', defaultValue: 0)
        required int orderCount,
    @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
        required List<String> creatingOrderIds,
    @JsonKey(
      name: 'orderHeaders',
      defaultValue: <OrderHistoryDetailsDto>[],
    )
        required List<OrderHistoryDetailsDto> orderHeaders,
  }) = _ViewByOrderDto;
  factory ViewByOrderDto.fromDomain(
    ViewByOrder viewByOrder,
  ) {
    return ViewByOrderDto(
      creatingOrderIds: viewByOrder.creatingOrderIds,
      orderHeaders: List.from(viewByOrder.orderHeaders)
          .map((e) => OrderHistoryDetailsDto.fromDomain(e))
          .toList(),
      orderCount: viewByOrder.orderCount,
    );
  }
  ViewByOrder toDomain() {
    return ViewByOrder(
      orderCount: orderCount,
      creatingOrderIds: creatingOrderIds,
      orderHeaders: orderHeaders.map((e) => e.toDomain()).toList(),
    );
  }

  factory ViewByOrderDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByOrderDtoFromJson(json);
}
