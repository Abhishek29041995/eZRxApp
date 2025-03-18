part of 'return_summary_filter_bloc.dart';

@freezed
class ReturnSummaryFilterEvent with _$ReturnSummaryFilterEvent {
  const factory ReturnSummaryFilterEvent.initialized() = _Initialized;

  const factory ReturnSummaryFilterEvent.applyFilters() = _ApplyFilters;

  const factory ReturnSummaryFilterEvent.returnIdChanged(
    String returnId,
  ) = _ReturnIdChanged;
  const factory ReturnSummaryFilterEvent.refundTotalToChanged(
    String refundTotalTo,
  ) = _RefundTotalToChanged;
  const factory ReturnSummaryFilterEvent.refundTotalFromChanged(
    String refundTotalFrom,
  ) = _RefundTotalFromChanged;
  const factory ReturnSummaryFilterEvent.sortByChanged({
    required StatusType sortBy,
  }) = _CheckedStatusFilter;
  const factory ReturnSummaryFilterEvent.setSubmittedDate({
    required DateTimeRange submittedDateRange,
  }) = _SetSubmittedDate;
}
