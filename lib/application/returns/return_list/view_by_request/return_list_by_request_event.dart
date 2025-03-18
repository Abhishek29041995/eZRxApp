part of 'return_list_by_request_bloc.dart';

@freezed
class ReturnListByRequestEvent with _$ReturnListByRequestEvent {
  const factory ReturnListByRequestEvent.initialized({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Initialized;

  const factory ReturnListByRequestEvent.fetch({
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ReturnListByRequestEvent.loadMore() = _LoadMore;
  const factory ReturnListByRequestEvent.downloadFile() = _DownloadFile;
}
