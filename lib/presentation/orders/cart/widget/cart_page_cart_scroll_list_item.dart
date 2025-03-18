part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageScrollListItem extends StatelessWidget {
  const _CartPageScrollListItem({
    super.key,
    required this.showManufacturerName,
    required this.item,
  });

  final bool showManufacturerName;
  final PriceAggregate item;

  @override
  Widget build(BuildContext context) {
    if (item.materialInfo.type.typeCombo) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: CartProductCombo(
          cartItem: item,
          canEditable: true,
        ),
      );
    } else if (item.materialInfo.type.typeBundle) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CartProductBundle(
          cartItem: item,
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _CartProductMaterial(
          item: item,
          showManufacturerName: showManufacturerName,
        ),
      );
    }
  }
}

class _CartProductMaterial extends StatelessWidget {
  final PriceAggregate item;
  final bool showManufacturerName;

  const _CartProductMaterial({
    required this.item,
    required this.showManufacturerName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts,
      listener: (context, state) {
        if (context.read<EligibilityBloc>().state.isZDP5eligible) {
          final product = state.cartProducts.firstWhere(
            (element) =>
                element.materialInfo.materialNumber ==
                item.materialInfo.materialNumber,
            orElse: () => PriceAggregate.empty(),
          );
          if (product.isPriceUpdateAvailable) {
            context.read<MaterialPriceBloc>().add(
                  MaterialPriceEvent.fetchPriceForZDP5Materials(
                    materialInfo: product.materialInfo,
                  ),
                );
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showManufacturerName)
            _CartPageManufacturerName(cartProduct: item.materialInfo),
          CartProductTile(cartItem: item),
          if (item.sortedBonusList.isNotEmpty)
            ...item.sortedBonusList.map(
              (e) => CartProductTileBonus(
                bonusItem: e,
                cartProduct: item,
              ),
            ),
        ],
      ),
    );
  }
}

class _CartPageManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;

  const _CartPageManufacturerName({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    final manufacturer = cartProduct.getManufactured;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      key: WidgetKeys.cartPrincipalLabel,
      child: cartProduct.isMarketPlace
          ? MarketPlaceSellerTitle(sellerName: manufacturer)
          : Text(
              manufacturer,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
    );
  }
}
