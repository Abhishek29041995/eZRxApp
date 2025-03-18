import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_simulator_order_dto.freezed.dart';
part 'apl_simulator_order_dto.g.dart';

@freezed
class AplSimulatorOrderDto with _$AplSimulatorOrderDto {
  const AplSimulatorOrderDto._();
  const factory AplSimulatorOrderDto({
    @JsonKey(name: 'beforeTax', defaultValue: 0)
        required double totalPriceWithoutTax, //total price without tax
    @JsonKey(name: 'deliveryFee', defaultValue: 0)
        required double smallOrderFee, //small order fee
    @JsonKey(name: 'netTotalValue', defaultValue: 0)
        required double grandTotal, //grand total price
    @JsonKey(name: 'tax', defaultValue: 0) required double totalTax, //tax price
    @JsonKey(name: 'totalDiscValue', defaultValue: 0)
        required double totalDiscountValue, //total savings
    @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
        required List<AplProductDto> aplProductList,
  }) = _AplSimulatorOrderDto;

  AplSimulatorOrder get toDomain {
    return AplSimulatorOrder(
      grandTotal: grandTotal,
      smallOrderFee: smallOrderFee,
      totalDiscountValue: totalDiscountValue,
      totalPriceWithoutTax: totalPriceWithoutTax,
      totalTax: totalTax,
      aplProducts: aplProductList.map((e) => e.toDomain).toList(),
    );
  }

  factory AplSimulatorOrderDto.fromJson(Map<String, dynamic> json) =>
      _$AplSimulatorOrderDtoFromJson(json);
}
