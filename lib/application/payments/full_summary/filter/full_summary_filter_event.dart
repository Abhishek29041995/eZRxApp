part of 'full_summary_filter_bloc.dart';

@freezed
class FullSummaryFilterEvent with _$FullSummaryFilterEvent {
  const factory FullSummaryFilterEvent.initialized() = _Initialized;

  const factory FullSummaryFilterEvent.openFilterBottomSheet({
    required FullSummaryFilter appliedFilter,
  }) = _OpenFilterBottomSheet;

  const factory FullSummaryFilterEvent.validateFilters() = _ValidateFilters;

  const factory FullSummaryFilterEvent.statusChanged(
    String filterStatus,
    bool selected,
  ) = _StatusChanged;

  const factory FullSummaryFilterEvent.setDueDate(
    DateTimeRange dateRange,
  ) = _SetDueDate;

  const factory FullSummaryFilterEvent.setDocumentDate(
    DateTimeRange dateRange,
  ) = _SetDocumentDate;
}
