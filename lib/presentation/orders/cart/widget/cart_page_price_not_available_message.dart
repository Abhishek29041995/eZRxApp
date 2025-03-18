part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPagePriceNotAvailableMessage extends StatelessWidget {
  const _CartPagePriceNotAvailableMessage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayPriceNotAvailableMessage !=
          current.displayPriceNotAvailableMessage,
      builder: (context, state) => state.displayPriceNotAvailableMessage
          ? const PriceNotAvailableMessage(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            )
          : const SizedBox(),
    );
  }
}
