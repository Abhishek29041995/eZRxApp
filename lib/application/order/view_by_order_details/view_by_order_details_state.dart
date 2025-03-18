part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsState with _$ViewByOrderDetailsState {
  const ViewByOrderDetailsState._();
  const factory ViewByOrderDetailsState({
    required User user,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required OrderHistoryDetails orderHistoryDetails,
    required bool isLoading,
    required Map<MaterialQueryInfo, bool> isLoadingTenderContract,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Map<MaterialQueryInfo, PriceAggregate> materials,
    required bool isExpanded,
    required List<ProductDetailAggregate> productDetailAggregateList,
    required ShipToInfo shipToInfo,
    required bool isLoadingBundleDetail,
    required bool isFetchingInvoices,
    required InvoiceDetailResponse invoiceDetail,
    required bool canLoadMoreInvoices,
  }) = _ViewByOrderDetailsState;

  factory ViewByOrderDetailsState.initial() => ViewByOrderDetailsState(
        user: User.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        orderHistoryDetails: OrderHistoryDetails.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isLoadingTenderContract: {},
        materials: {},
        isExpanded: false,
        isFetchingInvoices: false,
        productDetailAggregateList: <ProductDetailAggregate>[],
        shipToInfo: ShipToInfo.empty(),
        isLoadingBundleDetail: false,
        configs: SalesOrganisationConfigs.empty(),
        invoiceDetail: InvoiceDetailResponse.empty(),
        canLoadMoreInvoices: true,
      );
  int get poDocumentCount =>
      orderHistoryDetails.orderHistoryDetailsPoDocuments.length;
  int get displayedPoDocumentCount => isExpanded ? poDocumentCount : 1;
  int get additionalItemCount => poDocumentCount > 1 ? 1 : 0;
  int get totalItemCount => displayedPoDocumentCount + additionalItemCount;
  bool get isOrderHistoryDetailsEmpty =>
      orderHistoryDetails == OrderHistoryDetails.empty();

  List<MaterialNumber> get bundleCodes =>
      orderHistoryDetails.orderHistoryDetailsOrderItem.bundleItemDetailsList
          .map((e) => e.parentId)
          .toList();

  bool get displayBuyAgainButton {
    if (user.disableCreateOrder) {
      return false;
    }
    if (customerCodeInfo.status.isEDI) {
      return false;
    }
    if (!configs.enableMarketPlace && orderHistoryDetails.isMarketPlace) {
      return false;
    }
    final isCovidOrderType = (configs.salesOrg.isPH &&
            orderHistoryDetails.type.isCovidOrderTypeForPH) ||
        (configs.salesOrg.isSg &&
            orderHistoryDetails.type.isCovidOrderTypeForSG);

    final isCustomer = user.role.type.isCustomer;

    if (isCovidOrderType && !isCustomer) {
      return false;
    }

    return true;
  }

  //TODO:Need To Revisit when tender contract is implemented for V3
  // bool get loadingTenderContractSuccess => isLoadingTenderContract.values.every(
  //       (isLoading) => !isLoading,
  //     );
}
