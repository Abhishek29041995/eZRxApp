part of 'view_by_request_return_filter_bloc.dart';

@freezed
class ViewByRequestReturnFilterState with _$ViewByRequestReturnFilterState {
  const ViewByRequestReturnFilterState._();

  const factory ViewByRequestReturnFilterState({
    required ReturnFilter filter,
    required List<StatusType> statusList,
    required bool showErrorMessage,
  }) = _ViewByRequestReturnFilterState;

  factory ViewByRequestReturnFilterState.initial() =>
      ViewByRequestReturnFilterState(
        filter: ReturnFilter.empty(),
        statusList: <StatusType>[
          StatusType('PENDING'),
          StatusType('REVIEWED'),
          StatusType('FAILED'),
        ],
        showErrorMessage: false,
      );
}
