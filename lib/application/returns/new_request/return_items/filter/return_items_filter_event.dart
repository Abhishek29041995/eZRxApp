part of 'return_items_filter_bloc.dart';

@freezed
class ReturnItemsFilterEvent with _$ReturnItemsFilterEvent {
  const factory ReturnItemsFilterEvent.initialized() = _Initialized;

  const factory ReturnItemsFilterEvent.openFilterBottomSheet({
    required ReturnItemsFilter appliedFilter,
  }) = _OpenFilterBottomSheet;

  const factory ReturnItemsFilterEvent.setInvoiceDate(
    DateTimeRange dateRange,
  ) = _SetInvoiceDate;
}
