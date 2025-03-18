part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessMaterialSection extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;
  final bool isMarketPlace;

  const _OrderSuccessMaterialSection({
    required this.orderItems,
    this.isMarketPlace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: isMarketPlace
          ? WidgetKeys.orderSuccessMPItemsSection
          : WidgetKeys.orderSuccessZPItemsSection,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: orderItems
          .map(
            (item) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: padding12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: padding12),
                    child: isMarketPlace
                        ? MarketPlaceSellerTitle(
                            sellerName: item.principalName.name,
                            textColor: ZPColors.black,
                          )
                        : Text(
                            item.principalName.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: ZPColors.black,
                                ),
                          ),
                  ),
                  ...item.viewByOrderItem.mapIndexed(
                    (index, e) => _MaterialItem(
                      key: WidgetKeys.orderSuccessMaterialItem(index),
                      orderItem: e,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final OrderHistoryDetailsOrderItem orderItem;

  const _MaterialItem({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    final isIDMarket = eligibilityState.salesOrg.isID;

    final aplPromotions = context.read<CartBloc>().state.aplPromotionLabel(
          orderItem.priceAggregate.getMaterialNumber,
        );

    return CommonTileItem(
      onTap: () => context.router.push(
        ProductDetailsPageRoute(
          materialInfo: orderItem.priceAggregate.materialInfo,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: padding12),
      materialNumber: orderItem.materialNumber,
      label: orderItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
        showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
      ),
      subtitle: '',
      priceComponent: !orderItem.isBonus
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemPrice(
                  unitPrice: orderItem.itemUnitPrice(
                    isIDMarket,
                  ),
                  originPrice: orderItem.itemOriginPrice,
                  showPreviousPrice: orderItem.isCounterOffer,
                  hidePrice: orderItem.hidePrice,
                ),
                //Promotional Information for ID market from aplSimulatedOrder
                if (aplPromotions.isNotEmpty)
                  Text(
                    '${aplPromotions.map(
                          (e) => context.tr(
                            e.message,
                            namedArgs: e.arguments,
                          ),
                        ).join(',')} ${context.tr('offer applied')}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                          fontStyle: FontStyle.italic,
                        ),
                    key: WidgetKeys.promotionLabel(
                      orderItem.priceAggregate.getMaterialNumber.getValue(),
                    ),
                  ),
              ],
            )
          : const SizedBox.shrink(),
      title: orderItem.defaultMaterialDescription,
      quantity: '${orderItem.qty}',
      isQuantityBelowImage: false,
      isQuantityRequired: false,
      statusTag: orderItem.productTag,
      showOfferTag: orderItem.showOfferTag,
      labelTrailing: orderItem.isBonus
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: PreOrderLabel(
                stockInfo: orderItem.outOfStockInfo,
              ),
            )
          : null,
      footerWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'Qty'.tr()}: ${orderItem.qty}',
                key: WidgetKeys.cartItemProductQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceComponent(
                    key: WidgetKeys.orderSuccessItemTotalPrice,
                    salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                    price: orderItem.itemNetPrice(
                      isIDMarket,
                    ),
                  ),
                  if (orderItem.showItemTax)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: ItemTax(
                        finalPriceTotalWithTax: orderItem.totalPrice,
                        itemTax: orderItem.totalTax,
                        itemTaxPercent: orderItem.taxRate,
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (orderItem.tenderContractDetails.orderReason.isNotEmpty)
            TenderContractSection(
              tenderContract: orderItem.orderItemTenderContract,
            ),
        ],
      ),
      isCovidItem: orderItem.isCovid,
    );
  }
}
