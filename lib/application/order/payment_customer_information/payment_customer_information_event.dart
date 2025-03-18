part of 'payment_customer_information_bloc.dart';

@freezed
class PaymentCustomerInformationEvent with _$PaymentCustomerInformationEvent {
  const factory PaymentCustomerInformationEvent.initialized() = _Initialized;
  const factory PaymentCustomerInformationEvent.fetch({
    required CustomerCodeInfo customeCodeInfo,
    required SalesOrganisation salesOrganisation,
    required String selectedShipToCode,
  }) = _Fetch;
}
