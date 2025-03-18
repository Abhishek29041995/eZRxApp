part of 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';

class PriceSummarySection extends StatelessWidget {
  final CartState cartState;
  final TextStyle? titleStyle;
  final double? titleSpacing;

  const PriceSummarySection({
    super.key,
    required this.cartState,
    this.titleSpacing,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final isCheckoutPage =
        context.router.current.name == CheckoutPageRoute.name;
    final smallOrderFeeForExtSalesRep =
        orderEligibilityState.smallOrderFeeForExtSalesRep && !isCheckoutPage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Order summary'),
          style: titleStyle ??
              Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
        ),
        SizedBox(height: titleSpacing ?? 24.0),
        if (cartState.cartProducts.containMPMaterial) ...[
          Row(
            key: WidgetKeys.checkoutSummaryZPSubTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ZP ${context.tr(
                  'Subtotal (${salesOrgConfig.displayPrefixTax}.tax)',
                )}:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              PriceDisplayWidget(
                priceComponent: PriceComponent(
                  salesOrgConfig: salesOrgConfig,
                  price: cartState.zpSubTotalHidePriceMaterial.toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            key: WidgetKeys.checkoutSummaryMPSubTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MP ${context.tr(
                  'Subtotal (${salesOrgConfig.displayPrefixTax}.tax)',
                )}:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              PriceDisplayWidget(
                priceComponent: PriceComponent(
                  salesOrgConfig: salesOrgConfig,
                  price: cartState.mpSubTotalHidePriceMaterial.toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        Row(
          key: WidgetKeys.checkoutSummarySubTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                '${context.tr(
                  'Subtotal (${salesOrgConfig.displayPrefixTax}.tax)',
                )}:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
            ),
            PriceDisplayWidget(
              priceComponent: PriceComponent(
                salesOrgConfig: salesOrgConfig,
                price: cartState.subTotalPriceDisplay(
                  displayIDPriceOnCheckout: isCheckoutPage,
                ),
                type: PriceStyle.summaryPrice,
              ),
            ),
          ],
        ),
        if (salesOrgConfig.displaySubtotalTaxBreakdown)
          _TaxWidget(cartState: cartState),
        if (orderEligibilityState.smallOrderFeeApplied ||
            smallOrderFeeForExtSalesRep)
          SmallOrderFee(
            value: orderEligibilityState.showSmallOrderFeeForID
                ? cartState.aplSmallOrderFees(
                    displayIDPriceOnCheckout:
                        context.router.current.name == CheckoutPageRoute.name,
                  )
                : orderEligibilityState.smallOrderFee,
          ),
        const SizedBox(height: 4.0),
        const Divider(
          thickness: 1,
          color: ZPColors.extraLightGrey3,
          indent: 0,
          endIndent: 0,
        ),
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryGrandTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.tr('Grand total')}: ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceDisplayWidget(
              priceComponent: PriceComponent(
                key: WidgetKeys.checkoutSummaryGrandTotalPrice,
                salesOrgConfig: salesOrgConfig,
                price: cartState
                    .grandTotalPriceDisplayed(
                      smallOrderFee: orderEligibilityState.smallOrderFee,
                      deliveryFee: orderEligibilityState.deliveryFee,
                      displayIDPriceOnCheckout: isCheckoutPage,
                    )
                    .toString(),
                type: PriceStyle.totalPrice,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        if (cartState.salesOrganisation.salesOrg.showTotalSaving)
          Row(
            key: WidgetKeys.checkoutSummaryTotalSaving,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Total savings')}:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              PriceDisplayWidget(
                priceComponent: PriceComponent(
                  salesOrgConfig: salesOrgConfig,
                  price: cartState.totalSavingDisplayed(
                    displayPriceOnCheckout: isCheckoutPage,
                  ),
                  type: PriceStyle.summaryPrice,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _TaxWidget extends StatelessWidget {
  const _TaxWidget({required this.cartState});
  final CartState cartState;
  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      key: WidgetKeys.checkoutSummaryTax,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.tr(cartState.salesOrganisation.salesOrg.taxTitle)}${cartState.taxTitlePercent}:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceDisplayWidget(
              priceComponent: PriceComponent(
                key: WidgetKeys.checkoutSummaryTaxPrice,
                salesOrgConfig: salesOrgConfig,
                price: cartState.totalTaxDisplayed(
                  displayIDPriceOnCheckout:
                      context.router.current.name == CheckoutPageRoute.name,
                ),
                type: PriceStyle.summaryPrice,
              ),
            ),
          ],
        ),
        if (cartState.salesOrganisation.salesOrg.showTaxDescription)
          Text(
            context.tr('Applies to materials with full tax'),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
          ),
      ],
    );
  }
}
