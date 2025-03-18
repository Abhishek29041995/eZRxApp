part of 'checkout_bundle_item.dart';

class _AllMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const _AllMaterialItem({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: cartItem.bundle.materials
            .map((e) => _MaterialDetailsSection(cartItem: e))
            .toList(),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final MaterialInfo cartItem;
  const _MaterialDetailsSection({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.cartItemProductTile(cartItem.materialNumber.displayMatNo),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(cartProduct: cartItem),
          const SizedBox(width: 8),
          _MaterialDetails(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _MaterialImageSection({required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return CustomCard(
          showShadow: false,
          showBorder: true,
          child: CustomImage(
            imageUrl: state.additionInfo[cartProduct.materialNumber]
                    ?.productImages.first.thumbNail ??
                '',
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final MaterialInfo cartItem;
  const _MaterialDetails({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  cartItem.combinationCode(
                    showGMCPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableGMC,
                    showIRNPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableIRN,
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              const SizedBox(width: 4),
              PreOrderLabel(stockInfo: cartItem.productStockInfo),
            ],
          ),
          Text(
            cartItem.displayDescription,
            key: WidgetKeys.cartItemProductMaterialDescription,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
          StockInfoWidget(
            stockInfo: cartItem.bundleStockInfoValid,
            materialInfo: cartItem,
          ),
          Text(
            cartItem.getManufactured,
            key: WidgetKeys.cartItemProductPrincipalName,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.neutralsGrey1,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${context.tr('Qty')}: ${cartItem.quantity.getOrDefaultValue(0)}',
              key: WidgetKeys.cartItemProductQty,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
        ],
      ),
    );
  }
}
