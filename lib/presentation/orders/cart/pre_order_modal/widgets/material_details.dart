part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _MaterialDetails({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4,
            children: [
              Text(
                cartItem.materialInfo.combinationCode(
                  showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                  showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              if (eligibilityState.salesOrg.showBonus &&
                  cartItem.materialInfo.type.typeDealOrOverrideBonus)
                const BonusTag(margin: EdgeInsets.only(left: 4)),
              const SizedBox(
                width: 4,
              ),
              if (!eligibilityState.salesOrgConfigs.hideStockDisplay)
                StatusLabel(
                  status: StatusType('OOS-Preorder'),
                ),
            ],
          ),
          Text(
            cartItem.materialInfo.displayDescription,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          StockInfoWidget(
            materialInfo: cartItem.materialInfo,
            stockInfo: cartItem.stockInfo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cartItem.materialInfo.type.typeMaterial) ...[
                Row(
                  children: [
                    ListPriceStrikeThroughComponent(priceAggregate: cartItem),
                    PriceComponent(
                      key: WidgetKeys.preOrderModalItemFinalPrice,
                      salesOrgConfig: eligibilityState.salesOrgConfigs,
                      price: cartItem.display(PriceType.finalPrice),
                      type: PriceStyle.cartMaterialUnitPrice,
                    ),
                  ],
                ),
              ],
              Text(
                '${"Qty: ".tr()}${cartItem.quantity.toString()}',
                key: WidgetKeys.preOrderMaterialQty,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          if (cartItem.materialInfo.type.typeMaterial)
            GovtListPriceComponent(
              price: cartItem.display(PriceType.listPrice),
            ),
        ],
      ),
    );
  }
}
