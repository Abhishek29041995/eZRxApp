import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';

part 'cart_dto.freezed.dart';
part 'cart_dto.g.dart';

@freezed
class CartDto with _$CartDto {
  const CartDto._();

  const factory CartDto({
    @JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
        required List<CartProductDto> cartProducts,
    @JsonKey(name: 'customerCode', defaultValue: '')
        required String cartCustomerCode,
    @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
        required String cartShipToCustomerCode,
  }) = _CartDto;

  Cart toDomain() {
    return Cart(
      cartProducts: cartProducts.map((e) => e.toDomain).toList(),
      cartCustomerCode: cartCustomerCode,
      cartShipToCustomerCode: cartShipToCustomerCode,
    );
  }

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}
