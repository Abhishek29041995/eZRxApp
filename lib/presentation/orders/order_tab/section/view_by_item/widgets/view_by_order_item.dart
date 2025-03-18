part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItem extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const _ViewByOrderItem({
    required this.orderHistoryItem,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return InkWell(
      onTap: () {
        trackMixpanelEvent(
          TrackingEvents.orderDetailViewed,
          props: {
            TrackingProps.subTabFrom:
                RouterUtils.buildRouteTrackingName(context.routeData.path),
          },
        );
        context.read<ViewByItemDetailsBloc>().add(
              ViewByItemDetailsEvent.fetchOrderHistoryDetails(
                orderNumber: orderHistoryItem.orderNumber,
                lineNumber: orderHistoryItem.lineNumber,
              ),
            );

        context.router.push(
          const ViewByItemDetailsPageRoute(),
        );
      },
      child: _ViewByOrderItemTile(
        key: WidgetKeys.viewByItemsOrderItemKey,
        orderHistoryItem: orderHistoryItem,
        salesOrgConfigs: salesOrgConfigs,
      ),
    );
  }
}
