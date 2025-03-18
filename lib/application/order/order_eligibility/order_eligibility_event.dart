part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityEvent with _$OrderEligibilityEvent {
  const factory OrderEligibilityEvent.initialized({
    required User user,
    required SalesOrganisation salesOrg,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
  }) = _Initialized;

  const factory OrderEligibilityEvent.update({
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required double zpSubtotal,
    required double mpSubtotal,
    required double subTotal,
  }) = _Update;

  const factory OrderEligibilityEvent.selectDeliveryOption(
    DeliveryOption value,
  ) = _SelectDeliveryOption;

  const factory OrderEligibilityEvent.validateOrderEligibility() =
      _ValidateOrderEligibility;

  const factory OrderEligibilityEvent.updateUrgentDeliveryOption(
    UrgentDeliveryTimePickerOption value,
  ) = _UpdateUrgentDeliveryOption;

  const factory OrderEligibilityEvent.selectRequestDeliveryDate(
      String value,
      ) = _SelectRequestDeliveryDate;
}
