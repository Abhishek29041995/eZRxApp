part of 'payment_summary_bloc.dart';

@freezed
class PaymentSummaryEvent with _$PaymentSummaryEvent {
  const factory PaymentSummaryEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganization,
  }) = _Initialized;

  const factory PaymentSummaryEvent.fetch({
    required PaymentSummaryFilter appliedFilter,
  }) = _Fetch;

  const factory PaymentSummaryEvent.loadMore() = _LoadMore;
}
