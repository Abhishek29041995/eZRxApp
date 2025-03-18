part of 'view_by_item_return_filter_bloc.dart';

@freezed
class ViewByItemReturnFilterState with _$ViewByItemReturnFilterState {
  const ViewByItemReturnFilterState._();

  const factory ViewByItemReturnFilterState({
    required ReturnFilter filter,
    required List<StatusType> statusList,
    required bool showErrorMessage,
  }) = _ViewByItemReturnFilterState;

  factory ViewByItemReturnFilterState.initial() => ViewByItemReturnFilterState(
        filter: ReturnFilter.empty(),
        statusList: <StatusType>[
          StatusType('PENDING'),
          StatusType('APPROVED'),
          StatusType('REJECTED'),
        ],
        showErrorMessage: false,
      );
}
