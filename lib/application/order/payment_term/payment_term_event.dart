part of 'payment_term_bloc.dart';

@freezed
class PaymentTermEvent with _$PaymentTermEvent {
  const factory PaymentTermEvent.initialized() = _Initialized;
  const factory PaymentTermEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customeCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesRepresentativeInfo salesRepresentativeInfo,
    required PaymentCustomerInformation paymentCustomerInformation,
    required User user,
  }) = _Fetch;
}
