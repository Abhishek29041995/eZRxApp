part of 'view_by_item_bloc.dart';

@freezed
class ViewByItemsEvent with _$ViewByItemsEvent {
  const factory ViewByItemsEvent.initialized({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
  }) = _Initialized;
  const factory ViewByItemsEvent.fetch({
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
  }) = _Fetch;

  const factory ViewByItemsEvent.loadMore() = _LoadMore;
  const factory ViewByItemsEvent.fetchOrdersInvoiceData({
    required List<OrderHistoryItem> orderHistoryItems,
  }) = _FetchOrdersInvoiceData;
}
