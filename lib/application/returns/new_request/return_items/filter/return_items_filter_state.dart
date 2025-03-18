part of 'return_items_filter_bloc.dart';

@freezed
class ReturnItemsFilterState with _$ReturnItemsFilterState {
  const ReturnItemsFilterState._();
  const factory ReturnItemsFilterState({
    required ReturnItemsFilter filter,
  }) = _ReturnItemsFilterState;

  factory ReturnItemsFilterState.initial() => ReturnItemsFilterState(
        filter: ReturnItemsFilter.empty(),
      );
}
