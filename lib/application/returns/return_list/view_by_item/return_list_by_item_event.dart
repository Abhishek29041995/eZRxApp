part of 'return_list_by_item_bloc.dart';

@freezed
class ReturnListByItemEvent with _$ReturnListByItemEvent {
  const factory ReturnListByItemEvent.initialized({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Initialized;

  const factory ReturnListByItemEvent.fetch({
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;

  const factory ReturnListByItemEvent.loadMore() = _LoadMore;
  const factory ReturnListByItemEvent.downloadFile() = _DownloadFile;
}
