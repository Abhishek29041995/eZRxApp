import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    required List<PriceAggregate> cartProducts,
    required String cartShipToCustomerCode,
    required String cartCustomerCode,
  }) = _Cart;

  factory Cart.empty() => const Cart(
        cartProducts: <PriceAggregate>[],
        cartCustomerCode: '',
        cartShipToCustomerCode: '',
      );
}
