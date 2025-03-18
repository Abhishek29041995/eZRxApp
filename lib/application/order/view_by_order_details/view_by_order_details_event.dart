part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsEvent with _$ViewByOrderDetailsEvent {
  const factory ViewByOrderDetailsEvent.initialized({
    required User user,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) = _Initialized;
  const factory ViewByOrderDetailsEvent.fetch({
    required OrderNumber orderNumber,
  }) = _Fetch;
  const factory ViewByOrderDetailsEvent.setOrderDetails({
    required OrderHistoryDetails orderHistoryDetails,
  }) = _SetOrderDetails;
  const factory ViewByOrderDetailsEvent.updateMaterialTenderContract({
    required TenderContract selectedTenderContract,
    required MaterialQueryInfo queryInfo,
  }) = _UpdateMaterialTenderContract;
  const factory ViewByOrderDetailsEvent.expandAttachments() =
      _ExpandAttachments;
  const factory ViewByOrderDetailsEvent.updateBundle() = _UpdateBundle;
  const factory ViewByOrderDetailsEvent.fetchOrdersInvoiceData({
    required OrderNumber orderNumber,
  }) = _FetchOrdersInvoiceData;

  const factory ViewByOrderDetailsEvent.loadMoreInvoices() = _LoadMoreInvoices;
}
