part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _ManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _ManufacturerName({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.cartPrincipalLabel,
      children: [
        if (cartProduct.isMarketPlace)
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: MarketPlaceLogo(),
          ),
        Text(
          cartProduct.getManufactured,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ],
    );
  }
}
