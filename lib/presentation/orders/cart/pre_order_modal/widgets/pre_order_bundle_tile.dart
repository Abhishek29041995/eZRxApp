part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderBundleTile extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _PreOrderBundleTile({required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    final bundle = cartProduct.bundle;
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CustomCard(
      key: WidgetKeys.preOrderBundle(bundle.bundleCode),
      margin: const EdgeInsets.only(bottom: _itemSpacing),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTag.bundleOffer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      bundle.bundleCode,
                      key: WidgetKeys.cartItemBundleNumber,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    Text(
                      '${context.tr('Total quantity')}: ${bundle.totalQty}',
                      key: WidgetKeys.cartItemBundleQty,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                  ],
                ),
                RichText(
                  key: WidgetKeys.cartItemBundleName,
                  text: TextSpan(
                    children: [
                      if (cartProduct.materialInfo.isMarketPlace) ...[
                        WidgetSpan(
                          child: MarketPlaceLogo.small(),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        const WidgetSpan(child: SizedBox(width: 8)),
                      ],
                      TextSpan(
                        text: bundle.bundleName.name,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (bundle.showStrikeThroughPrice)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: PriceComponent(
                          salesOrgConfig: salesOrgConfig,
                          price: bundle.minimumQuantityBundleMaterial.rate
                              .toString(),
                          trailingText: context.tr('per item'),
                          type: PriceStyle.bundleListPriceStrikeThrough,
                        ),
                      ),
                    PriceComponent(
                      salesOrgConfig: salesOrgConfig,
                      price: bundle.currentBundleInfo.rate.toString(),
                      type: PriceStyle.bundleCartPrice,
                      trailingText: context.tr('per item'),
                      key: WidgetKeys.addBundleRate,
                    ),
                  ],
                ),
                ...bundle.materials.getOutOfStockMaterialList.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: _PreOrderBundleMaterialTile(bundleMaterial: e),
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

class _PreOrderBundleMaterialTile extends StatelessWidget {
  final MaterialInfo bundleMaterial;

  const _PreOrderBundleMaterialTile({required this.bundleMaterial});

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Row(
      key: WidgetKeys.cartItemProductTile(
        bundleMaterial.materialNumber.displayMatNo,
      ),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.zero,
          child: ProductImage(
            materialNumber: bundleMaterial.materialNumber,
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    bundleMaterial.combinationCode(
                      showGMCPart: salesOrgConfig.enableGMC,
                      showIRNPart: salesOrgConfig.enableIRN,
                    ),
                    key: WidgetKeys.cartItemProductMaterialNumber,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  if (!salesOrgConfig.hideStockDisplay) ...[
                    const SizedBox(width: 4),
                    StatusLabel(status: StatusType('OOS-Preorder')),
                  ],
                ],
              ),
              const SizedBox(height: 2),
              Text(
                bundleMaterial.defaultMaterialDescription,
                key: WidgetKeys.cartItemProductMaterialDescription,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              StockInfoWidget(
                stockInfo: bundleMaterial.bundleStockInfoValid,
                materialInfo: bundleMaterial,
              ),
              Text(
                bundleMaterial.getManufactured,
                key: WidgetKeys.cartItemProductPrincipalName,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${context.tr('Qty')}: ${bundleMaterial.quantity.intValue}',
                  key: WidgetKeys.cartItemProductQty,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
