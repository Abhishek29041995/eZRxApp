import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_material.dart';

class OrderBundleItem extends StatelessWidget {
  const OrderBundleItem({
    super.key,
    required this.orderNumber,
    required this.viewByOrdersGroup,
  });
  final OrderNumber orderNumber;
  final ViewByOrdersGroup viewByOrdersGroup;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemBundleTile(
        viewByOrdersGroup.parentId.getOrDefaultValue(''),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTag.bundleOffer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  viewByOrdersGroup.parentId.displayMatNo,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                const SizedBox(height: 4),
                !context
                        .read<ViewByOrderDetailsBloc>()
                        .state
                        .isLoadingBundleDetail
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewByOrdersGroup
                                .bundleMaterial.bundle.bundleName.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                          ),
                          _BundleInformation(
                            key: WidgetKeys.orderHistoryBundleInformation,
                            viewByOrdersGroup: viewByOrdersGroup,
                          ),
                        ],
                      )
                    : LoadingShimmer.tile(line: 3),
                ...viewByOrdersGroup.viewByOrderItem
                    .map(
                      (orderHistoryDetailsOrderItem) => BundleItemMaterial(
                        orderItem: orderHistoryDetailsOrderItem,
                        orderNumber: orderNumber,
                      ),
                    )
                    ,
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.tr('Total qty')}: ${viewByOrdersGroup.bundleMaterial.bundle.totalQty}',
                      key: WidgetKeys.cartItemBundleQty,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    PriceComponent(
                      key: WidgetKeys.cartItemBundleTotalPrice,
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: viewByOrdersGroup.bundleMaterial.bundle.totalPrice
                          .toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BundleInformation extends StatelessWidget {
  final ViewByOrdersGroup viewByOrdersGroup;

  const _BundleInformation({
    super.key,
    required this.viewByOrdersGroup,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;
    final currentOffer =
        viewByOrdersGroup.bundleMaterial.bundle.currentBundleInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (viewByOrdersGroup.bundleMaterial.bundle.showStrikeThroughPrice)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: PriceComponent(
                  salesOrgConfig: salesOrgConfigs,
                  price: viewByOrdersGroup
                      .bundleMaterial.bundle.minimumQuantityBundleMaterial.rate
                      .toString(),
                  trailingText: context.tr('per item'),
                  type: PriceStyle.bundleListPriceStrikeThrough,
                ),
              ),
            PriceComponent(
              salesOrgConfig: salesOrgConfigs,
              price: currentOffer.rate.toString(),
              type: PriceStyle.bundleCartPrice,
              trailingText: context.tr('per item'),
              key: WidgetKeys.addBundleRate,
            ),
          ],
        ),
        Text(
          '${context.tr('Purchase')} ${currentOffer.quantity} ${context.tr('or more for')} ${StringUtils.displayPrice(salesOrgConfigs, currentOffer.rate)} ${context.tr('per item')}',
          key: WidgetKeys.cartItemBundleRate,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.neutralsGrey1,
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }
}
