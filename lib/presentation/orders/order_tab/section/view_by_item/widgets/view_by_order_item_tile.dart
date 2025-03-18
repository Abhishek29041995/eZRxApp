part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItemTile extends StatelessWidget {
  const _ViewByOrderItemTile({
    super.key,
    required this.orderHistoryItem,
    required this.salesOrgConfigs,
  });
  final OrderHistoryItem orderHistoryItem;
  final SalesOrganisationConfigs salesOrgConfigs;

  @override
  Widget build(BuildContext context) {
    final headerText =
        '${context.tr(orderHistoryItem.status.prefix)} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}';

    final subtitle = (orderHistoryItem.manufacturerPrefix.isNotEmpty
            ? '${context.tr(orderHistoryItem.manufacturerPrefix)}: '
            : '') +
        orderHistoryItem.principalData.principalName.name;

    return CustomCard(
      key: WidgetKeys.viewByItemsOrderItem,
      padding: const EdgeInsets.symmetric(vertical: padding6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: padding12,
              vertical: padding6,
            ),
            child: StatusLabel(
              key: WidgetKeys.orderItemStatusKey,
              status: StatusType(
                orderHistoryItem.status.displayOrderStatus,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageBoxWidget(
                  materialNumber: orderHistoryItem.materialNumber,
                  isCovidItem: orderHistoryItem.isCovid,
                  showOfferTag: orderHistoryItem.isOfferItem,
                  showBundleTag: orderHistoryItem.isBundle,
                  showTenderTag: orderHistoryItem
                      .tenderContractNumber.isContractNumberNotEmpty,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (orderHistoryItem.isMarketPlace)
                              Row(
                                children: [
                                  MarketPlaceLogo.medium(),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            Flexible(
                              child: Text(
                                orderHistoryItem.combinationCode(
                                  showGMCPart: salesOrgConfigs.enableGMC,
                                  showIRNPart: salesOrgConfigs.enableIRN,
                                ),
                                key: WidgetKeys.viewOrderByItemTileLabel,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            if (!salesOrgConfigs.salesOrg.isID &&
                                orderHistoryItem.productTag
                                    .getOrDefaultValue('')
                                    .isNotEmpty) ...[
                              const SizedBox(width: 5),
                              StatusLabel(
                                key: WidgetKeys.commonTileItemStatusLabel,
                                status: orderHistoryItem.productTag,
                                valueColor: orderHistoryItem
                                    .productTag.displayStatusTextColor,
                              ),
                            ],
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            orderHistoryItem.defaultMaterialDescription,
                            key: WidgetKeys.viewOrderByItemTileTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          key: WidgetKeys.viewOrderByItemTileSubTitle,
                          subtitle,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkerGrey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              padding12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    key: WidgetKeys.viewByItemsOrderDetailOrderOrQueueNumber,
                    text: TextSpan(
                      text: headerText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.black,
                          ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: orderHistoryItem.status.isInQueue
                              ? const QueueNumberInfoIcon()
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
                _InvoiceNumber(
                  invoiceData: orderHistoryItem.invoiceNumber,
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 0,
            indent: 0,
            color: ZPColors.extraLightGray,
            height: padding12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding12),
            child: _Subtitle(
              quantity: orderHistoryItem.qty.toString(),
              priceComponent: PriceComponent(
                key: WidgetKeys.viewByOrderGrandTotalKey,
                type: PriceStyle.tenderViewOrderByItemPrice,
                price: orderHistoryItem.totalNetPrice(
                  context.read<EligibilityBloc>().state.salesOrg.isID,
                ),
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
              ),
            ),
          ),
          if (orderHistoryItem.tenderContractNumber.isContractNumberNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding12),
              child: TenderContractSection(
                tenderContract: orderHistoryItem.orderItemTenderContract,
              ),
            ),
        ],
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.quantity,
    required this.priceComponent,
  });

  final String quantity;
  final Widget priceComponent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (quantity.isNotEmpty)
          Text(
            '${context.tr('Qty')}: $quantity',
            key: WidgetKeys.commonTileItemQty,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.black,
                ),
          ),
        priceComponent,
      ],
    );
  }
}
