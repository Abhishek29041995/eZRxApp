part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _ProductScrollList extends StatelessWidget {
  final List<PriceAggregate> listItems;
  const _ProductScrollList({required this.listItems});

  @override
  Widget build(BuildContext context) {
    final listDisplayItem = listItems.sortToDisplay;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          final item = listDisplayItem[index];
          final isDifferentSeller = listDisplayItem.showManufacturerName(index);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.materialInfo.type.typeBundle)
                CheckoutBundleItem(
                  key: WidgetKeys.cartItemBundleTile(
                    item.bundle.bundleCode,
                  ),
                  cartItem: item,
                ),
              if (item.materialInfo.type.typeMaterial)
                _CheckoutProductMaterialWithBonus(
                  cartItem: item,
                  isDifferentSeller: isDifferentSeller,
                  isFirst: index == 0,
                ),
              if (item.materialInfo.type.typeCombo)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: CartProductCombo(cartItem: item),
                ),
            ],
          );
        },
        childCount: listDisplayItem.length, // 1000 list items
      ),
    );
  }
}

class _CheckoutProductMaterialWithBonus extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isDifferentSeller;
  final bool isFirst;

  const _CheckoutProductMaterialWithBonus({
    required this.cartItem,
    required this.isDifferentSeller,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.checkoutMaterialWithBonusItem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDifferentSeller)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isFirst && !cartItem.materialInfo.isMarketPlace)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: _Divider(),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: cartItem.materialInfo.isMarketPlace
                    ? MarketPlaceSellerTitle(
                        sellerName: cartItem.materialInfo.getManufactured,
                      )
                    : _ZPTitleScrollList(
                        cartProduct: cartItem.materialInfo,
                      ),
              ),
            ],
          ),
        CheckoutMaterialItem(
          cartItem: cartItem,
        ),
        if (cartItem.sortedBonusList.isNotEmpty)
          ...cartItem.sortedBonusList.map(
            (e) => _CheckoutProductBonusItem(
              bonusItem: e,
              cartProduct: cartItem,
            ),
          ),
      ],
    );
  }
}

class _ZPTitleScrollList extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _ZPTitleScrollList({required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Text(
      cartProduct.getManufactured,
      key: WidgetKeys.cartPrincipalLabel,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ZPColors.neutralsBlack,
          ),
    );
  }
}

class _DividerAndMarketPlaceTitle extends StatelessWidget {
  final bool showDivider;

  const _DividerAndMarketPlaceTitle({required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: _Divider(),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: MarketPlaceTitleWithLogo(showToolTip: true),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ZPColors.lightGray2,
      indent: 15,
      endIndent: 15,
      height: 10,
      thickness: 1,
    );
  }
}
