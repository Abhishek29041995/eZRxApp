part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsEvent with _$ViewByItemDetailsEvent {
  const factory ViewByItemDetailsEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required ShipToInfo shipToInfo,
  }) = _Initialized;

  const factory ViewByItemDetailsEvent.fetchZyllemStatus({
    required StringValue invoiceNumber,
  }) = _FetchZyllemStatus;

  const factory ViewByItemDetailsEvent.updateIsExpanded({
    required bool isExpanded,
  }) = _updateIsExpanded;

  const factory ViewByItemDetailsEvent.fetchOrdersInvoiceData({
    required OrderNumber orderNumber,
  }) = _FetchOrdersInvoiceData;
  const factory ViewByItemDetailsEvent.fetchOrderHistoryDetails({
    required LineNumber lineNumber,
    required OrderNumber orderNumber,
  }) = _FetchOrderHistoryDetails;

  const factory ViewByItemDetailsEvent.loadMoreInvoices() = _LoadMoreInvoices;
}
