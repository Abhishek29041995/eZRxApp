part of 'view_by_item_return_filter_bloc.dart';

@freezed
class ViewByItemReturnFilterEvent with _$ViewByItemReturnFilterEvent {
  const factory ViewByItemReturnFilterEvent.initialize() = _Initialize;
  const factory ViewByItemReturnFilterEvent.updateFilterToLastApplied({
    required ReturnFilter lastAppliedFilter,
  }) = _UpdateFiltersToLastApplied;
  const factory ViewByItemReturnFilterEvent.setReturnDate({
    required DateTimeRange returnDateRange,
  }) = _SetReturnDate;
  const factory ViewByItemReturnFilterEvent.setAmountFrom({
    required String amountFrom,
  }) = _SetAmountFrom;
  const factory ViewByItemReturnFilterEvent.setAmountTo({
    required String amountTo,
  }) = _SetAmountTo;
  const factory ViewByItemReturnFilterEvent.setReturnStatus({
    required StatusType status,
    required bool value,
  }) = _SetReturnStatus;
  const factory ViewByItemReturnFilterEvent.setReturnType({
    required MaterialOriginFilter type,
  }) = _SetOrderHistoryType;
  const factory ViewByItemReturnFilterEvent.setValidationFailure() =
      _SetValidationFailure;
  const factory ViewByItemReturnFilterEvent.resetFilters() = _ResetFilters;
}
