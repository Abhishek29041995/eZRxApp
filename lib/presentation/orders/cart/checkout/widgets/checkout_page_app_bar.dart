part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _CheckoutPageAppbar extends AppBar {
  final BuildContext context;
  final bool enableOrderType;

  _CheckoutPageAppbar({
    required this.context,
    required this.enableOrderType,
  }) : super(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          toolbarHeight:
              kToolbarHeight + (enableOrderType ? OrderTypeBanner.height : 0),
          title: Column(
            children: [
              const OrderTypeBanner(padding: EdgeInsets.only(left: padding12)),
              Row(
                children: [
                  const SizedBox(width: padding6),
                  IconButton(
                    key: WidgetKeys.closeButton,
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => context.router.maybePop(),
                  ),
                  Expanded(
                    child: Text(
                      context.tr('Checkout'),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
}
