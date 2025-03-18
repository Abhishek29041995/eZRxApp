part of 'view_by_request_return_filter_bloc.dart';

@freezed
class ViewByRequestReturnFilterEvent with _$ViewByRequestReturnFilterEvent {
  const factory ViewByRequestReturnFilterEvent.initialize() = _Initialize;
  const factory ViewByRequestReturnFilterEvent.updateFilterToLastApplied({
    required ReturnFilter lastAppliedFilter,
  }) = _UpdateFiltersToLastApplied;
  const factory ViewByRequestReturnFilterEvent.setReturnDate({
    required DateTimeRange returnDateRange,
  }) = _SetReturnDate;
  const factory ViewByRequestReturnFilterEvent.setAmountFrom({
    required String amountFrom,
  }) = _SetAmountFrom;
  const factory ViewByRequestReturnFilterEvent.setAmountTo({
    required String amountTo,
  }) = _SetAmountTo;
  const factory ViewByRequestReturnFilterEvent.setReturnStatus({
    required StatusType status,
    required bool value,
  }) = _SetReturnStatus;
  const factory ViewByRequestReturnFilterEvent.setReturnType({
    required MaterialOriginFilter type,
  }) = _SetOrderHistoryType;
  const factory ViewByRequestReturnFilterEvent.setValidationFailure() =
      _SetValidationFailure;
  const factory ViewByRequestReturnFilterEvent.resetFilters() = _ResetFilters;
}
