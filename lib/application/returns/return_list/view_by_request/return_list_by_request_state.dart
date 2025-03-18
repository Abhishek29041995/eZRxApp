part of 'return_list_by_request_bloc.dart';

@freezed
class ReturnListByRequestState with _$ReturnListByRequestState {
  const ReturnListByRequestState._();
  const factory ReturnListByRequestState({
    required List<ReturnItem> returnItemList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isFetching,
    required bool canLoadMore,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required SalesOrg salesOrg,
    required User user,
    required bool isDownloadInProgress,
  }) = _ReturnListByRequestState;

  factory ReturnListByRequestState.initial() => ReturnListByRequestState(
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: true,
        returnItemList: <ReturnItem>[],
        appliedFilter: ReturnFilter.empty(),
        searchKey: SearchKey.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        shipInfo: ShipToInfo.empty(),
        user: User.empty(),
        isDownloadInProgress: false,
      );
}
