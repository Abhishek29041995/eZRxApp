import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_exception.freezed.dart';

@freezed
class CartException with _$CartException {
  const factory CartException.cartHasDifferentAddress() =
      _CartHasDifferentAddress;

  const factory CartException.addAnimalHealthWithNormalProductToCart() =
      _AddAnimalHealthWithNormalProductToCart;
}
