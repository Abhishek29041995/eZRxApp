part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderProductTile extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PreOrderProductTile({required this.cartProduct});
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.preOrderMaterial(
        cartProduct.getMaterialNumber.displayMatNo,
        isBonus: cartProduct.materialInfo.type.typeDealOrOverrideBonus,
      ),
      margin: const EdgeInsets.only(bottom: _itemSpacing),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSection(cartProduct: cartProduct),
              const SizedBox(
                width: 8,
              ),
              _MaterialDetails(cartItem: cartProduct),
            ],
          ),
          if (cartProduct.materialInfo.type.typeDealOrOverrideBonus)
            Align(
              alignment: Alignment.centerRight,
              child: context.read<EligibilityBloc>().state.salesOrg.isID
                  ? PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: '0',
                    )
                  : Text(
                      context.tr('FREE'),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.textButtonColor,
                          ),
                    ),
            ),
        ],
      ),
    );
  }
}
