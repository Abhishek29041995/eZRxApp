part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;
  const BuyAgainButton({
    super.key,
    required this.viewByOrderHistoryItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain && !current.isBuyAgain,
      listener: (context, state) {
        if (viewByOrderHistoryItem.orderNumber !=
                context
                    .read<ReOrderPermissionBloc>()
                    .state
                    .orderNumberWillUpsert ||
            !context.routeData.isActive) return;
        context.read<ReOrderPermissionBloc>().add(
              ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                orderNumberWillUpsert: OrderNumber(''),
              ),
            );

        state.apiFailureOrSuccessOption.fold(
          () {
            context.router.push(
              CartPageRoute(
                isReOrder: true,
                deliveryInfo: DeliveryInfoData.empty().copyWith(
                  mobileNumber: viewByOrderHistoryItem.telephoneNumber,
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
          previous.isBuyAgain != current.isBuyAgain ||
          previous.isFetching != current.isFetching ||
          previous.isUpserting != current.isUpserting,
      builder: (context, stateCart) {
        return BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching &&
              !current.isFetching &&
              current.orderNumberWillUpsert ==
                  viewByOrderHistoryItem.orderNumber,
          listener: (context, reOrderState) {
            reOrderState.failureOrSuccessOption.fold(
              () {
                context.read<CartBloc>().add(
                      CartEvent.addHistoryItemsToCart(
                        items: reOrderState.validOrderItems,
                        counterOfferDetails: RequestCounterOfferDetails.empty(),
                        tenderContractList:
                            reOrderState.availableTenderContract,
                      ),
                    );
              },
              (either) => either.fold(
                (failure) {
                  context.read<ReOrderPermissionBloc>().add(
                        ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                          orderNumberWillUpsert: OrderNumber(''),
                        ),
                      );
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.orderNumberWillUpsert != current.orderNumberWillUpsert,
          builder: (context, state) {
            final isCustomerBlockedOrSuspended =
                context.read<EligibilityBloc>().state.customerBlockOrSuspended;

            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(double.maxFinite, 45),
              ),
              onPressed: (state.orderNumberWillUpsert ==
                          viewByOrderHistoryItem.orderNumber ||
                      stateCart.isUpserting ||
                      stateCart.isFetching ||
                      isCustomerBlockedOrSuspended)
                  ? null
                  : () => _reOrder(context),
              child: LoadingShimmer.withChild(
                enabled: state.orderNumberWillUpsert ==
                        viewByOrderHistoryItem.orderNumber &&
                    (stateCart.isBuyAgain ||
                        stateCart.isUpserting ||
                        stateCart.isFetching),
                child: Text(
                  'Buy again'.tr(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _reOrder(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final cartProducts = cartState.cartProducts;
    final isTenderEligible = context
        .read<EligibilityBloc>()
        .state
        .salesOrgConfigs
        .enableTenderOrders;
    if (isTenderEligible && viewByOrderHistoryItem.isNotValidTenderContract) {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        key: WidgetKeys.viewByOrderBuyAgainTenderErrorSnackBar,
        messageText: context.tr(
          'Tender Contract is no longer available for one or few item(s) and could not be added to cart.',
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
      orderHistory: viewByOrderHistoryItem,
    );
    if (isTenderEligible && tenderContractValidationMsg.isNotEmpty) {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        key: WidgetKeys.viewByOrderBuyAgainTenderErrorSnackBar,
        messageText: tenderContractValidationMsg,
      ).show(context);

      return;
    }

    final isCovidMaterialAvailable =
        viewByOrderHistoryItem.isCovidMaterialAvailable;
    final containFocMaterialInCartProduct =
        cartState.containFocMaterialInCartProduct;

    if ((isCovidMaterialAvailable && !containFocMaterialInCartProduct) ||
        (!isCovidMaterialAvailable && containFocMaterialInCartProduct)) {
      _showDetailsPage(context);

      return;
    }

    _buyAgain(context);
  }

  String _checkValidTenderContractAndReturnMsg({
    required BuildContext context,
    required OrderHistoryDetails orderHistory,
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
        _buyAgain(context);
      }
    });
  }

  void _buyAgain(BuildContext context) {
    _trackBuyAgainEvent(
      context,
      viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
    );

    context.read<ReOrderPermissionBloc>().add(
          ReOrderPermissionEvent.fetchOrder(
            orderHistoryDetailsOrderItems:
                viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
            orderNumberWillUpsert: viewByOrderHistoryItem.orderNumber,
          ),
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
          context.read<ReOrderPermissionBloc>().add(
                ReOrderPermissionEvent.fetchOrder(
                  orderHistoryDetailsOrderItems:
                      viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
                  orderNumberWillUpsert: viewByOrderHistoryItem.orderNumber,
                ),
              );
        }
      });
    }
  }

  void _trackBuyAgainEvent(
    BuildContext context,
    List<OrderHistoryDetailsOrderItem> items,
  ) {
    final currentPage =
        RouterUtils.buildRouteTrackingName(context.routeData.path);
    for (final item in items) {
      trackMixpanelEvent(
        TrackingEvents.buyAgainClicked,
        props: {
          TrackingProps.productName: item.defaultMaterialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.clickAt: currentPage,
        },
      );

      trackClevertapEvent(
        TrackingEvents.reorderClicked,
        props: {
          TrackingProps.productName: item.defaultMaterialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.clickAt: currentPage,
        },
      );
    }
  }
}
