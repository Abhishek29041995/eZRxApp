part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class _ViewByItemStatusTracker extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final List<OrderStatusTracker> subSteps;
  const _ViewByItemStatusTracker({
    required this.orderHistoryItem,
    required this.subSteps,
  });

  @override
  Widget build(BuildContext context) {
    return StatusTrackerSection(
      title: context.tr('Order status'),
      status: orderHistoryItem.status.displaySAPOrderStatus,
      onTap: () => _showDetailsPage(
        context: context,
      ),
    );
  }

  void _showDetailsPage({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) => OrderStatusSection(
        deliveryDate: orderHistoryItem.deliveryDate,
        deliveryDateTitle: orderHistoryItem.status.deliveryDateTitle,
        steps: orderHistoryItem.status.viewByItemHistorySteps
            .updatedOutOfDeliverySubSteps(subSteps),
      ),
    );
  }
}
