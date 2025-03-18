import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<ViewByItemsBloc>(
      create: (context) => locator<ViewByItemsBloc>()
        ..add(
          ViewByItemsEvent.initialized(
            salesOrgConfigs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
            salesOrganisation: eligibilityState.salesOrganisation,
          ),
        ),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            current.isRefreshed(previous, onOrderTypeChanged: false),
        listener: (context, state) {
          context.read<ViewByItemsBloc>().add(
                ViewByItemsEvent.initialized(
                  salesOrgConfigs: state.salesOrgConfigs,
                  customerCodeInfo: state.customerCodeInfo,
                  shipToInfo: state.shipToInfo,
                  user: state.user,
                  salesOrganisation: state.salesOrganisation,
                ),
              );
        },
        child: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.orderHistory.orderHistoryItems !=
              current.orderHistory.orderHistoryItems ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return state.isFetching ||
                state.orderHistory.orderHistoryItems.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: padding12,
                      top: padding6,
                    ),
                    child: SectionTitle(
                      key: WidgetKeys.recentlyOrder,
                      title: 'Your recent order items',
                      onTapIconButton: () => state.isFetching
                          ? null
                          : context.navigateTo(const OrdersTabRoute()),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: state.isFetching
                        ? LoadingShimmer.logo(
                            key: WidgetKeys.recentOrderSectionLoaderImage,
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: padding6),
                            children: state.orderHistory.orderHistoryItems
                                .map((e) => _ProductTile(product: e))
                                .toList(),
                          ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  final OrderHistoryItem product;

  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToOrderDetails(context, product),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            CustomCard(
              margin: const EdgeInsets.all(padding6),
              child: ListTile(
                key: WidgetKeys.listRecentlyOrdered,
                contentPadding: const EdgeInsets.all(padding6),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CustomCard(
                          showBorder: true,
                          showShadow: false,
                          child: ProductImage(
                            materialNumber: product.materialNumber,
                            fit: BoxFit.fitHeight,
                            width: 90,
                            height: 90,
                          ),
                        ),
                        if (product.isOfferItem) ProductTag.onOfferIcon(),
                        if (product.isCovid)
                          const Positioned(
                            top: kToolbarHeight,
                            child: CovidTag(),
                          ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (product.isMarketPlace)
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: MarketPlaceLogo.small(),
                                ),
                              Text(
                                product.combinationCode(
                                  showGMCPart: context
                                      .read<EligibilityBloc>()
                                      .state
                                      .salesOrgConfigs
                                      .enableGMC,
                                  showIRNPart: false,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ZPColors.extraLightGrey4,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              product.defaultMaterialDescription,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              key:
                                  WidgetKeys.materialDescriptionRecentlyOrdered,
                            ),
                          ),
                          Text(
                            '${product.isMarketPlace ? '${context.tr('Sold by')}: ' : ''}${product.principalData.principalName.name}',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToOrderDetails(
    BuildContext context,
    OrderHistoryItem orderHistoryItem,
  ) {
    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderHistoryItem.orderNumber,
            lineNumber: orderHistoryItem.lineNumber,
          ),
        );

    context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
