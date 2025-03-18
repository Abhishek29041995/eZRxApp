part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class ViewByItemOrderItemTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ViewByItemOrderItemTile({
    super.key,
    required this.orderHistoryItem,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return OrderItemCommonTile(
      onTap: () => context.router.push(
        ProductDetailsPageRoute(
          materialInfo: orderHistoryItem.reOrderMaterialInfo,
        ),
      ),
      batchExpiryDate: OrderHistoryStockInfo.viewByItem(
        eligibilityState: eligibilityState,
        item: orderHistoryItem,
      ),
      sellerName: orderHistoryItem.sellerName,
      label: orderHistoryItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
        showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
      ),
      priceComponentSubtitle: _PriceComponentSubtitle(
        orderHistoryItem: orderHistoryItem,
      ),
      footerWidget: QuantityAndPriceWithTax.order(
        quantity: orderHistoryItem.qty,
        taxValue: orderHistoryItem.totalTax,
        totalPrice: orderHistoryItem.totalPrice,
        taxPercentage: orderHistoryItem.taxRate,
        netPrice: orderHistoryItem.itemTotalNetPrice(
          eligibilityState.salesOrg.isID,
        ),
        isTopAlignment: true,
      ),
      statusWidget: StatusLabel(
        key: WidgetKeys.orderItemStatusKey,
        status: StatusType(
          orderHistoryItem.status.displayOrderStatus,
        ),
      ),
      quantity: orderHistoryItem.qty.toString(),
      materialNumber: orderHistoryItem.materialNumber,
      materialDescription: orderHistoryItem.defaultMaterialDescription,
      tenderContractSection:
          orderHistoryItem.tenderContractNumber.isContractNumberNotEmpty
              ? TenderContractSection(
                  tenderContract: orderHistoryItem.orderItemTenderContract,
                )
              : const SizedBox.shrink(),
      statusTag: eligibilityState.salesOrg.isID
          ? StatusType('')
          : orderHistoryItem.productTag,
      isCovidItem: orderHistoryItem.isCovid,
      showOfferTag: orderHistoryItem.isOfferItem,
      showBundleTag: orderHistoryItem.isBundle,
      showTenderTag:
          orderHistoryItem.tenderContractNumber.isContractNumberNotEmpty,
    );
  }
}

class _PriceComponentSubtitle extends StatelessWidget {
  const _PriceComponentSubtitle({
    required this.orderHistoryItem,
  });

  final OrderHistoryItem orderHistoryItem;

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    if (!orderHistoryItem.isBonusMaterial) {
      return Wrap(
        children: [
          if (eligibilityState.salesOrgConfigs.enableListPrice &&
              orderHistoryItem.showMaterialListPrice)
            PriceComponent(
              key: WidgetKeys.materialListPriceStrikeThrough,
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              price: orderHistoryItem.getListPrice.toString(),
              type: PriceStyle.materialListPriceStrikeThrough,
            ),
          OrderItemPrice(
            unitPrice: orderHistoryItem.itemUnitPrice(
              eligibilityState.salesOrgConfigs.salesOrg.isID,
            ),
            originPrice: orderHistoryItem.originPrice.toString(),
            showPreviousPrice: false,
            hidePrice: orderHistoryItem.hidePrice,
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
