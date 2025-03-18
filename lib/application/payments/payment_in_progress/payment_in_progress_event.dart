part of 'payment_in_progress_bloc.dart';

@freezed
class PaymentInProgressEvent with _$PaymentInProgressEvent {
  const factory PaymentInProgressEvent.initialized() = _initialized;

  const factory PaymentInProgressEvent.fetch({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
