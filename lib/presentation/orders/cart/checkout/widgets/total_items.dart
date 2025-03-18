part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _TotalItems extends StatelessWidget {
  const _TotalItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '${context.tr('Your items')} (${context.read<CartBloc>().state.totalCartCount})',
        key: WidgetKeys.checkoutItemsTotalQty,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: ZPColors.neutralsBlack),
      ),
    );
  }
}
