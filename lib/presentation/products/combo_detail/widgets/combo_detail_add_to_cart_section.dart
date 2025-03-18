part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailAddToCartSection extends StatelessWidget {
  const _ComboDetailAddToCartSection();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.allSelectedItems != current.allSelectedItems ||
          previous.isUpdateCart != current.isUpdateCart ||
          previous.totalQuantityUnit != current.totalQuantityUnit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: ZPColors.lightGray2,
              indent: 0,
              endIndent: 0,
              height: 15,
            ),
            ListTile(
              dense: true,
              key: WidgetKeys.comboDetailOrderForListTile,
              onTap: () => _showSumaryInfo(context),
              visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${"Order for".tr()} ${context.read<EligibilityBloc>().state.customerCodeInfo.customerName}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            if (state.displayMinPurchaseQtyMessage)
              InfoLabel(
                key: WidgetKeys.comboNotEligibleMessage,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                mainColor: ZPColors.lightRedStatusColor,
                textValue:
                    state.currentDeal.getcomboDealNotEligibleMessage(context),
              ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Column(
                children: [
                  if (state.currentDeal.scheme.displayOriginalPrice &&
                      state.isEnableAddToCart)
                    Row(
                      key: WidgetKeys.comboRateDiscounted,
                      children: [
                        if (state.currentDeal.scheme.displayDiscountedTotal)
                          Text(
                            context.tr(
                              '{percent}% Discount',
                              namedArgs: {
                                'percent':
                                    state.currentDeal.materialComboRateDisplay(
                                  materialNumber:
                                      state.allMaterialsNumber.first,
                                  totalQuantityUnit: state.totalQuantityUnit,
                                  currentTotalAmount:
                                      state.originalPriceSelectedItems,
                                ),
                              },
                            ),
                            key: WidgetKeys.comboDetailTotalDiscountedPercent,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ZPColors.discountedTotalTitle,
                                      height: 1.5,
                                    ),
                          ),
                        const Spacer(),
                        PriceComponent(
                          key: WidgetKeys.comboDealSubtotal,
                          salesOrgConfig: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          price: state.originalPriceSelectedItems.toString(),
                          type: PriceStyle.comboOfferPrice,
                          priceLabelStyle:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.darkerGrey,
                                  ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.currentDeal.scheme.getTotalUnitMessage(
                          context,
                          totalUnit: state.totalQuantityUnit,
                        ),
                        key: WidgetKeys.comboDetailTotalUnits,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      PriceComponent(
                        key: WidgetKeys.comboDealSubtotalDiscounted,
                        salesOrgConfig: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs,
                        price: state.totalPriceDisplay.toString(),
                        title: '${context.tr('Total')}: ',
                        priceLabelStyle:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: ZPColors.extraLightGrey4,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (state.displayNextComboDealMessage)
              ComboDetailNextDealInfo(
                totalQty: state.totalQuantityUnit,
                comboDeal: state.currentDeal,
                totalAmount: state.originalPriceSelectedItems,
              ),
            _CartPageCheckoutButton(isUpdateCart: state.isUpdateCart),
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
  const _CartPageCheckoutButton({required this.isUpdateCart});
  final bool isUpdateCart;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          (previous.isUpserting != current.isUpserting &&
                  !current.isUpserting ||
              previous.isClearing != current.isClearing &&
                  !current.isClearing) &&
          (context.router.current.path == '/combo_detail' ||
              (context.router.current.path == '/orders/cart' &&
                  previous.cartProducts != current.cartProducts)) &&
          !current.isDeleteCombo,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            final comboDealMaterialDetailBloc =
                context.read<ComboDealMaterialDetailBloc>();
            if (context.router.current.path == '/combo_detail') {
              CustomSnackBar(
                messageText: context.tr(
                  isUpdateCart
                      ? '{comboName} has been updated to cart'
                      : '{comboName} has been added to cart',
                  namedArgs: {
                    'comboName': comboDealMaterialDetailBloc
                        .state.currentDeal.scheme.comboDealTitleAppbar,
                  },
                ),
              ).show(context);
            }

            final overrideQuantity = state
                .getCurrentComboItemByComboDealId(
                  comboDealMaterialDetailBloc
                      .state.allSelectedItems.firstPriceComboDealEligible.id,
                )
                .comboMaterialsCurrentQuantity;

            comboDealMaterialDetailBloc.add(
              ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                contain: overrideQuantity.isNotEmpty,
              ),
            );
          },
          (_) {},
        );
      },
      buildWhen: (previous, current) =>
          previous.isUpserting != current.isUpserting,
      builder: (context, state) {
        return SafeArea(
          child: LoadingShimmer.withChild(
            enabled: state.isUpserting,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: BlocBuilder<ComboDealMaterialDetailBloc,
                  ComboDealMaterialDetailState>(
                buildWhen: (previous, current) =>
                    previous.isEnableAddToCart != current.isEnableAddToCart,
                builder: (context, state) {
                  return ElevatedButton(
                    key: WidgetKeys.comboDealAddOrEditComboButton,
                    onPressed: state.isEnableAddToCart
                        ? () {
                            context.read<CartBloc>().add(
                                  CartEvent.upsertCartItemsWithComboOffers(
                                    priceAggregates: context
                                        .read<ComboDealMaterialDetailBloc>()
                                        .state
                                        .allSelectedItems,
                                    isDeleteCombo: false,
                                  ),
                                );
                          }
                        : null,
                    child: Text(
                      isUpdateCart
                          ? context.tr('Update cart')
                          : context.tr('Add to cart'),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
