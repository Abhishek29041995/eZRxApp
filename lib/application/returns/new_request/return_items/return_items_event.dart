part of 'return_items_bloc.dart';

@freezed
class ReturnItemsEvent with _$ReturnItemsEvent {
  const factory ReturnItemsEvent.initialized({
    required User user,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;

  const factory ReturnItemsEvent.fetch({
    required ReturnItemsFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ReturnItemsEvent.loadMore() = _LoadMore;
}
