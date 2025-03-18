part of 'bundle_add_to_cart_bloc.dart';

@freezed
class BundleAddToCartState with _$BundleAddToCartState {
  const BundleAddToCartState._();
  const factory BundleAddToCartState({
    required MaterialInfo materialInfo,
    required bool showErrorMessage,
  }) = _BundleAddToCartState;

  factory BundleAddToCartState.initial() => BundleAddToCartState(
        materialInfo: MaterialInfo.empty(),
        showErrorMessage: false,
      );

  List<MaterialInfo> get bundleMaterialsSelected =>
      materialInfo.bundle.materials
          .where((element) => element.quantity.intValue > 0)
          .toList();

  int _materialInCart(PriceAggregate materialInCart, MaterialInfo info) =>
      materialInCart.bundle.materials
          .firstWhere(
            (element) => element.materialNumber == info.materialNumber,
            orElse: () => MaterialInfo.empty(),
          )
          .quantity
          .intValue;

  List<MaterialInfo> selectedMaterialInfo(PriceAggregate materialInCart) =>
      bundleMaterialsSelected
          .map(
            (e) => e.copyWith(
              quantity: MaterialQty(
                e.quantity.intValue + _materialInCart(materialInCart, e),
              ),
            ),
          )
          .toList();

  bool get displayErrorMessage =>
      showErrorMessage && !materialInfo.bundle.miniumQtySatisfied;
}
