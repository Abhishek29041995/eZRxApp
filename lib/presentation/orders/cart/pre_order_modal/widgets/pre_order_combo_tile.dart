part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderComboTile extends StatelessWidget {
  final PriceAggregate cartItem;

  const _PreOrderComboTile({required this.cartItem});

  ComboDealScheme get _comboScheme =>
      cartItem.comboMaterials.firstOrNull?.getScheme(cartItem.comboMaterials) ??
          ComboDealScheme.k1;

  PriceComboDeal get _priceComboDeal =>
      cartItem.comboMaterials.firstOrNull?.comboDeals ?? PriceComboDeal.empty();

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig = context.read<EligibilityBloc>().state;

    return CustomCard(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        extentRatio: 0.24,
        key: WidgetKeys.preOrderCombo(_priceComboDeal.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ProductTag.comboOffer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(
                      _comboScheme.comboDealTitleAppbar,
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    _comboScheme.getRequirementMessage(
                      context,
                      minAmountK5: _getMinAmountComboDealK5(context),
                      minQty: _getMinQtyComboDeal(context),
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
                  ),
                  if (!salesOrgConfig.comboDealEligible)
                    ErrorTextWithIcon(
                      valueText: context.tr('Combo suspended'),
                    ),
                  const SizedBox(height: 8),
                  ...cartItem.comboMaterials.getOutOfStockComboMaterialList.map(
                        (e) => CartProductComboItem(
                      key: WidgetKeys.cartItemProductTile(
                        e.materialInfo.materialNumber.displayMatNo,
                      ),
                      comboMaterialItem: e,
                      comboScheme: _comboScheme,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ComboDeal _getComboDeal(BuildContext context) {
    return context
        .read<ComboDealListBloc>()
        .state
        .getComboDeal(
      comboDealId: _priceComboDeal.id,
    );
  }

  String _getMinAmountComboDealK5(BuildContext context) {
    return (_getComboDeal(context).sortedMinTotalAmountTiers
        .firstOrNull?.minTotalAmount ?? 0).toString();
  }

  String _getMinQtyComboDeal(BuildContext context) {
    return _getComboDeal(context)
        .schemeMinimumQtyRequirement;
  }
}
