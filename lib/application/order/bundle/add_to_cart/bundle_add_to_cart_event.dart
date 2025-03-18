part of 'bundle_add_to_cart_bloc.dart';

@freezed
class BundleAddToCartEvent with _$BundleAddToCartEvent {
  const factory BundleAddToCartEvent.initialized() = _Initialized;
  const factory BundleAddToCartEvent.set({
    required MaterialInfo bundle,
  }) = _Set;
  const factory BundleAddToCartEvent.updateQuantity({
    required MaterialNumber materialNumber,
    required int quantity,
  }) = _UpdateQuantity;
  const factory BundleAddToCartEvent.validateQuantity({
    required bool showErrorMessage,
  }) = _ValidateQuantity;
}
