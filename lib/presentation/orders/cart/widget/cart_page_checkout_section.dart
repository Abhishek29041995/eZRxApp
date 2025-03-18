part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageCheckoutSection extends StatelessWidget {
  const _CartPageCheckoutSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isCartDetailsFetching != current.isCartDetailsFetching,
      builder: (context, state) {
        return Column(
          children: [
            const Divider(
              color: ZPColors.lightGray2,
              indent: 0,
              endIndent: 0,
              height: 15,
            ),
            ListTile(
              key: WidgetKeys.summaryInfoButton,
              onTap: () => _showSumaryInfo(context),
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text(
                '${context.tr("Order for")} ${context.read<EligibilityBloc>().state.customerCodeInfo.customerName}',
                key: WidgetKeys.cartShipToAddress,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            if (!state.isCartDetailsFetching) const _CartPageInfoLabel(),
            PriceSummaryTile(cartState: state),
            if (!state.isCartDetailsFetching)
              const _CartPagePriceNotAvailableMessage(),
            const _CartPageCheckoutButton(),
          ],
        );
      },
    );
  }

  void _showSumaryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => SafeArea(
        key: WidgetKeys.cartShipToAddressSheet,
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              AddressInfoSection.order(),
              const PayerInformation(expanded: true),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: WidgetKeys.cartShipToAddressSheetCloseButton,
                  onPressed: () {
                    context.router.maybePop();
                  },
                  child: Text(
                    context.tr('Close'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartPageCheckoutButton extends StatelessWidget {
  const _CartPageCheckoutButton();

  @override
  Widget build(BuildContext context) {
    final isPriceFetching =
        context.select((MaterialPriceBloc bloc) => bloc.state.isFetching);
    final isCartFetching =
        context.select((CartBloc bloc) => bloc.state.isCartDetailsFetching);
    final isCheckoutDisabled = context
        .select((OrderEligibilityBloc bloc) => bloc.state.isCheckoutDisabled);
    final isFetching = isPriceFetching || isCartFetching;

    return SafeArea(
      child: LoadingShimmer.withChild(
        enabled: isFetching,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ElevatedButton(
            style: isCheckoutDisabled
                ? ButtonStyle(
                    elevation: WidgetStateProperty.resolveWith(
                      (_) => 0,
                    ),
                    overlayColor: WidgetStateProperty.resolveWith(
                      (_) => Colors.transparent,
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith(
                      (_) => ZPColors.white,
                    ),
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (_) => ZPColors.elevatedDisableColor,
                    ),
                    splashFactory: NoSplash.splashFactory,
                  )
                : null,
            key: WidgetKeys.checkoutButton,
            onPressed: isFetching ||
                    context.read<EligibilityBloc>().state.disableCreateOrder
                ? null
                : () => _onCheckOutPressed(context),
            child: Text(context.tr('Check out')),
          ),
        ),
      ),
    );
  }

  Future _showAgreeToSmallOrderFeeModal({
    required BuildContext context,
  }) {
    return context.router.push(const SmallOrderFeePageRoute());
  }

  void _showPreOrderModal({required BuildContext context}) {
    final cartState = context.read<CartBloc>().state;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      builder: (_) => const PreOrderModal(),
    ).then(
      (value) {
        if (value == null) return;
        _navigateToCheckout(context, cartState);
      },
    );
  }

  Future<void> _onCheckOutPressed(BuildContext context) async {
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final cartState = context.read<CartBloc>().state;

    if (!orderEligibilityState.isCheckoutDisabled) {
      FocusScope.of(context).requestFocus(FocusNode());
      if (cartState.showSmallOrderFeeBottomSheet ||
          orderEligibilityState.agreeSmallOrderFeeForExtSalesRep ||
          orderEligibilityState.smallOrderFee > 0) {
        final agreeToSmallOrderFee =
            await _showAgreeToSmallOrderFeeModal(context: context);
        if (agreeToSmallOrderFee == null || !context.mounted) return;
      }

      final preOrderItemExist = cartState.cartProducts.preOrderItems.isNotEmpty;
      if (preOrderItemExist) {
        _showPreOrderModal(context: context);
      } else {
        _navigateToCheckout(context, cartState);
      }
    } else {
      trackMixpanelEvent(
        TrackingEvents.checkoutFailure,
        props: {
          TrackingProps.grandTotal: cartState.grandTotalPriceDisplayed(
            smallOrderFee: orderEligibilityState.smallOrderFee,
            deliveryFee: orderEligibilityState.deliveryFee,
          ),
          TrackingProps.totalQty: cartState.totalCartCount,
          TrackingProps.errorMessage:
              orderEligibilityState.orderEligibleTrackingErrorMessage,
        },
      );
    }
    if (context.mounted) {
      context.read<OrderEligibilityBloc>().add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
    }
  }

  void _navigateToCheckout(BuildContext context, CartState cartState) {
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    trackMixpanelEvent(
      TrackingEvents.checkoutSuccess,
      props: {
        TrackingProps.grandTotal: cartState.grandTotalPriceDisplayed(
          smallOrderFee: orderEligibilityState.smallOrderFee,
          deliveryFee: orderEligibilityState.deliveryFee,
        ),
        TrackingProps.totalQty: cartState.totalCartCount,
        TrackingProps.cart:
            cartState.cartProducts.cartMaterialInfoListForTrackEvent,
      },
    );

    if (cartState.salesOrganisation.salesOrg.isID) {
      context.read<CartBloc>().add(
            const CartEvent.updatePriceForIdMarket(),
          );
    }
    context.router.push(const CheckoutPageRoute());
  }
}
