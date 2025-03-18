part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessBundleSection extends StatelessWidget {
  final List<ViewByOrdersGroup> bundleItems;
  const _OrderSuccessBundleSection({
    required this.bundleItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.viewByOrderDetailItemsSection,
      padding: const EdgeInsets.symmetric(horizontal: padding12),
      child: Column(
        children:
            bundleItems.map((e) => _BundleTile(viewByOrdersGroup: e)).toList(),
      ),
    );
  }
}

class _BundleTile extends StatelessWidget {
  const _BundleTile({
    required this.viewByOrdersGroup,
  });
  final ViewByOrdersGroup viewByOrdersGroup;

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CustomCard(
      margin: const EdgeInsets.symmetric(vertical: padding12),
      key: WidgetKeys.cartItemBundleTile(
        viewByOrdersGroup.parentId.getOrDefaultValue(''),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTag.bundleOffer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  viewByOrdersGroup.parentId.displayMatNo,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      if (viewByOrdersGroup.bundleMaterial.isMarketPlace) ...[
                        WidgetSpan(
                          child: MarketPlaceLogo.medium(),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        const WidgetSpan(child: SizedBox(width: 8)),
                      ],
                      TextSpan(
                        text: viewByOrdersGroup
                            .bundleMaterial.bundle.bundleName.name,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (viewByOrdersGroup
                        .bundleMaterial.bundle.showStrikeThroughPrice)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: PriceComponent(
                          salesOrgConfig: configs,
                          price: viewByOrdersGroup.bundleMaterial.bundle
                              .minimumQuantityBundleMaterial.rate
                              .toString(),
                          trailingText: context.tr('per item'),
                          type: PriceStyle.bundleListPriceStrikeThrough,
                        ),
                      ),
                    PriceComponent(
                      salesOrgConfig: configs,
                      price: viewByOrdersGroup
                          .bundleMaterial.bundle.currentBundleInfo.rate
                          .toString(),
                      type: PriceStyle.bundleCartPrice,
                      trailingText: context.tr('per item'),
                      key: WidgetKeys.addBundleRate,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${context.tr('Purchase')} ${viewByOrdersGroup.bundleMaterial.bundle.currentBundleInfo.quantity} ${context.tr('or more for')} ${StringUtils.displayPrice(configs, viewByOrdersGroup.bundleMaterial.bundle.currentBundleInfo.rate)} ${context.tr('per item')}',
                  key: WidgetKeys.cartItemBundleRate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsGrey1,
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(height: 8),
                ...viewByOrdersGroup.viewByOrderItem
                    .map((e) => _BundleMaterialTile(orderItem: e)),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.tr('Total qty')}: ${viewByOrdersGroup.bundleMaterial.bundle.totalQty}',
                      key: WidgetKeys.cartItemBundleQty,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    PriceComponent(
                      key: WidgetKeys.cartItemBundleTotalPrice,
                      salesOrgConfig: configs,
                      price: viewByOrdersGroup.bundleMaterial.bundle.totalPrice
                          .toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BundleMaterialTile extends StatelessWidget {
  const _BundleMaterialTile({
    required this.orderItem,
  });
  final OrderHistoryDetailsOrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Padding(
      key: WidgetKeys.orderHistoryBundleItemMaterial(
        orderItem.materialNumber.displayMatNo,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomCard(
            showShadow: false,
            showBorder: true,
            child: ProductImage(
              width: 80,
              height: 80,
              fit: BoxFit.fill,
              materialNumber: orderItem.materialNumber,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        orderItem.combinationCode(
                          showGMCPart: configs.enableGMC,
                          showIRNPart: configs.enableIRN,
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.neutralsBlack,
                            ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    PreOrderLabel(
                      stockInfo: orderItem.reOrderMaterialInfo.productStockInfo,
                    ),
                  ],
                ),
                Text(
                  orderItem.defaultMaterialDescription,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                Text(
                  orderItem.principalData.principalName.name,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${context.tr('Qty')}: ${orderItem.qty}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ZPColors.neutralsBlack),
                    key: WidgetKeys.cartItemProductQty,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
