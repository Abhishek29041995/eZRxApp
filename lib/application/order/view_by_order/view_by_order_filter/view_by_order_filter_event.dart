part of 'view_by_order_filter_bloc.dart';

@freezed
class ViewByOrderFilterEvent with _$ViewByOrderFilterEvent {
  const factory ViewByOrderFilterEvent.initialized({
    required SalesOrganisation salesOrganisation,
  }) = _Initialized;
  const factory ViewByOrderFilterEvent.updateCurrentFilter({
    required ViewByOrdersFilter currentFilter,
  }) = _UpdateCurrentFilter;
  const factory ViewByOrderFilterEvent.setDateRange(
    DateTimeRange dateRange,
  ) = _SetDateRange;
  const factory ViewByOrderFilterEvent.setOrderStatus({
    required StatusType status,
    required bool value,
  }) = _SetOrderStatus;
  const factory ViewByOrderFilterEvent.setOrderHistoryType({
    required MaterialOriginFilter type,
  }) = _SetOrderHistoryType;
}
