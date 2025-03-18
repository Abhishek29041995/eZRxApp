part of 'price_override_bloc.dart';

@freezed
class PriceOverrideState with _$PriceOverrideState {
  const PriceOverrideState._();

  const factory PriceOverrideState({
    required PriceAggregate item,
    required bool isFetching,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _PriceOverrideState;

  factory PriceOverrideState.initial() => PriceOverrideState(
        item: PriceAggregate.empty(),
        isFetching: false,
        showErrorMessages: false,
        apiFailureOrSuccessOption: none(),
      );

  bool get isPriceOverride =>
      item.materialInfo.counterOfferDetails.counterOfferPrice.isValid();

  bool get isDiscountOverride =>
      item.materialInfo.counterOfferDetails.discountOverridePercentage
          .isValid();

  double get overridedPrice {
    final priceValue = isPriceOverride
        ? item.materialInfo.counterOfferDetails.counterOfferPrice.doubleValue
        : item.price.priceValueForDiscountOverride;
    final discountValue = item.materialInfo.counterOfferDetails
        .discountOverridePercentage.doubleValue;

    return isDiscountOverride
        ? (priceValue * (1 - discountValue / 100))
        : priceValue > 0.0
            ? priceValue
            : item.price.priceValueForPriceOverride;
  }

  String get finalCounterOfferPrice {
    if (item.materialInfo.hidePrice) {
      return 'Price Not Available';
    }
    if (!_hasPriceOrDiscountOverride) {
      return 'Not requested';
    }

    return overridedPrice.toString();
  }

  bool get isInputFieldValid => isPriceOverride || isDiscountOverride;

  double get discountedPrice => item.price.discountedValue.getOrDefaultValue(0);

  bool get hasDiscount => discountedPrice > 0;

  double get itemFinalPrice => hasDiscount ? discountedPrice : item.listPrice;

  bool get _hasPriceOrDiscountOverride => isPriceOverride || isDiscountOverride;

  bool get showWarningMessage =>
      _hasPriceOrDiscountOverride &&
      !item.materialInfo.hidePrice &&
      overridedPrice > itemFinalPrice;
}
