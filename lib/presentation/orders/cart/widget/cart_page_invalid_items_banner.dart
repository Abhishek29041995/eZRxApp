part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageInvalidItemsBanner extends StatelessWidget {
  const _CartPageInvalidItemsBanner();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.cartContainsSuspendedMaterials !=
              current.cartContainsSuspendedMaterials ||
          previous.cartContainsSuspendedPrincipal !=
              current.cartContainsSuspendedPrincipal ||
          previous.isMWPNotAllowedAndPresentInCart !=
              current.isMWPNotAllowedAndPresentInCart ||
          previous.isOOSAllowedIfPresentInCart !=
              current.isOOSAllowedIfPresentInCart ||
          previous.isComboNotAllowedIfPresentInCart !=
              current.isComboNotAllowedIfPresentInCart ||
          previous.displayInvalidItemsBanner !=
              current.displayInvalidItemsBanner,
      builder: (context, state) {
        if (!state.displayInvalidItemsBanner) {
          return const SizedBox.shrink();
        }

        return ColoredBox(
          key: WidgetKeys.cartPageInvalidItemsBanner,
          color: ZPColors.paleBlueGray,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.tr(
                    'The following items have been identified in your cart:',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                if (state.cartContainsSuspendedMaterials)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      context.tr('Suspended material'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                if (!state.isOOSAllowedIfPresentInCart)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      context.tr('Out of stock material'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                if (state.isMWPNotAllowedAndPresentInCart)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      context.tr('Material without price'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                if (state.cartContainsSuspendedPrincipal)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      context.tr('Principle suspended material'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                if (state.isComboNotAllowedIfPresentInCart)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      context.tr('Suspended combo'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                Text(
                  context.tr(
                    'Please review and remove these items from cart to proceed to check out.',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                _InvalidItemRemoveButton(
                  invalidItems: state.invalidCartItems,
                  invalidComboItems: state.invalidComboItems,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InvalidItemRemoveButton extends StatelessWidget {
  final List<MaterialInfo> invalidItems;
  final List<PriceAggregate> invalidComboItems;

  const _InvalidItemRemoveButton({
    required this.invalidItems,
    required this.invalidComboItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isClearing != current.isClearing ||
          previous.isUpserting != current.isUpserting,
      builder: (context, state) {
        return OutlinedButton(
          key: WidgetKeys.cartPageInvalidItemsBannerButton,
          onPressed: state.isClearing || state.isUpserting
              ? null
              : () {
                  final cartBloc = context.read<CartBloc>();
                  if (invalidComboItems.isNotEmpty) {
                    cartBloc.add(
                      CartEvent.upsertCartItemsWithComboOffers(
                        priceAggregates: invalidComboItems,
                        isDeleteCombo: true,
                      ),
                    );
                  }
                  if (invalidItems.isNotEmpty) {
                    cartBloc.add(
                      CartEvent.removeInvalidProducts(
                        invalidCartItems: invalidItems,
                      ),
                    );
                  }
                },
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: const WidgetStatePropertyAll(
                  ZPColors.paleBlueGray,
                ),
                side: const WidgetStatePropertyAll(
                  BorderSide(
                    color: ZPColors.primary,
                  ),
                ),
              ),
          child: LoadingShimmer.withChild(
            enabled: state.isClearing || state.isUpserting,
            child: Text(
              context.tr('Remove items'),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.primary),
            ),
          ),
        );
      },
    );
  }
}
