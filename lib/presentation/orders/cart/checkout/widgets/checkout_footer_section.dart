part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _CheckoutFooterSection extends StatelessWidget {
  final CartState cartState;
  final Map<DeliveryInfoLabel, FocusNode> focusNode;
  const _CheckoutFooterSection({
    required this.cartState,
    required this.focusNode,
  });

  void _scrollToFocusedObject({required FocusNode focusNode}) {
    focusNode.requestFocus();
    if (focusNode.context == null) return;
    Scrollable.ensureVisible(
      focusNode.context!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          indent: 0,
          thickness: 1,
          endIndent: 0,
          height: 1,
          color: ZPColors.extraLightGrey2,
        ),
        PriceSummaryTile(
          cartState: cartState,
          isCheckoutPage: context.router.current.name == CheckoutPageRoute.name,
        ),
        if (context
            .read<OrderEligibilityBloc>()
            .state
            .displayPriceNotAvailableMessage)
          const PriceNotAvailableMessage(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          ),
        SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: BlocConsumer<AdditionalDetailsBloc, AdditionalDetailsState>(
              listenWhen: (previous, current) =>
                  previous.isValidated != current.isValidated ||
                  previous.focusTo != current.focusTo,
              listener: (context, state) {
                if (state.isValidated) {
                  final cartState = context.read<CartBloc>().state;
                  final orderEligibilityState =
                      context.read<OrderEligibilityBloc>().state;
                  context.read<OrderSummaryBloc>().add(
                        OrderSummaryEvent.submitOrder(
                          cartProducts: cartState.cartProducts,
                          grandTotal:
                              cartState.totalPriceWithTaxExcludeSmallOrderFees,
                          orderValue:
                              cartState.subTotalHidePriceMaterialForSubmission,
                          aplSmallOrderFee:
                              cartState.aplSimulatorOrder.smallOrderFee,
                          mpSmallOrderFee:
                              orderEligibilityState.mpSmallOrderFee,
                          zpSmallOrderFee:
                              orderEligibilityState.zpSmallOrderFee,
                          totalTax: cartState.totalTaxForSubmission,
                          data: context
                              .read<AdditionalDetailsBloc>()
                              .state
                              .deliveryInfoData,
                          salesRepAuthorizedDetails: orderEligibilityState
                              .getSalesRepAuthorizedDetails,
                          deliveryOption:
                              orderEligibilityState.submittedDeliveryOption,
                        ),
                      );
                } else {
                  if (state.focusTo != null) {
                    _scrollToFocusedObject(
                      focusNode: focusNode[state.focusTo]!,
                    );
                  }
                }
              },
              buildWhen: (previous, current) =>
                  previous.showErrorMessages != current.showErrorMessages,
              builder: (context, additionalDetailsState) {
                return BlocConsumer<OrderSummaryBloc, OrderSummaryState>(
                  listenWhen: (previous, current) =>
                      previous.isSubmitting != current.isSubmitting,
                  listener: (context, state) {
                    state.apiFailureOrSuccessOption.fold(
                      () {
                        if (!state.isSubmitting) {
                          context.read<OrderSummaryBloc>().add(
                                OrderSummaryEvent.orderConfirmationDetail(
                                  priceAggregate: context
                                      .read<CartBloc>()
                                      .state
                                      .cartProducts,
                                ),
                              );
                          context.read<PoAttachmentBloc>().add(
                                const PoAttachmentEvent.initialized(),
                              );
                          context.read<AdditionalDetailsBloc>().add(
                                AdditionalDetailsEvent.initialized(
                                  config: context
                                      .read<EligibilityBloc>()
                                      .state
                                      .salesOrgConfigs,
                                  customerCodeInfo: context
                                      .read<EligibilityBloc>()
                                      .state
                                      .customerCodeInfo,
                                ),
                              );

                          context.router.pushAndPopUntil(
                            const OrderSuccessPageRoute(),
                            predicate: (Route route) =>
                                route.settings.name ==
                                HomeNavigationTabbarRoute.name,
                          );
                        }
                      },
                      (either) => either.fold(
                        (failure) {
                          trackMixpanelEvent(
                            TrackingEvents.placeOrderFailure,
                            props: {
                              TrackingProps.errorMessage: context.tr(
                                failure.failureMessage.message,
                                namedArgs: failure.failureMessage.arguments,
                              ),
                            },
                          );
                          ErrorUtils.handleStockInfoApiFailure(
                            context,
                            failure,
                          );
                        },
                        (_) {},
                      ),
                    );
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (additionalDetailsState.showErrorMessages)
                          const _ValidationsFailedWarning(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            key: WidgetKeys.checkoutButton,
                            onPressed: state.isSubmitting ||
                                    cartState.isCartDetailsFetching
                                ? null
                                : () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    context.read<AdditionalDetailsBloc>().add(
                                          const AdditionalDetailsEvent
                                              .validateForm(),
                                        );
                                  },
                            child: LoadingShimmer.withChild(
                              enabled: state.isSubmitting ||
                                  cartState.isCartDetailsFetching,
                              child: Text(context.tr('Place order')),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ValidationsFailedWarning extends StatelessWidget {
  const _ValidationsFailedWarning();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: ZPColors.lightRedStatusColor,
      ),
      child: Text(
        context.tr('Please ensure all required fields are filled.'),
        style: Theme.of(context).textTheme.bodySmall,
        key: WidgetKeys.errorRequirementsFillAllField,
      ),
    );
  }
}
