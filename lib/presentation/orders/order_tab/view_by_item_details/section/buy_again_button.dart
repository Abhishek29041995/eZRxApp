part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class _BuyAgainButton extends StatelessWidget {
  const _BuyAgainButton();

  @override
  Widget build(BuildContext context) {
    final isCustomerBlockedOrSuspended =
        context.read<EligibilityBloc>().state.customerBlockOrSuspended;

    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain && !current.isBuyAgain,
      listener: (context, state) {
        if (!context.routeData.isActive) return;
        state.apiFailureOrSuccessOption.fold(
          () {
            context.router.push(
              CartPageRoute(
                isReOrder: true,
                deliveryInfo: DeliveryInfoData.empty().copyWith(
                  mobileNumber: context
                      .read<ViewByItemDetailsBloc>()
                      .state
                      .orderHistorySelectedItem
                      .telephoneNumber,
                ),
              ),
            );
          },
          (either) => either.fold(
            (failure) {
              _handleCartFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain,
      builder: (context, stateCart) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching &&
                !current.isFetching,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {
                  context.read<CartBloc>().add(
                        CartEvent.addHistoryItemsToCart(
                          items: state.validOrderItems,
                          counterOfferDetails:
                              RequestCounterOfferDetails.empty(),
                          tenderContractList: state.availableTenderContract,
                        ),
                      );
                },
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {},
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, reOrderState) => SafeArea(
              child: OutlinedButton(
                key: WidgetKeys.viewByItemDetailBuyAgainButton,
                style: OutlinedButton.styleFrom(
                  maximumSize: const Size(double.maxFinite, 45),
                ),
                onPressed: reOrderState.isFetching ||
                        isCustomerBlockedOrSuspended ||
                        stateCart.isBuyAgain
                    ? null
                    : () => _reOrder(context),
                child: LoadingShimmer.withChild(
                  enabled: reOrderState.isFetching || stateCart.isBuyAgain,
                  child: Text(
                    context.tr('Buy again'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleCartFailure(BuildContext context, ApiFailure failure) {
    if (failure == const ApiFailure.addAnimalHealthWithNormalProductToCart()) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (_) {
          return AddToCartErrorSection.forAnimalHealth(
            context: context,
          );
        },
      ).then((value) {
        if (value != null) {
          _reOrder(context);
        }
      });
    }
  }

  void _reOrder(BuildContext context) {
    final viewByItemDetailState = context.read<ViewByItemDetailsBloc>().state;
    final cartState = context.read<CartBloc>().state;
    final cartProducts = cartState.cartProducts;
    final isTenderEligible = context
        .read<EligibilityBloc>()
        .state
        .salesOrgConfigs
        .enableTenderOrders;
    if (isTenderEligible &&
        viewByItemDetailState.orderHistory.isNotValidTenderContract) {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        key: WidgetKeys.viewByOrderBuyAgainTenderErrorSnackBar,
        messageText: context.tr(
          'Tender Contract is no longer available and could not be added to cart.',
        ),
      ).show(context);

      return;
    }
    if (cartProducts.isEmpty) {
      _buyAgain(context);

      return;
    }
    final tenderContractValidationMsg = _checkValidTenderContractAndReturnMsg(
      context: context,
      orderHistory: viewByItemDetailState.orderHistory,
    );
    if (isTenderEligible && tenderContractValidationMsg.isNotEmpty) {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        key: WidgetKeys.viewByItemDetailBuyAgainTenderErrorSnackBar,
        messageText: tenderContractValidationMsg,
      ).show(context);

      return;
    }

    final isCovidMaterialAvailable =
        viewByItemDetailState.orderHistory.isCovidMaterialAvailable;
    final containFocMaterialInCartProduct =
        cartState.containFocMaterialInCartProduct;

    if ((isCovidMaterialAvailable && !containFocMaterialInCartProduct) ||
        (!isCovidMaterialAvailable && containFocMaterialInCartProduct)) {
      _showDetailsPage(context);

      return;
    }

    _buyAgain(context);
  }

  void _buyAgain(BuildContext context) {
    final viewByItemDetailState = context.read<ViewByItemDetailsBloc>().state;
    final item = viewByItemDetailState.orderHistorySelectedItem;

    trackMixpanelEvent(
      TrackingEvents.buyAgainClicked,
      props: {
        TrackingProps.productName: item.defaultMaterialDescription,
        TrackingProps.productNumber: item.materialNumber.displayMatNo,
        TrackingProps.productManufacturer:
            item.principalData.principalName.getOrDefaultValue(''),
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    trackClevertapEvent(
      TrackingEvents.reorderClicked,
      props: {
        TrackingProps.productName: item.defaultMaterialDescription,
        TrackingProps.productNumber: item.materialNumber.displayMatNo,
        TrackingProps.productManufacturer:
            item.principalData.principalName.getOrDefaultValue(''),
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    context.read<ReOrderPermissionBloc>().add(
          ReOrderPermissionEvent.fetchItem(
            orderHistoryDetail: viewByItemDetailState.orderHistory,
            item: item,
          ),
        );
  }

  String _checkValidTenderContractAndReturnMsg({
    required BuildContext context,
    required OrderHistory orderHistory,
  }) {
    final cartProducts = context.read<CartBloc>().state.cartProducts;
    final tenderOrderReason = orderHistory.getTenderReason;
    final containsTenderContract = orderHistory.isTenderContractAvailable;

    if (!containsTenderContract && !cartProducts.hasTenderContract) {
      return '';
    } else if (!containsTenderContract && cartProducts.hasTenderContract) {
      return context.tr(
        'Other materials cannot be ordered while materials from the {reason} tender contract are in your cart. By proceeding, your current cart will be cleared.',
        namedArgs: {'reason': cartProducts.tenderReasons.join(', ')},
      );
    } else {
      if (containsTenderContract &&
          (cartProducts.hasNonTenderContractMaterials ||
              (!cartProducts.hasTenderContractWithReason730 &&
                  tenderOrderReason.is730))) {
        return context.tr(
          'Materials from the {reason} tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.',
          namedArgs: {
            'reason': tenderOrderReason.displayTenderContractReason,
          },
        );
      } else if (containsTenderContract &&
          (cartProducts.hasTenderContractWithReason730 &&
              !tenderOrderReason.is730)) {
        return context.tr(
          'Other materials cannot be ordered while materials from the {reason} tender contract are in your cart. By proceeding, your current cart will be cleared.',
          namedArgs: {'reason': '730'},
        );
      }

      return '';
    }
  }

  void _showDetailsPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return AddToCartErrorSection.forCovid(
          cartContainsFocProduct:
              context.read<CartBloc>().state.containFocMaterialInCartProduct,
          context: context,
        );
      },
    ).then((value) {
      if (value != null) {
        context.read<CartBloc>().add(
              CartEvent.addHistoryItemsToCart(
                items:
                    context.read<ReOrderPermissionBloc>().state.validOrderItems,
                counterOfferDetails: RequestCounterOfferDetails.empty(),
                tenderContractList: {},
              ),
            );
      }
    });
  }
}
