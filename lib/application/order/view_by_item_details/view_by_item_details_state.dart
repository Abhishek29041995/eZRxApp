part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsState with _$ViewByItemDetailsState {
  const ViewByItemDetailsState._();

  const factory ViewByItemDetailsState({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required OrderHistory orderHistory,
    required List<OrderHistoryItem> orderHistorySelectedItems,
    required List<OrderStatusTracker> orderHistoryStatuses,
    required bool isStatusLoading,
    required bool isInvoiceLoading,
    required bool isDetailsLoading,
    required bool isExpanded,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ShipToInfo shipToInfo,
    required InvoiceDetailResponse invoiceDetail,
    required bool canLoadMoreInvoices,
  }) = _ViewByItemDetailsState;

  factory ViewByItemDetailsState.initial() => ViewByItemDetailsState(
        user: User.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        orderHistory: OrderHistory.empty(),
        orderHistorySelectedItems: <OrderHistoryItem>[],
        orderHistoryStatuses: <OrderStatusTracker>[],
        failureOrSuccessOption: none(),
        isStatusLoading: false,
        isInvoiceLoading: false,
        isDetailsLoading: false,
        isExpanded: false,
        shipToInfo: ShipToInfo.empty(),
        invoiceDetail: InvoiceDetailResponse.empty(),
        canLoadMoreInvoices: true,
      );

  OrderHistoryItem get orderHistorySelectedItem =>
      orderHistorySelectedItems.isNotEmpty
          ? orderHistorySelectedItems.first
          : OrderHistoryItem.empty();

  List<PoDocuments> get poDocumentsList =>
      orderHistorySelectedItem.orderHistoryItemPoAttachments.isNotEmpty
          ? isExpanded
              ? orderHistorySelectedItem.orderHistoryItemPoAttachments
              : [orderHistorySelectedItem.orderHistoryItemPoAttachments.first]
          : [];

  bool get displayShowMoreOrLess =>
      orderHistorySelectedItem.orderHistoryItemPoAttachments.length > 1;

  List<OrderHistoryItem> get otherItems => orderHistory.orderHistoryItems
      .where(
        (e) => !orderHistorySelectedItems
            .map((e) => e.lineNumber)
            .toList()
            .contains(e.lineNumber),
      )
      .toList();

  bool get isCovidOrderType =>
      (salesOrgConfig.salesOrg.isPH &&
          orderHistorySelectedItem.orderType.isCovidOrderTypeForPH) ||
      (salesOrgConfig.salesOrg.isSg &&
          orderHistorySelectedItem.orderType.isCovidOrderTypeForSG);

  bool get isCovidForNonCustomer =>
      isCovidOrderType && !user.role.type.isCustomer;

  bool get displayBuyAgainButton {
    if (user.role.type.isSalesRepRole) {
      return false;
    }

    if (!salesOrgConfig.enableMarketPlace &&
        orderHistorySelectedItem.isMarketPlace) {
      return false;
    }

    if (isCovidForNonCustomer) {
      return false;
    }

    if (customerCodeInfo.status.isEDI) {
      return false;
    }

    if (isDetailsLoading) {
      return false;
    }

    return true;
  }
}
