part of 'payment_summary_filter_bloc.dart';

@freezed
class PaymentSummaryFilterEvent with _$PaymentSummaryFilterEvent {
  const factory PaymentSummaryFilterEvent.initialized({
    required SalesOrg salesOrg,
  }) = _Initialized;

  const factory PaymentSummaryFilterEvent.openFilterBottomSheet({
    required PaymentSummaryFilter appliedFilter,
  }) = _OpenFilterBottomSheet;

  const factory PaymentSummaryFilterEvent.validateFilters() = _ValidateFilters;

  const factory PaymentSummaryFilterEvent.amountValueFromChanged(
    String amountValueFrom,
  ) = _AmountValueFromChanged;

  const factory PaymentSummaryFilterEvent.amountValueToChanged(
    String amountValueTo,
  ) = _AmountValueToChanged;

  const factory PaymentSummaryFilterEvent.statusChanged(
    FilterStatus filterStatus,
  ) = _StatusChanged;

  const factory PaymentSummaryFilterEvent.setCreatedDate(
    DateTimeRange dateRange,
  ) = _SetCreatedDate;
}
