part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageAppBar extends AppBar {
  final BuildContext context;
  final CartState state;
  final bool enableOrderType;
  final bool isCustomerBlocked;

  _CartPageAppBar({
    required this.context,
    required this.state,
    required this.enableOrderType,
    required this.isCustomerBlocked,
  }) : super(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: kToolbarHeight +
              (enableOrderType ? OrderTypeBanner.height : 0) +
              (isCustomerBlocked ? CustomerBlockedBanner.height : 0),
          title: Column(
            children: [
              if (enableOrderType)
                const OrderTypeBanner(
                  padding: EdgeInsets.only(left: padding12),
                ),
              Row(
                children: [
                  IconButton(
                    key: WidgetKeys.closeButton,
                    icon: const Icon(Icons.close),
                    onPressed: () => context.router.removeUntil(
                      (route) => route.path != '/orders/cart',
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${context.tr('Cart')} (${state.totalCartCount})',
                      key: WidgetKeys.cartPageAppBarTitle,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  if (state.cartProducts.isNotEmpty)
                    state.isClearing
                        ? IconButton(
                            onPressed: null,
                            icon: LoadingAnimationWidget.horizontalRotatingDots(
                              key: WidgetKeys.soaLoadingAnimationWidgetKey,
                              color: ZPColors.red,
                              size: 24,
                            ),
                          )
                        : IconButton(
                            key: WidgetKeys.cartClearButton,
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: ZPColors.red,
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                    const CartEvent.clearCart(),
                                  );
                            },
                          ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: CustomerBlockedBanner(isCustomerBlocked: isCustomerBlocked),
          ),
        );
}
