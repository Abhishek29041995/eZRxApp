import 'package:auto_route/auto_route.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';

const _horizontalPadding = EdgeInsets.symmetric(horizontal: 20);

class BundlesAddToCartSheet extends StatelessWidget {
  final EZReachBanner? banner;
  const BundlesAddToCartSheet({
    super.key,
    this.banner,
  });

  @override
  Widget build(BuildContext context) {
    final materialInfo = context.read<BundleAddToCartBloc>().state.materialInfo;
    final bundle = materialInfo.bundle;

    return Padding(
      key: WidgetKeys.bundleAddToCartSheet,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: _horizontalPadding,
            child: Row(
              children: [
                if (materialInfo.isMarketPlace) ...[
                  const MarketPlaceRectangleLogo(),
                  const SizedBox(width: 8),
                ],
                Text(
                  context.tr('Add bundle to cart'),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: _horizontalPadding,
            child: InfoLabel(
              textValue:
                  '${context.tr('Please note that the minimum total purchase quantity for this bundle offer is')} ${bundle.minimumQuantityBundleMaterial.quantity}.',
              key: WidgetKeys.addBundleMinimumQty,
              textColor: ZPColors.infoTextBlueColor,
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.separated(
                padding: _horizontalPadding,
                key: WidgetKeys.scrollList,
                itemCount: bundle.materials.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) => _BundleMaterialListTile(
                  materialInfo: bundle.materials.elementAt(index),
                ),
              ),
            ),
          ),
          _BundleSheetFooter(banner: banner),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _BundleMaterialListTile extends StatefulWidget {
  final MaterialInfo materialInfo;
  const _BundleMaterialListTile({
    required this.materialInfo,
  });

  @override
  State<_BundleMaterialListTile> createState() =>
      _BundleMaterialListTileState();
}

class _BundleMaterialListTileState extends State<_BundleMaterialListTile> {
  final TextEditingController _controller = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    context.read<BundleAddToCartBloc>().add(
          const BundleAddToCartEvent.validateQuantity(showErrorMessage: false),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final addOosMaterials = eligibilityState.salesOrgConfigs.addOosMaterials;
    final validateOutOfStockValue = eligibilityState.validateOutOfStockValue;

    return Row(
      key: WidgetKeys.bundleMaterialItem(
        widget.materialInfo.materialNumber.displayMatNo,
      ),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          clipBehavior: Clip.hardEdge,
          child: ProductImage(
            materialNumber: widget.materialInfo.materialNumber,
            height: MediaQuery.of(context).size.height * 0.1,
            width: Responsive.isLargerThan(context, Breakpoint.desktop)
                ? MediaQuery.of(context).size.width * 0.16
                : MediaQuery.of(context).size.width * 0.22,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            key: WidgetKeys.bundleMaterialDetails(
              widget.materialInfo.materialNumber.displayMatNo,
            ),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.materialInfo.combinationCode(
                        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                        showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (!widget.materialInfo.inStock) ...[
                    const SizedBox(width: 5),
                    StatusLabel(
                      status: StatusType(
                        addOosMaterials.productTag(validateOutOfStockValue),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.materialInfo.defaultMaterialDescription,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              StockInfoWidget(
                materialInfo: widget.materialInfo,
                stockInfo: widget.materialInfo.bundleStockInfoValid,
              ),
              const SizedBox(height: 8),
              CartItemQuantityInput(
                key: WidgetKeys.genericKey(
                  key:
                      'bundle${widget.materialInfo.materialNumber.displayMatNo}${_controller.text}quantity',
                ),
                isEnabled: widget.materialInfo.inStock ||
                    (!widget.materialInfo.inStock && validateOutOfStockValue),
                quantityAddKey: WidgetKeys.bundleInputAddKey,
                quantityDeleteKey: WidgetKeys.bundleInputDeleteKey,
                quantityTextKey: WidgetKeys.bundleQuantityTextKey,
                controller: _controller,
                onFieldChange: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                minusPressed: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                addPressed: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                onSubmit: (k) {},
                isLoading: false,
                returnZeroOnFieldEmpty: true,
                minimumQty: 1,
                maximumQty: 999999,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BundleSheetFooter extends StatelessWidget {
  final EZReachBanner? banner;
  const _BundleSheetFooter({this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ZPColors.lightGray)),
      ),
      child: BlocBuilder<BundleAddToCartBloc, BundleAddToCartState>(
        buildWhen: (previous, current) =>
            previous.materialInfo.bundle.materials !=
                current.materialInfo.bundle.materials ||
            previous.showErrorMessage != current.showErrorMessage,
        builder: (context, state) {
          final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;
          final bundle = state.materialInfo.bundle;

          return Padding(
            padding: _horizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  key: WidgetKeys.addBundleTotalQty,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsGrey1,
                      ),
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Total quantity: '),
                      TextSpan(
                        text: '${bundle.totalQty}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                if (state.displayErrorMessage)
                  ErrorTextWithIcon(
                    key: WidgetKeys.addBundleInvalidQtyWarning,
                    textPadding: EdgeInsets.zero,
                    valueText:
                        '${context.tr('Minimum total purchase qty')}: ${bundle.minimumQuantityBundleMaterial.quantity}',
                  ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    PriceComponent(
                      salesOrgConfig: configs,
                      price: bundle.currentBundleInfo.rate.toString(),
                      type: PriceStyle.bundleAddToCartPrice,
                      trailingText: context.tr('per item'),
                      key: WidgetKeys.addBundleRate,
                    ),
                    if (bundle.showStrikeThroughPrice) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 4, top: 3),
                        child: PriceComponent(
                          salesOrgConfig: configs,
                          price: bundle.minimumQuantityBundleMaterial.rate
                              .toString(),
                          type: PriceStyle.bundleListPriceStrikeThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        key: WidgetKeys.cancelBundleMaterialAddToCart,
                        onPressed: () {
                          context.router.maybePop();
                        },
                        child: Text(context.tr('Cancel')),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: BlocConsumer<CartBloc, CartState>(
                        listenWhen: (previous, current) =>
                            previous.isUpserting != current.isUpserting,
                        listener: (context, cartState) {
                          cartState.apiFailureOrSuccessOption.fold(
                            () {
                              if (!cartState.isUpserting &&
                                  cartState.cartProducts.isNotEmpty) {
                                _trackAddToCartSuccess(
                                  context,
                                  state,
                                  banner: banner,
                                );
                                context.router.popForced();
                                CustomSnackBar(
                                  messageText: context
                                      .tr('Bundle has been added to cart.'),
                                ).show(context);
                              }
                            },
                            (either) {
                              either.fold(
                                (failure) =>
                                    _trackAddToCartFailure(context, failure),
                                (_) {},
                              );
                              context.router.maybePop();
                            },
                          );
                        },
                        builder: (context, stateCart) {
                          return ElevatedButton(
                            key: WidgetKeys.bundleAddToCartSheetSubmitButton,
                            onPressed: state.displayErrorMessage ||
                                    stateCart.isUpserting
                                ? null
                                : () => _addBundlesToCart(
                                      context,
                                      state: state,
                                      stateCart: stateCart,
                                      banner: banner,
                                    ),
                            child: LoadingShimmer.withChild(
                              enabled: stateCart.isUpserting,
                              child: Text(
                                context.tr('Add to cart'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _trackAddToCartSuccess(
    BuildContext context,
    BundleAddToCartState state, {
    EZReachBanner? banner,
  }) {
    final bundle = state.materialInfo;
    final mixpanelProps = <String, dynamic>{
      TrackingProps.productName: bundle.name,
      TrackingProps.productNumber: bundle.materialNumber.getOrDefaultValue(''),
      TrackingProps.productManufacturer: bundle.manufactured,
      TrackingProps.productTotalPrice: bundle.bundle.totalPrice,
      TrackingProps.productQty: bundle.bundle.totalQty,
      TrackingProps.clickAt:
          RouterUtils.buildRouteTrackingName(context.router.currentPath),
      TrackingProps.fromBanner: banner != null,
      TrackingProps.bannerId: banner?.id ?? '',
      TrackingProps.bannerTitle: banner?.title ?? '',
    };

    final clevertapProps = <String, dynamic>{
      TrackingProps.productName: bundle.name,
      TrackingProps.productNumber: bundle.materialNumber.getOrDefaultValue(''),
      TrackingProps.productManufacturer: bundle.manufactured,
      TrackingProps.productTotalPrice: bundle.bundle.totalPrice,
      TrackingProps.productQty: bundle.bundle.totalQty,
      TrackingProps.clickAt:
          RouterUtils.buildRouteTrackingName(context.router.currentPath),
      TrackingProps.fromBanner: banner != null,
      TrackingProps.bannerId: banner?.id ?? '',
      TrackingProps.bannerTitle: banner?.title ?? '',
    };

    trackMixpanelEvent(
      TrackingEvents.addProductToCartSuccess,
      props: mixpanelProps,
    );
    trackClevertapEvent(
      TrackingEvents.addProductToCartSuccess,
      props: clevertapProps,
    );
  }

  void _trackAddToCartFailure(BuildContext context, ApiFailure failure) =>
      trackMixpanelEvent(
        TrackingEvents.addToCartFailed,
        props: {
          TrackingProps.errorMessage: context.tr(
            failure.failureMessage.message,
            namedArgs: failure.failureMessage.arguments,
          ),
          TrackingProps.viewFrom:
              RouterUtils.buildRouteTrackingName(context.router.currentPath),
        },
      );

  void _addBundlesToCart(
    BuildContext context, {
    required BundleAddToCartState state,
    required CartState stateCart,
    EZReachBanner? banner,
  }) {
    context.read<BundleAddToCartBloc>().add(
          const BundleAddToCartEvent.validateQuantity(showErrorMessage: true),
        );

    if (!state.materialInfo.bundle.miniumQtySatisfied ||
        stateCart.isUpserting) {
      return;
    }

    final materialInCart = stateCart
        .findItemById(MaterialNumber(state.materialInfo.bundle.bundleCode));
    final addToCartBundle = PriceAggregate.empty().copyWith(
      bundle: Bundle.empty().copyWith(
        materials: state.selectedMaterialInfo(materialInCart),
        bundleCode: state.materialInfo.materialNumber.getValue(),
        bundleName: BundleName(state.materialInfo.defaultMaterialDescription),
      ),
    );

    if (stateCart.containFocMaterialInCartProduct) {
      _showCovidWarningMessageBottomSheet(
        context: context,
      );

      return;
    }

    context.read<CartBloc>().add(
          CartEvent.upsertCartItems(
            priceAggregate: addToCartBundle,
            banner: banner,
          ),
        );
  }

  void _showCovidWarningMessageBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      builder: (_) {
        return AddToCartErrorSection.forCovid(
          cartContainsFocProduct:
              context.read<CartBloc>().state.containFocMaterialInCartProduct,
          context: context,
        );
      },
    ).then((value) {
      if (value != null) {
        final bundleAddToCartState = context.read<BundleAddToCartBloc>().state;
        final cartState = context.read<CartBloc>().state;
        _addBundlesToCart(
          context,
          state: bundleAddToCartState,
          stateCart: cartState,
          banner: banner,
        );
      }
    });
  }
}
