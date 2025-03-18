part of 'price_override_bloc.dart';

@freezed
class PriceOverrideEvent with _$PriceOverrideEvent {
  const factory PriceOverrideEvent.initialized({
    required PriceAggregate item,
  }) = _Initialized;

  const factory PriceOverrideEvent.onPriceValueChange({
    required String newPrice,
  }) = _OnPriceValueChange;

  const factory PriceOverrideEvent.onDiscountValueChanged({
    required String newValue,
  }) = _OnDiscountValueChanged;

  const factory PriceOverrideEvent.onRemarksValueChange({
    required String newRemarks,
  }) = _OnRemarksValueChange;

  const factory PriceOverrideEvent.validateInputFields() = _ValidateInputFields;
  const factory PriceOverrideEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
