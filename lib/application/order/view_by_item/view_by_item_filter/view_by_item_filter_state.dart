part of 'view_by_item_filter_bloc.dart';

@freezed
class ViewByItemFilterState with _$ViewByItemFilterState {
  const ViewByItemFilterState._();

  const factory ViewByItemFilterState({
    required ViewByItemFilter filter,
  }) = _ViewByItemFilterState;

  factory ViewByItemFilterState.initial() => ViewByItemFilterState(
        filter: ViewByItemFilter.empty(),
      );

  ViewByItemFilter get emptyViewByItemFilter => ViewByItemFilter.empty();
}
