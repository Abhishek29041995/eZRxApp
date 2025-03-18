part of 'view_by_item_filter_bloc.dart';

@freezed
class ViewByItemFilterEvent with _$ViewByItemFilterEvent {
  const factory ViewByItemFilterEvent.initialize() = _Initialized;
  const factory ViewByItemFilterEvent.resetFiltersToLastApplied({
    required ViewByItemFilter lastAppliedFilter,
  }) = _ResetFiltersToLastApplied;
  const factory ViewByItemFilterEvent.setOrderDate({
    required DateTimeRange dateRange,
  }) = _SetOrderDate;
  const factory ViewByItemFilterEvent.setOrderStatus({
    required StatusType status,
    required bool value,
  }) = _SetOrderStatus;
  const factory ViewByItemFilterEvent.setOrderHistoryType({
    required MaterialOriginFilter type,
  }) = _SetOrderHistoryType;
  const factory ViewByItemFilterEvent.resetFilter() = _ResetFilter;
}
