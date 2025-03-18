part of 'checkout_bundle_item.dart';

class _TotalQtySection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _TotalQtySection({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    final currentBundle = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(cartProduct.bundle.bundleCode))
        .bundle;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.tr('Total qty')}: ${currentBundle.totalQty.toString()}',
          key: WidgetKeys.cartItemBundleQty,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        PriceComponent(
          key: WidgetKeys.cartItemBundleTotalPrice,
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: currentBundle.totalPrice.toString(),
        ),
      ],
    );
  }
}
