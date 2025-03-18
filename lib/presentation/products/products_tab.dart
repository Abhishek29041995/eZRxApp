import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/bundle_grid_item.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/widgets/order_type_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/stock_info_banner.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/search_and_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.customerBlockOrSuspended != current.customerBlockOrSuspended,
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.materialListPage,
          appBar: CustomAppBar.commonAppBar(
            title: const CustomerCodeSelector(
              key: WidgetKeys.customerCodeSelector,
            ),
            backGroundColor: ZPColors.primary,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            actionWidget: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 8),
                child: CartButton(),
              ),
            ],
            customerBlockedOrSuspended: state.customerBlockOrSuspended,
          ),
          body: BlocBuilder<MaterialListBloc, MaterialListState>(
            buildWhen: (previous, current) =>
                previous.materialList != current.materialList ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              final isFavourite = context
                  .read<MaterialFilterBloc>()
                  .state
                  .materialFilter
                  .isFavourite;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LicenseExpiredBanner(),
                  const EdiUserBanner(),
                  const StockInfoBanner(),
                  const OrderTypeBanner(),
                  const SearchAndFilter(),
                  FilterValueList(state: state),
                  Expanded(
                    child: state.isFetching && state.materialList.isEmpty
                        ? const ProductLoadingShimmer(
                            gridView: true,
                            key: WidgetKeys.materialListLoader,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: padding6,
                            ),
                            child: ScrollableGridView<MaterialInfo>(
                              noRecordFoundWidget: NoRecordFound.productTab(
                                context,
                                isFavourite: isFavourite,
                              ),
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              header: const _TotalMaterialCount(),
                              isLoading: state.isFetching,
                              items: state.materialList,
                              onRefresh: () =>
                                  context.read<MaterialListBloc>().add(
                                        MaterialListEvent.fetch(
                                          selectedMaterialFilter: context
                                              .read<MaterialFilterBloc>()
                                              .state
                                              .materialFilter,
                                        ),
                                      ),
                              onLoadingMore: () =>
                                  context.read<MaterialListBloc>().add(
                                        const MaterialListEvent.loadMore(),
                                      ),
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                                MaterialInfo item,
                              ) =>
                                  item.type.typeMaterial
                                      ? MaterialGridItem(
                                          materialInfo: item,
                                          onTap: () =>
                                              _productOnTap(context, item),
                                          onFavouriteTap: () =>
                                              onFavouriteTap(context, item),
                                        )
                                      : BundleGridItem(materialInfo: item),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _productOnTap(BuildContext context, MaterialInfo materialInfo) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final clickAt =
        RouterUtils.buildRouteTrackingName(context.router.currentPath);
    final isOffer = context.read<MaterialPriceBloc>().state.displayOfferTag(
          materialInfo,
          eligibilityState.user,
        );
    final isOOSPreorder = materialInfo.displayOOSPreorderTag(
      eligibilityState.salesOrgConfigs.hideStockDisplay,
    );

    final tags = <String>[];
    if (isOffer) tags.add('On Offer');
    if (isOOSPreorder) {
      tags.add(
        eligibilityState.salesOrgConfigs.addOosMaterials.productTag(
          eligibilityState.validateOutOfStockValue,
        ),
      );
    }
    trackMixpanelEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt: clickAt,
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.section: 'All product',
        TrackingProps.tag: tags.join(', '),
      },
    );

    trackClevertapEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt: clickAt,
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.tag: tags.join(', '),
      },
    );

    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
  }

  void onFavouriteTap(BuildContext context, MaterialInfo materialInfo) =>
      context.read<MaterialListBloc>().add(
            materialInfo.isFavourite
                ? MaterialListEvent.deleteFavourite(
                    item: materialInfo,
                  )
                : MaterialListEvent.addFavourite(
                    item: materialInfo,
                  ),
          );
}

class _TotalMaterialCount extends StatelessWidget {
  const _TotalMaterialCount();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialListBloc, MaterialListState>(
      buildWhen: (previous, current) =>
          previous.materialList != current.materialList,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: padding24,
            horizontal: padding6,
          ),
          child: Row(
            key: WidgetKeys.totalMaterialItemCount,
            children: [
              Text(
                state.displaySearchResult
                    ? context.tr('Search results')
                    : context.tr('All products'),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 5,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: ZPColors.accentColor,
                ),
                child: Text(
                  '${state.materialCount}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
