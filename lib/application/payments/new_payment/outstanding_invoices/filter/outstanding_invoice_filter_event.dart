part of 'outstanding_invoice_filter_bloc.dart';

@freezed
class OutstandingInvoiceFilterEvent with _$OutstandingInvoiceFilterEvent {
  const factory OutstandingInvoiceFilterEvent.initialize() = _Initialize;
  const factory OutstandingInvoiceFilterEvent.updateFilterToLastApplied({
    required OutstandingInvoiceFilter lastAppliedFilter,
  }) = _UpdateFiltersToLastApplied;
  const factory OutstandingInvoiceFilterEvent.setDocumentDate({
    required DateTimeRange documentDateRange,
  }) = _SetDocumentDate;
  const factory OutstandingInvoiceFilterEvent.setDueDate({
    required DateTimeRange dueDateRange,
  }) = _SetDueDate;
  const factory OutstandingInvoiceFilterEvent.setAmountFrom({
    required String amountFrom,
  }) = _SetAmountFrom;
  const factory OutstandingInvoiceFilterEvent.setAmountTo({
    required String amountTo,
  }) = _SetAmountTo;
  const factory OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus({
    required StatusType status,
    required bool value,
  }) = _SetOutstandingInvoiceStatus;
  const factory OutstandingInvoiceFilterEvent.setValidationFailure() =
      _SetValidationFailure;
  const factory OutstandingInvoiceFilterEvent.resetFilters() = _ResetFilters;
}
