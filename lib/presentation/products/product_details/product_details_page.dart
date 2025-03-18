import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/order_type_banner.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/stock_info_banner.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_details.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/similar_product.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/product_stock_info.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/tender_contracts.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/tender_tag.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/image_counter.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/products/product_details/widget/combo_offers_product.dart';

part 'widget/product_image_section.dart';
part 'widget/stock_quantity.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  final MaterialInfo materialInfo;
  final bool isEditTender;
  final EZReachBanner? banner;
  const ProductDetailsPage({
    super.key,
    required this.materialInfo,
    this.isEditTender = false,
    this.banner,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
    if (context.read<EligibilityBloc>().state.isZDP5eligible) {
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: widget.materialInfo,
            ),
          );
    }
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            comboDealEligible:
                context.read<EligibilityBloc>().state.comboDealEligible,
            materials: [widget.materialInfo],
          ),
        );
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailBloc>(
          create: (context) => locator<ProductDetailBloc>()
            ..add(
              ProductDetailEvent.fetch(
                salesOrganisation: eligibilityState.salesOrganisation,
                customerCodeInfo: eligibilityState.customerCodeInfo,
                shipToInfo: eligibilityState.shipToInfo,
                user: eligibilityState.user,
                materialInfo: widget.materialInfo,
              ),
            ),
        ),
        BlocProvider<TenderContractDetailBloc>(
          create: (context) => locator<TenderContractDetailBloc>(),
        ),
      ],
      child: Scaffold(
        floatingActionButton: ScrollToTopWidget(
          scrollController: _scrollController,
          isVisible: !_isScrollAtInitialPosition,
        ),
        body: CustomScrollView(
          key: WidgetKeys.scrollList,
          controller: _scrollController,
          slivers: [
            BlocBuilder<ProductImageBloc, ProductImageState>(
              buildWhen: (previous, current) =>
                  previous.productImageMap != current.productImageMap,
              builder: (context, productImageState) {
                final productImages = productImageState.getMaterialImage(
                  widget.materialInfo.materialNumber,
                );

                return CustomAppBar.sliverAppBar(
                  backGroundColor: _isScrollAtInitialPosition
                      ? Colors.transparent
                      : ZPColors.white,
                  leadingWidget: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: CircleAvatar(
                      maxRadius: 16,
                      backgroundColor: _isScrollAtInitialPosition
                          ? ZPColors.darkGray
                          : ZPColors.transparent,
                      child: Icon(
                        Icons.chevron_left,
                        color: _isScrollAtInitialPosition
                            ? ZPColors.white
                            : ZPColors.black,
                        key: WidgetKeys.materialDetailsPageBack,
                      ),
                    ),
                  ),
                  actionWidget: [
                    Padding(
                      key: WidgetKeys.materialDetailsPageCartIcon,
                      padding: const EdgeInsets.all(10),
                      child: CartButton(
                        backgroundCartColor: _isScrollAtInitialPosition
                            ? ZPColors.darkGray
                            : ZPColors.transparent,
                        cartColor: _isScrollAtInitialPosition
                            ? ZPColors.white
                            : ZPColors.black,
                        iconSize: 20,
                        positionTop: -8,
                        isPriceResetApplicable: true,
                      ),
                    ),
                  ],
                  customerBlockedOrSuspended:
                      eligibilityState.customerBlockOrSuspended,
                  flexibleSpaceWidget: _ProductImageSection(
                    productImage: productImages,
                  ),
                  expandedHeight: _getExpandedImageHeight(productImages),
                  bottomWidget: const OrderTypeBanner(),
                );
              },
            ),
            SliverList.list(
              children: [
                const LicenseExpiredBanner(),
                const StockInfoBanner(),
                const EdiUserBanner(),
                _BodyContent(
                  isEditTender: widget.isEditTender,
                ),
                _SimilarProducts(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: _Footer(
          banner: widget.banner,
          isEditTender: widget.isEditTender,
          quantity: widget.materialInfo.quantity.intValue,
        ),
      ),
    );
  }

  double _getExpandedImageHeight(ProductImages productImages) =>
      MediaQuery.of(context).size.width * 414 / 494 +
      (productImages.hasMultipleImage
          ? MediaQuery.of(context).size.height * 0.05
          : 0);
}

class _SimilarProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
          current.productDetailAggregate.similarProduct,
      builder: (context, state) {
        return state.showRelatedItemsSection
            ? const SimilarProduct()
            : const SizedBox.shrink();
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  final bool isEditTender;
  const _BodyContent({
    this.isEditTender = false,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleStockInfoApiFailure(context, failure);
            },
            (_) {
              context.read<ProductImageBloc>().add(
                    ProductImageEvent.fetch(
                      list: state.productDetailAggregate.allMaterial,
                    ),
                  );
              if (state.productDetailAggregate.similarProduct.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetch(
                        comboDealEligible: eligibilityState.comboDealEligible,
                        materials: state.productDetailAggregate.similarProduct,
                      ),
                    );
              }
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isDetailAndStockFetching !=
              current.isDetailAndStockFetching ||
          previous.productDetailAggregate != current.productDetailAggregate,
      builder: (context, state) {
        final materialInfo = state.productDetailAggregate.materialInfo;
        final config = eligibilityState.salesOrgConfigs;
        final validateOutOfStockValue =
            eligibilityState.validateOutOfStockValue;

        return Column(
          key: WidgetKeys.bodyContentProductDetail,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!state.isDetailFetching)
              OfferLabel(
                materialInfo: materialInfo,
                disableOfferOnTap: true,
              ),
            ComboOfferLabel(
              materialInfo: materialInfo,
              iconSize: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 5,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        materialInfo.combinationCode(
                          showGMCPart: config.enableGMC,
                          showIRNPart: config.enableIRN,
                        ),
                        key: WidgetKeys.materialDetailsMaterialNumber,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: ZPColors.darkGray),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          spacing: padding6,
                          runSpacing: padding6,
                          children: [
                            if (state
                                .displayOOSPreorderTag(config.hideStockDisplay))
                              StatusLabel(
                                status: StatusType(
                                  config.addOosMaterials
                                      .productTag(validateOutOfStockValue),
                                ),
                              ),
                            if (materialInfo.isPoison) ProductTag.poison(),
                            if (materialInfo.isSampleMaterial)
                              ProductTag.sample(),
                            if (materialInfo.isGimmick) ProductTag.gimmickTag(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _Description(
                    materialInfo: materialInfo,
                  ),
                  ProductStockInfo(
                    materialNumber: materialInfo.materialNumber,
                  ),
                  ProductPriceLabel(
                    materialInfo: materialInfo,
                    type: PriceStyle.productPrice,
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 0.5,
            ),
            if (materialInfo.hasValidTenderContract &&
                eligibilityState.salesOrgConfigs.enableTenderOrders)
              TenderContracts(
                materialInfo: materialInfo,
                isEditTenderContract: isEditTender,
              ),
            ComboOffersProduct(materialNumber: materialInfo.materialNumber),
            AvailableOffer(materialNumber: materialInfo.materialNumber),
            MaterialInformation(materialInfo: materialInfo),
            const MaterialDetailsToggle(),
            const SizedBox(height: 20),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 8,
              color: ZPColors.extraLightGray,
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _Description({
    required this.materialInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (context.read<EligibilityBloc>().state.showMaterialDescInMandarin)
          Text(
            materialInfo.materialDescription,
            key: WidgetKeys.materialDetailsMaterialDescriptionInMandarin,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                materialInfo.defaultMaterialDescription,
                key: WidgetKeys.materialDetailsMaterialDescription,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            BlocConsumer<ProductDetailBloc, ProductDetailState>(
              listenWhen: (previous, current) =>
                  previous.productDetailAggregate.materialInfo.isFavourite !=
                      current.productDetailAggregate.materialInfo.isFavourite &&
                  !current.isDetailAndStockFetching,
              buildWhen: (previous, current) =>
                  previous.productDetailAggregate.materialInfo.isFavourite !=
                      current.productDetailAggregate.materialInfo.isFavourite ||
                  previous.isDetailAndStockFetching !=
                      current.isDetailAndStockFetching,
              listener: (context, state) {
                final toastMessage =
                    state.productDetailAggregate.materialInfo.isFavourite
                        ? 'Product added as favorite'
                        : 'Product removed as favorite';

                CustomSnackBar(
                  messageText: context.tr(toastMessage),
                ).show(context);
              },
              builder: (context, state) {
                return FavouriteIcon(
                  enable: !state.isDetailAndStockFetching,
                  key: WidgetKeys.materialDetailsFavoriteIcon,
                  isFavourite:
                      state.productDetailAggregate.materialInfo.isFavourite,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  iconSize: 32,
                  onTap: () {
                    if (materialInfo.isFavourite) {
                      trackMixpanelEvent(
                        TrackingEvents.addProductToFavorite,
                        props: {
                          TrackingProps.productName:
                              materialInfo.displayDescription,
                          TrackingProps.productNumber:
                              materialInfo.materialNumber.displayMatNo,
                          TrackingProps.productManufacturer:
                              materialInfo.getManufactured,
                          TrackingProps.clickAt:
                              RouterUtils.buildRouteTrackingName(
                            context.router.currentPath,
                          ),
                        },
                      );
                    }
                    context.read<ProductDetailBloc>().add(
                          state.productDetailAggregate.materialInfo.isFavourite
                              ? ProductDetailEvent.deleteFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: materialInfo.materialNumber,
                                )
                              : ProductDetailEvent.addFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: materialInfo.materialNumber,
                                ),
                        );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _Footer extends StatefulWidget {
  final EZReachBanner? banner;
  final bool isEditTender;
  final int quantity;
  const _Footer({
    this.banner,
    this.isEditTender = false,
    this.quantity = 0,
  });

  @override
  State<_Footer> createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
  late TextEditingController _quantityEditingController;
  @override
  void initState() {
    const defaultQty = 1;
    _quantityEditingController = TextEditingController(
      text: widget.isEditTender
          ? widget.quantity.toString()
          : defaultQty.toString(),
    );
    context
        .read<ProductDetailBloc>()
        .add(ProductDetailEvent.updateQty(qty: defaultQty));
    context.read<ProductDetailBloc>().add(
          const ProductDetailEvent.fetchItemQuantityForZdp5Discount(
            quantity: defaultQty,
          ),
        );
    _quantityEditingController.addListener(() {
      context
          .read<ProductDetailBloc>()
          .add(ProductDetailEvent.updateQty(qty: qty));
      if (context
          .read<EligibilityBloc>()
          .state
          .salesOrgConfigs
          .enableTenderOrders) {
        context.read<TenderContractDetailBloc>().add(
              TenderContractDetailEvent.updateQty(
                qty: qty,
              ),
            );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _quantityEditingController.dispose();
    super.dispose();
  }

  int get qty => int.tryParse(_quantityEditingController.text) ?? 0;

  bool isEligibleForAddToCart({
    required BuildContext context,
    required ProductDetailState productDetailState,
    required TenderContractDetailState tenderState,
  }) {
    final stockInfo = productDetailState.productDetailAggregate.stockInfo;
    final materialInfo = productDetailState.productDetailAggregate.materialInfo;
    final price = context
            .read<MaterialPriceBloc>()
            .state
            .materialPrice[materialInfo.materialNumber] ??
        Price.empty();
    final eligibilityState = context.read<EligibilityBloc>().state;
    if (eligibilityState.disableCreateOrder) return false;
    final materialWithoutPrice =
        eligibilityState.salesOrgConfigs.materialWithoutPrice;
    final materialInStock = (!stockInfo.inStock.isMaterialInStock
        ? !eligibilityState.doNotAllowOutOfStockMaterials
        : true);
    final validQty = !eligibilityState.salesOrg.isID ||
        !productDetailState.eligibleForStockError;
    final tenderExceedQty = tenderState.isExceedQty &&
        eligibilityState.salesOrgConfigs.enableTenderOrders;

    final isTenderContractMandatoryButUnavailable =
        materialInfo.hasMandatoryTenderContract &&
            tenderState.tenderContractList.isEmpty;

    return !materialInfo.isSuspended &&
        (materialInfo.isFOCMaterial
            ? (materialWithoutPrice && materialInStock)
            : !(price.finalPrice.isEmpty && !materialWithoutPrice) &&
                materialInStock) &&
        validQty &&
        !tenderExceedQty &&
        !isTenderContractMandatoryButUnavailable;
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final isZdp5enable = eligibilityState.salesOrgConfigs.enableZDP5 &&
        eligibilityState.salesOrganisation.salesOrg.isVN;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.productDetailAggregate != current.productDetailAggregate,
          listener: (context, state) {
            final price =
                context.read<MaterialPriceBloc>().state.getPriceForMaterial(
                      state.productDetailAggregate.materialInfo.materialNumber,
                    );
            if (isZdp5enable &&
                state.productDetailAggregate.hasRemainingQuotaReached(
                  price.zdp5RemainingQuota.intValue,
                )) {
              context.read<MaterialPriceBloc>().add(
                    MaterialPriceEvent.fetchPriceForZDP5Materials(
                      materialInfo: state.productDetailAggregate.materialInfo,
                    ),
                  );
              context.read<ProductDetailBloc>().add(
                    ProductDetailEvent.setExceedQty(
                      exceedQty: state.productDetailAggregate.materialInfo
                          .materialQtyConfirmZDP5Rule(
                        price.zdp5MaxQuota.intValue,
                        price.zdp5RemainingQuota.intValue,
                      ),
                    ),
                  );
            }
          },
          buildWhen: (previous, current) =>
              previous.isDetailAndStockFetching !=
                  current.isDetailAndStockFetching ||
              previous.inputQty != current.inputQty,
          builder: (context, state) {
            final materialInfo = state.productDetailAggregate.materialInfo;

            return BlocBuilder<TenderContractDetailBloc,
                TenderContractDetailState>(
              buildWhen: (previous, current) =>
                  previous.isExceedQty != current.isExceedQty ||
                  previous.isFetching != current.isFetching,
              builder: (context, tenderState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (materialInfo.isSuspended)
                      InfoLabel(
                        textValue: context.tr(
                          "The product is currently suspended. You won't be able to add the product to the cart.",
                        ),
                        textColor: ZPColors.infoTextBlueColor,
                        key: WidgetKeys.productDetailSuspended,
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 8,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: CartItemQuantityInput(
                            key: WidgetKeys.materialDetailsQuantityInput,
                            addPressed: (value) {
                              context.read<ProductDetailBloc>().add(
                                    ProductDetailEvent
                                        .fetchItemQuantityForZdp5Discount(
                                      quantity: int.parse(
                                        _quantityEditingController.text,
                                      ),
                                    ),
                                  );
                            },
                            controller: _quantityEditingController,
                            isEnabled: !materialInfo.isSuspended,
                            onFieldChange: (value) {},
                            onSubmit: (value) {
                              context.read<ProductDetailBloc>().add(
                                    ProductDetailEvent
                                        .fetchItemQuantityForZdp5Discount(
                                      quantity: int.parse(
                                        _quantityEditingController.text,
                                      ),
                                    ),
                                  );
                            },
                            quantityAddKey:
                                WidgetKeys.productDetailQuantityAddKey,
                            quantityDeleteKey:
                                WidgetKeys.productDetailQuantityDeleteKey,
                            quantityTextKey:
                                WidgetKeys.productDetailQuantityTextKey,
                            minusPressed: (value) {
                              context.read<ProductDetailBloc>().add(
                                    ProductDetailEvent
                                        .fetchItemQuantityForZdp5Discount(
                                      quantity: int.parse(
                                        _quantityEditingController.text,
                                      ),
                                    ),
                                  );
                            },
                            height: MediaQuery.of(context).size.height * 0.056,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          key: WidgetKeys.materialDetailsAddToCartButton,
                          child: BlocConsumer<CartBloc, CartState>(
                            listenWhen: (previous, current) =>
                                previous.isUpserting != current.isUpserting,
                            listener: (context, state) {
                              if (context.routeData != context.router.current) {
                                return;
                              }

                              state.apiFailureOrSuccessOption.fold(
                                () {
                                  if (!state.isUpserting &&
                                      context.router.current.path ==
                                          '/orders/material_details') {
                                    _trackAddToCartSuccess(
                                      context,
                                      state,
                                      materialInfo,
                                      qty,
                                      banner: widget.banner,
                                    );

                                    CustomSnackBar(
                                      key: WidgetKeys
                                          .materialDetailsAddToCartSnackBar,
                                      messageText: context
                                          .tr('Item has been added to cart'),
                                    ).show(context);
                                  }
                                },
                                (either) => either.fold(
                                  (failure) {
                                    _trackAddToCartFailure(context, failure);
                                    _handleCartFailure(
                                      context,
                                      failure,
                                      banner: widget.banner,
                                    );
                                  },
                                  (_) {},
                                ),
                              );
                            },
                            buildWhen: (previous, current) =>
                                previous.isUpserting != current.isUpserting ||
                                previous.isFetching != current.isFetching ||
                                previous.isClearing != current.isClearing,
                            builder: (context, stateCart) {
                              final price = context
                                          .read<MaterialPriceBloc>()
                                          .state
                                          .materialPrice[
                                      materialInfo.materialNumber] ??
                                  Price.empty();

                              return LoadingShimmer.withChild(
                                enabled: stateCart.isUpserting ||
                                    state.isDetailAndStockFetching ||
                                    tenderState.isFetching,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: stateCart.isUpserting ||
                                            state.isDetailAndStockFetching ||
                                            tenderState.isFetching ||
                                            !isEligibleForAddToCart(
                                              context: context,
                                              productDetailState: state,
                                              tenderState: tenderState,
                                            )
                                        ? null
                                        : () {
                                            _addToCart(
                                              context: context,
                                              state: state,
                                              cartState: stateCart,
                                              price: price,
                                              banner: widget.banner,
                                            );
                                          },
                                    child: Text(
                                      context.tr('Add to cart'),
                                      style: const TextStyle(
                                        color: ZPColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (eligibilityState.salesOrg.isID) ...[
                      if (state.eligibleForStockError)
                        ErrorTextWithIcon(
                          valueText: context.tr(
                            'You have exceed the available qty for this item',
                          ),
                        ),
                      _StockQuantity(
                        state: state,
                      ),
                    ],
                    if (tenderState.isExceedQty &&
                        eligibilityState.salesOrgConfigs.enableTenderOrders)
                      ErrorTextWithIcon(
                        valueText: context.tr(
                          'Maximum tender qty: {maxQty}',
                          namedArgs: {
                            'maxQty': tenderState
                                .currentTenderContract.remainingTenderQuantity
                                .toString(),
                          },
                        ),
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom * 1.2,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void _trackAddToCartSuccess(
  BuildContext context,
  CartState state,
  MaterialInfo material,
  int qty, {
  EZReachBanner? banner,
}) {
  final materialPriceState = context.read<MaterialPriceBloc>().state;
  final eligibilityState = context.read<EligibilityBloc>().state;
  final price = materialPriceState.materialPrice[material.materialNumber] ??
      Price.empty();
  final cartItem = state.cartProducts
      .firstWhere(
        (e) => e.getMaterialNumber == material.materialNumber,
        orElse: () => PriceAggregate.empty(),
      )
      .copyWith(quantity: qty, price: price);
  final clickAt =
      RouterUtils.buildRouteTrackingName(context.router.currentPath);
  final isOffer = materialPriceState.displayOfferTag(
    material,
    eligibilityState.user,
  );
  final isOOSPreorder = context
      .read<ProductDetailBloc>()
      .state
      .displayOOSPreorderTag(eligibilityState.salesOrgConfigs.hideStockDisplay);

  final tags = <String>[];
  if (isOffer) tags.add('On Offer');
  if (isOOSPreorder) {
    tags.add(
      eligibilityState.salesOrgConfigs.addOosMaterials.productTag(
        eligibilityState.validateOutOfStockValue,
      ),
    );
  }

  final mixpanelProps = <String, dynamic>{
    TrackingProps.productName: cartItem.materialInfo.displayDescription,
    TrackingProps.productNumber:
        cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
    TrackingProps.productManufacturer: cartItem.materialInfo.getManufactured,
    TrackingProps.productTotalPrice: cartItem.finalPriceTotal,
    TrackingProps.productQty: qty,
    TrackingProps.clickAt: clickAt,
    TrackingProps.fromBanner: banner != null,
    TrackingProps.bannerId: banner?.id ?? '',
    TrackingProps.bannerTitle: banner?.title ?? '',
    TrackingProps.isOffer: isOffer,
    TrackingProps.tag: tags.join(', '),
  };

  final clevertapProps = <String, dynamic>{
    TrackingProps.productName: cartItem.materialInfo.displayDescription,
    TrackingProps.productNumber:
        cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
    TrackingProps.productManufacturer: cartItem.materialInfo.getManufactured,
    TrackingProps.productTotalPrice: cartItem.finalPriceTotal,
    TrackingProps.productQty: qty,
    TrackingProps.clickAt: clickAt,
    TrackingProps.fromBanner: banner != null,
    TrackingProps.bannerId: banner?.id ?? '',
    TrackingProps.bannerTitle: banner?.title ?? '',
    TrackingProps.isOffer: isOffer,
    TrackingProps.tag: tags.join(', '),
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

void _handleCartFailure(
  BuildContext context,
  ApiFailure failure, {
  required EZReachBanner? banner,
}) {
  if (failure == const ApiFailure.addAnimalHealthWithNormalProductToCart()) {
    _showWarningWhenUpsert(
      context: context,
      banner: banner,
      widget: AddToCartErrorSection.forAnimalHealth(context: context),
    );
  }
}

void _addToCart({
  required BuildContext context,
  required ProductDetailState state,
  required CartState cartState,
  required Price price,
  EZReachBanner? banner,
}) {
  final tenderContractDetailState =
      context.read<TenderContractDetailBloc>().state;
  final cartProducts = cartState.cartProducts;
  final isTenderEligible =
      context.read<EligibilityBloc>().state.salesOrgConfigs.enableTenderOrders;
  final materialInfo = state.productDetailAggregate.materialInfo;

  if (isTenderEligible && tenderContractDetailState.isInsufficientQuantity) {
    CustomSnackBar(
      icon: const Icon(
        Icons.info,
        color: ZPColors.error,
      ),
      backgroundColor: ZPColors.errorSnackBarColor,
      messageText: context.tr(
        'Insufficient available quantity. Tender contract is no longer available.',
      ),
    ).show(context);

    return;
  }
  final tenderContractValidationMsg = _checkValidTenderContractAndReturnMsg(
    cartProducts: cartState.cartProducts,
    context: context,
  );
  if (isTenderEligible && tenderContractValidationMsg.isNotEmpty) {
    _showWarningWhenUpsert(
      context: context,
      banner: banner,
      widget: AddToCartErrorSection.forTenderContract(
        contentText: tenderContractValidationMsg,
      ),
    );

    return;
  }

  if (cartProducts.isNotEmpty) {
    if (materialInfo.isFOCMaterial &&
        !cartState.containFocMaterialInCartProduct) {
      _showWarningForFOCMaterial(
        context: context,
        banner: banner,
      );
    } else if (!materialInfo.isFOCMaterial &&
        cartState.containFocMaterialInCartProduct) {
      _showWarningForFOCMaterial(
        context: context,
        banner: banner,
      );
    } else if (materialInfo.isGimmick && cartProducts.containSampleMaterial) {
      _showWarningWhenUpsert(
        context: context,
        widget: AddToCartErrorSection(
          contentText: context.tr(
            'Gimmick items cannot be ordered while sample items are in your cart. By proceeding, your current cart will be cleared.',
          ),
        ),
      );
    } else if (materialInfo.isSampleMaterial &&
        cartProducts.containGimmickMaterial) {
      _showWarningWhenUpsert(
        context: context,
        widget: AddToCartErrorSection(
          contentText: context.tr(
            'Sample items cannot be ordered while gimmick items are in your cart. By proceeding, your current cart will be cleared.',
          ),
        ),
      );
    } else {
      final materialNumber = materialInfo.materialNumber;
      if (cartState.getCurrentComboItemByComboDealId(price.comboDeal.id) !=
          PriceAggregate.empty()) {
        _initComboDealAndNavigate(
          context: context,
          cartState: cartState,
          materialNumber: materialNumber,
          price: price,
        );
      } else {
        upsertCart(
          context: context,
          price: price,
          state: state,
          stateCart: cartState,
          banner: banner,
          tenderContractState: tenderContractDetailState,
          isEditTender: isTenderEligible,
        );
      }
    }
  } else {
    upsertCart(
      context: context,
      price: price,
      state: state,
      stateCart: cartState,
      banner: banner,
      tenderContractState: tenderContractDetailState,
    );
  }
}

void upsertCart({
  required BuildContext context,
  required Price price,
  required ProductDetailState state,
  required CartState stateCart,
  required TenderContractDetailState tenderContractState,
  EZReachBanner? banner,
  bool isEditTender = false,
}) {
  final materialNumber =
      state.productDetailAggregate.materialInfo.materialNumber;
  final eligiblityState = context.read<EligibilityBloc>().state;
  context.read<CartBloc>().add(
        CartEvent.upsertCart(
          priceAggregate: PriceAggregate.empty().copyWith(
            materialInfo: state.productDetailAggregate.materialInfo.copyWith(
              counterOfferDetails:
                  stateCart.productCounterOfferDetails(materialNumber),
            ),
            price: price,
            salesOrgConfig: eligiblityState.salesOrgConfigs,
            quantity: isEditTender
                ? state.inputQty
                : stateCart.getQuantityOfProduct(
                      productNumber: materialNumber,
                    ) +
                    state.inputQty,
            bonusSampleItems: stateCart.productBonusList(materialNumber),
            tenderContract: tenderContractState.currentTenderContract,
          ),
          banner: banner,
        ),
      );
}

void _initComboDealAndNavigate({
  required BuildContext context,
  required CartState cartState,
  required MaterialNumber materialNumber,
  required Price price,
}) {
  final comboDeal = context
      .read<ComboDealListBloc>()
      .state
      .getComboDeal(comboDealId: price.comboDeal.id);
  final overrideQuantity = cartState
      .getCurrentComboItemByComboDealId(price.comboDeal.id)
      .comboMaterialsCurrentQuantity;
  context.read<ComboDealMaterialDetailBloc>().add(
        ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
          contain: overrideQuantity.isNotEmpty,
        ),
      );
  if (price.comboDeal.category.type.isMaterialNumber) {
    context.read<ComboDealMaterialDetailBloc>().add(
          ComboDealMaterialDetailEvent.fetchComboDealDetail(
            comboDeal: comboDeal,
            parentMaterialNumber: materialNumber,
            comboMaterialsCurrentQuantity: overrideQuantity,
          ),
        );
  } else {
    final productDetailAggregate =
        context.read<ProductDetailBloc>().state.productDetailAggregate;
    final principalCode = productDetailAggregate
        .materialInfo.principalData.principalCode
        .getOrDefaultValue('');
    context.read<ComboDealMaterialDetailBloc>().add(
          ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
            comboDeal: comboDeal,
            principles: [principalCode],
            parentMaterialNumber:
                productDetailAggregate.materialInfo.materialNumber,
            comboMaterialsCurrentQuantity: overrideQuantity,
          ),
        );
  }
  context.navigateTo(
    const ComboDetailPageRoute(),
  );
}

void _showWarningForFOCMaterial({
  required BuildContext context,
  EZReachBanner? banner,
}) =>
    _showWarningWhenUpsert(
      context: context,
      banner: banner,
      widget: AddToCartErrorSection.forCovid(
        cartContainsFocProduct:
            context.read<CartBloc>().state.containFocMaterialInCartProduct,
        context: context,
      ),
    );

void _showWarningWhenUpsert({
  required BuildContext context,
  required Widget widget,
  EZReachBanner? banner,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => widget,
  ).then((value) {
    if (value != null) {
      final productDetailsState = context.read<ProductDetailBloc>().state;
      final materialNumber = productDetailsState
          .productDetailAggregate.materialInfo.materialNumber;
      final price = context
              .read<MaterialPriceBloc>()
              .state
              .materialPrice[materialNumber] ??
          Price.empty();
      upsertCart(
        context: context,
        price: price,
        state: productDetailsState,
        stateCart: context.read<CartBloc>().state,
        tenderContractState: context.read<TenderContractDetailBloc>().state,
        banner: banner,
      );
    }
  });
}

String _checkValidTenderContractAndReturnMsg({
  required BuildContext context,
  required List<PriceAggregate> cartProducts,
}) {
  final tenderContractDetailState =
      context.read<TenderContractDetailBloc>().state;
  final tenderContractEnable = tenderContractDetailState.tenderContractEnable;
  final tenderOrderReason =
      tenderContractDetailState.currentTenderContract.tenderOrderReason;

  if (!tenderContractEnable && !cartProducts.hasTenderContract) {
    return '';
  } else if (!tenderContractEnable && cartProducts.hasTenderContract) {
    return context.tr(
      'Other materials cannot be ordered while materials from the {reason} tender contract are in your cart. By proceeding, your current cart will be cleared.',
      namedArgs: {'reason': cartProducts.tenderReasons.join(', ')},
    );
  } else {
    if (tenderContractEnable &&
        (cartProducts.hasNonTenderContractMaterials ||
            (cartProducts.isNotEmpty &&
                (!cartProducts.hasTenderContractWithReason730 &&
                    tenderOrderReason.is730)))) {
      return context.tr(
        'Materials from the {reason} tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.',
        namedArgs: {
          'reason': tenderOrderReason.displayTenderContractReason,
        },
      );
    } else if (tenderContractEnable &&
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
