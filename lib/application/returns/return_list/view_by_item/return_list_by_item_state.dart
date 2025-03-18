part of 'return_list_by_item_bloc.dart';

@freezed
class ReturnListByItemState with _$ReturnListByItemState {
  const ReturnListByItemState._();
  const factory ReturnListByItemState({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required List<ReturnItem> returnItemList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isFetching,
    required bool canLoadMore,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
    required bool isDownloadInProgress,
  }) = _ReturnListByItemState;

  factory ReturnListByItemState.initial() => ReturnListByItemState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        shipInfo: ShipToInfo.empty(),
        user: User.empty(),
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: true,
        returnItemList: <ReturnItem>[],
        appliedFilter: ReturnFilter.empty(),
        searchKey: SearchKey.empty(),
        isDownloadInProgress: false,
      );
}
