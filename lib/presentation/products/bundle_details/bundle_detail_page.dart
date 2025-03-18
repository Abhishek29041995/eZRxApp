import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/stock_info_banner.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_add_to_cart_sheet.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_material_descriptions_sheet.dart';
import 'package:ezrxmobile/presentation/products/widgets/image_counter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/utils/string_utils.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_image_section.dart';
part 'package:ezrxmobile/presentation/products/bundle_details/widget/outline_text.dart';

@RoutePage()
class BundleDetailPage extends StatefulWidget {
  final MaterialInfo materialInfo;
  final EZReachBanner? banner;
  const BundleDetailPage({
    super.key,
    required this.materialInfo,
    this.banner,
  });

  @override
  State<BundleDetailPage> createState() => _BundleDetailPageState();
}

class _BundleDetailPageState extends State<BundleDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
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
    return BlocProvider<ProductDetailBloc>(
      create: (context) => locator<ProductDetailBloc>()
        ..add(
          ProductDetailEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            user: context.read<EligibilityBloc>().state.user,
            materialInfo: widget.materialInfo,
          ),
        ),
      child: Scaffold(
        key: WidgetKeys.bundleDetailPage,
        appBar: AppBar(
          actions: const [
            Padding(
              key: WidgetKeys.materialDetailsPageCartIcon,
              padding: EdgeInsets.all(10),
              child: CartButton(
                backgroundCartColor: ZPColors.transparent,
                cartColor: ZPColors.black,
                iconSize: 20,
                positionTop: -8,
              ),
            ),
          ],
        ),
        floatingActionButton: ScrollToTopWidget(
          scrollController: _scrollController,
          isVisible: !_isScrollAtInitialPosition,
        ),
        body: ListView(
          controller: _scrollController,
          key: WidgetKeys.scrollList,
          children: [
            const EdiUserBanner(),
            const StockInfoBanner(),
            const _BundleImageSection(),
            Align(
              alignment: Alignment.topLeft,
              child: ProductTag.bundleOffer(),
            ),
            const _BundleDetails(),
            const Divider(
              indent: 0,
              endIndent: 0,
              height: 40,
              color: ZPColors.lightGray2,
            ),
            const _BundleOfferDetails(),
          ],
        ),
        bottomNavigationBar: _AddToCartButton(
          banner: widget.banner,
        ),
      ),
    );
  }
}

class _BundleDetails extends StatelessWidget {
  const _BundleDetails();

  @override
  Widget build(BuildContext context) {
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
            (_) => context.read<ProductImageBloc>().add(
                  ProductImageEvent.fetch(
                    list: state.productDetailAggregate.allMaterial,
                  ),
                ),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.materialInfo !=
              current.productDetailAggregate.materialInfo ||
          previous.isDetailAndStockFetching != current.isDetailAndStockFetching,
      builder: (context, state) {
        final material = state.productDetailAggregate.materialInfo;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                material.bundle.bundleCode,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsGrey1,
                    ),
                key: WidgetKeys.bundleOfferCode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.isDetailAndStockFetching
                      ? SizedBox(width: 100, child: LoadingShimmer.tile())
                      : Expanded(
                          child: Text(
                            material.name,
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            key: WidgetKeys.bundleOfferName,
                          ),
                        ),
                  FavouriteIcon(
                    iconSize: 32,
                    isFavourite: material.isFavourite,
                    onTap: () {
                      if (material.isFavourite) {
                        trackMixpanelEvent(
                          TrackingEvents.addProductToFavorite,
                          props: {
                            TrackingProps.productName: material.name,
                            TrackingProps.productNumber:
                                material.materialNumber.displayMatNo,
                            TrackingProps.productManufacturer:
                                material.getManufactured,
                            TrackingProps.clickAt:
                                RouterUtils.buildRouteTrackingName(
                              context.router.currentPath,
                            ),
                          },
                        );
                      }
                      context.read<ProductDetailBloc>().add(
                            material.isFavourite
                                ? ProductDetailEvent.deleteFavourite(
                                    isForSimilarProduct: false,
                                    materialNumber: material.materialNumber,
                                  )
                                : ProductDetailEvent.addFavourite(
                                    isForSimilarProduct: false,
                                    materialNumber: material.materialNumber,
                                  ),
                          );
                    },
                  ),
                ],
              ),
              state.isDetailAndStockFetching
                  ? SizedBox(width: 100, child: LoadingShimmer.tile())
                  : PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: material.bundle.minimumQuantityBundleMaterial.rate
                          .toString(),
                      type: PriceStyle.bundlePrice,
                      trailingText: context.tr('per item'),
                      key: WidgetKeys.bundleOfferPrice,
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _BundleOfferDetails extends StatelessWidget {
  const _BundleOfferDetails();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.materialInfo !=
          current.productDetailAggregate.materialInfo,
      builder: (context, state) {
        final bundleInformation =
            state.productDetailAggregate.materialInfo.bundle.bundleInformation;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: WidgetKeys.bundleOfferSummary,
                children: [
                  SvgPicture.asset(
                    SvgImage.bundleOfferIcon,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('Bundle offer'),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          context.tr(
                            'Mix and match bundled products and buy more for better deals.',
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ZPColors.neutralsGrey1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (bundleInformation.isNotEmpty) ...[
                const SizedBox(height: 12),
                CurvedRectangleWidget(
                  key: WidgetKeys.bundleInformation,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  semiCircleCount: 8,
                  semiCircleRadius: 16,
                  width: double.infinity,
                  backgroundColor: ZPColors.lightBlueColor,
                  borderColor: ZPColors.lightBlueBorderColor,
                  child: Column(
                    children: state.productDetailAggregate.materialInfo.bundle
                        .sortedBundleInformation
                        .map(
                          (e) => BalanceTextRow(
                            keyFlex: 3,
                            keyText: '${StringUtils.displayPrice(
                              context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs,
                              e.rate,
                            )} ${context.tr('per item')}',
                            keyTextStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                            valueFlex: 4,
                            valueText:
                                'Total purchase quantity:${e.quantity} or more',
                            valueTextStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: ZPColors.darkGray),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
              ListTile(
                key: WidgetKeys.bundleOfferMaterialInfo,
                onTap: () {
                  _trackShowProductInfo(context);
                  _showMaterialDescriptionSheet(context: context);
                },
                contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                title: Text(
                  context.tr('Material information'),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: Text(
                  '${context.tr('Bundle code')}, ${context.tr(state.productDetailAggregate.materialInfo.isMarketPlace ? 'Sold by' : 'Manufacturer')}',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMaterialDescriptionSheet({required BuildContext context}) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => BlocProvider<ProductDetailBloc>.value(
          value: context.read<ProductDetailBloc>(),
          child: const BundleMaterialDescription(),
        ),
      );

  void _trackShowProductInfo(BuildContext context) {
    final materialInfo = context
        .read<ProductDetailBloc>()
        .state
        .productDetailAggregate
        .materialInfo;

    trackMixpanelEvent(
      TrackingEvents.productInfoViewed,
      props: {
        TrackingProps.productName: materialInfo.name,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
      },
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  final EZReachBanner? banner;
  const _AddToCartButton({
    this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.isDetailAndStockFetching != current.isDetailAndStockFetching,
      builder: (context, state) {
        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              LoadingShimmer.withChild(
                enabled: state.isDetailAndStockFetching,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: WidgetKeys.materialDetailsAddToCartButton,
                    onPressed: state.isDetailAndStockFetching ||
                            context
                                .read<EligibilityBloc>()
                                .state
                                .disableCreateOrder
                        ? null
                        : () {
                            final bundle = context
                                .read<ProductDetailBloc>()
                                .state
                                .productDetailAggregate
                                .materialInfo;
                            context.read<BundleAddToCartBloc>().add(
                                  BundleAddToCartEvent.set(bundle: bundle),
                                );
                            _showBundleAddToCartBottomSheet(
                              context: context,
                              banner: banner,
                            );
                          },
                    child: Text('Add to cart'.tr()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBundleAddToCartBottomSheet({
    required BuildContext context,
    EZReachBanner? banner,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      builder: (_) => BundlesAddToCartSheet(banner: banner),
    );
  }
}
