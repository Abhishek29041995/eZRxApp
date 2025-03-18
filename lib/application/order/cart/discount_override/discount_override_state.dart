part of 'discount_override_bloc.dart';

@freezed
class DiscountOverrideState with _$DiscountOverrideState {
  const DiscountOverrideState._();
  const factory DiscountOverrideState({
    required Price materialPrice,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool showErrorMessages,
  }) = _DiscountOverrideState;

  factory DiscountOverrideState.initial() => DiscountOverrideState(
        materialPrice: Price.empty(),
        apiFailureOrSuccessOption: none(),
        showErrorMessages: false,
      );
  bool get isDiscountOverride => materialPrice.zdp8Override.isValid();
}
