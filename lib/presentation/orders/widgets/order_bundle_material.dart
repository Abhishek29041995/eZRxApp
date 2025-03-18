import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_history_stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';

class BundleItemMaterial extends StatelessWidget {
  const BundleItemMaterial({
    super.key,
    required this.orderItem,
    required this.orderNumber,
  });
  final OrderHistoryDetailsOrderItem orderItem;
  final OrderNumber orderNumber;

  Future _goToViewByItemDetail(
    BuildContext context,
  ) async {
    trackMixpanelEvent(
      TrackingEvents.orderDetailViewed,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderNumber,
            lineNumber: orderItem.lineNumber,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return InkWell(
      key: WidgetKeys.orderHistoryBundleItemMaterial(
        orderItem.materialNumber.displayMatNo,
      ),
      onTap: () => _goToViewByItemDetail(context),
      child: CustomCard(
        showShadow: false,
        backgroundColor: ZPColors.tenderUnselectBg,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusLabel(
              status: StatusType(orderItem.sAPStatus.displayOrderStatus),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomCard(
                  showShadow: false,
                  showBorder: true,
                  clipBehavior: Clip.hardEdge,
                  child: ProductImage(
                    width: 72,
                    height: 72,
                    fit: BoxFit.fill,
                    materialNumber: orderItem.materialNumber,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        orderItem.combinationCode(
                          showGMCPart: configs.enableGMC,
                          showIRNPart: configs.enableIRN,
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.neutralsBlack,
                            ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        orderItem.defaultMaterialDescription,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ZPColors.neutralsBlack),
                      ),
                      OrderHistoryStockInfo.viewByOrder(
                        item: orderItem,
                        eligibilityState: context.read<EligibilityBloc>().state,
                      ),
                      Text(
                        orderItem.principalData.principalName.name,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: ZPColors.neutralsGrey1,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        '${context.tr('Qty')}: ${orderItem.qty}',
                        key: WidgetKeys.cartItemProductQty,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ZPColors.neutralsDarkBlack),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
