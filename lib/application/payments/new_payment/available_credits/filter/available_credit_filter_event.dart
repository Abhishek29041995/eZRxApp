part of 'available_credit_filter_bloc.dart';

@freezed
class AvailableCreditFilterEvent with _$AvailableCreditFilterEvent {
  const factory AvailableCreditFilterEvent.initialize() = _Initialize;
  const factory AvailableCreditFilterEvent.setDocumentDate({
    required DateTimeRange documentDateRange,
  }) = _SetDocumentDate;
  const factory AvailableCreditFilterEvent.setAmountFrom({
    required String amountFrom,
  }) = _SetAmountFrom;
  const factory AvailableCreditFilterEvent.setAmountTo({
    required String amountTo,
  }) = _SetAmountTo;
  const factory AvailableCreditFilterEvent.setValidationFailure() =
      _SetValidationFailure;
  const factory AvailableCreditFilterEvent.resetFilters() = _ResetFilters;
   const factory AvailableCreditFilterEvent.updateFilterToLastApplied({
    required AvailableCreditFilter lastAppliedFilter,
  }) = _UpdateFiltersToLastApplied;
}
