part of 'checkout_bundle_item.dart';

class _BundleDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _BundleDetailsSection({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final currentBundleOffer = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(cartItem.bundle.bundleCode))
        .bundle
        .currentBundleInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.bundle.bundleCode,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
  
        RichText(
          key: WidgetKeys.cartItemBundleName,
          text: TextSpan(
            children: [
              if (cartItem.materialInfo.isMarketPlace) ...[
                WidgetSpan(
                  child: MarketPlaceLogo.medium(),
                  alignment: PlaceholderAlignment.middle,
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
              ],
              TextSpan(
                text: cartItem.bundle.bundleName.name,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
            if (cartItem.bundle.showStrikeThroughPrice)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: PriceComponent(
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.bundle.minimumQuantityBundleMaterial.rate
                      .toString(),
                  trailingText: context.tr('per item'),
                  type: PriceStyle.bundleListPriceStrikeThrough,
                ),
              ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: currentBundleOffer.rate.toString(),
              type: PriceStyle.bundleCartPrice,
              trailingText: context.tr('per item'),
              key: WidgetKeys.addBundleRate,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${context.tr('Purchase')} ${currentBundleOffer.quantity} ${context.tr('or more for')} ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
          key: WidgetKeys.cartItemBundleRate,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.neutralsGrey1,
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }
}
