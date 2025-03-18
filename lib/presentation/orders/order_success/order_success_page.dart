import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_section.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/small_order_fee.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/widgets/price_not_available_message.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_material_section.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_bundle_section.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_summary.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_header.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_message.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_refresh_warning.dart';

@RoutePage()
class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({super.key});

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  var isFirstFetch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.orderSuccess,
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 18),
          key: WidgetKeys.closeButton,
          onPressed: () {
            context.router.popUntil((route) {
              return route.settings.name == HomeNavigationTabbarRoute.name;
            });
          },
          icon: const Icon(Icons.close),
        ),
        title: Text('${'Order submitted'.tr()}!'),
        centerTitle: false,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<OrderSummaryBloc, OrderSummaryState>(
          listenWhen: (previous, current) =>
              previous.isConfirming != current.isConfirming &&
              !current.isConfirming,
          listener: (context, state) {
            if (isFirstFetch) {
              isFirstFetch = false;
              context
                  .read<CartBloc>()
                  .add(const CartEvent.fetchProductsAddedToCart());
              CustomSnackBar(
                messageText: context.tr('Order submitted'),
              ).show(context);
            }
            context.read<ViewByOrderBloc>().add(
                  ViewByOrderEvent.fetch(
                    filter: ViewByOrdersFilter.empty(),
                    searchKey: SearchKey.empty(),
                    isDetailsPage: false,
                  ),
                );
            context.read<ViewByItemsBloc>().add(
                  ViewByItemsEvent.fetch(
                    viewByItemFilter: ViewByItemFilter.empty(),
                    searchKey: SearchKey.empty(),
                  ),
                );
          },
          child: const _BodyContent(),
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      buildWhen: (previous, current) =>
          previous.isConfirming != current.isConfirming,
      builder: (context, state) {
        final allItems = state.orderHistoryDetailsList.allItems;
        final zpItems = allItems.zpItemOnly;
        final mpItems = allItems.mpItemOnly;
        final zpMaterials = zpItems.materialItemDetailsList;
        final mpMaterials = mpItems.materialItemDetailsList;
        final zpBundles = zpItems.bundleItemDetailsList;
        final mpBundles = mpItems.bundleItemDetailsList;

        return state.isConfirming
            ? LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              )
            : ListView(
                key: WidgetKeys.scrollList,
                shrinkWrap: true,
                children: [
                  const SizedBox(height: padding6),
                  _OrderSuccessMessage(
                    orderStatus: state.orderHistoryDetails.processingStatus,
                  ),
                  if (state.orderHistoryDetailsList.isNotEmpty)
                    Column(
                      key: WidgetKeys.orderSuccessDetail,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: padding24),
                        _OrderSuccessHeader(
                          orderHeader: state.orderHistoryDetails,
                          orderHistoryList: state.orderHistoryDetailsList,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: padding12,
                            vertical: padding12,
                          ),
                          child: AddressInfoSection.order(),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: ZPColors.extraLightGrey2,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding12),
                          child: PayerInformation(expanded: false),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: ZPColors.extraLightGrey2,
                        ),
                        if (mpItems.isNotEmpty)
                          MarketPlaceDeliveryExpansionTile(
                            sellers: mpItems.manufacturers,
                          ),
                        _OrderSuccessSummary(
                          orderHistoryDetailList: state.orderHistoryDetailsList,
                        ),
                        const _Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: padding12,
                            horizontal: padding12,
                          ),
                          child: Text(
                            '${context.tr('Your items')} (${allItems.length})',
                            key: WidgetKeys.orderSuccessItemTotalQty,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: ZPColors.neutralsBlack),
                          ),
                        ),
                        if (zpBundles.isNotEmpty)
                          _OrderSuccessBundleSection(bundleItems: zpBundles),
                        if (zpBundles.isNotEmpty && zpMaterials.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: padding12,
                            ),
                            child: _Divider(),
                          ),
                        if (zpMaterials.isNotEmpty)
                          _OrderSuccessMaterialSection(
                            orderItems: zpMaterials,
                          ),
                        if (zpItems.isNotEmpty && mpItems.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: padding12,
                            ),
                            child: _Divider(),
                          ),
                        if (mpItems.isNotEmpty) ...[
                          const SizedBox(height: padding12),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: padding12,
                            ),
                            child: MarketPlaceTitleWithLogo(showToolTip: true),
                          ),
                          if (mpBundles.isNotEmpty)
                            _OrderSuccessBundleSection(
                              bundleItems: mpBundles,
                            ),
                          if (mpBundles.isNotEmpty && mpMaterials.isNotEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: padding12,
                              ),
                              child: _Divider(),
                            ),
                          if (mpMaterials.isNotEmpty)
                            _OrderSuccessMaterialSection(
                              orderItems: mpMaterials,
                              isMarketPlace: true,
                            ),
                        ],
                      ],
                    ),
                ],
              );
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 0,
      endIndent: 0,
      thickness: 1,
      height: padding24,
      color: ZPColors.extraLightGrey2,
    );
  }
}
