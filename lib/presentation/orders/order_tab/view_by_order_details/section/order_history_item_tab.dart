part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';

class _OrderHistoryItemTab extends StatelessWidget {
  const _OrderHistoryItemTab();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ViewByOrderDetailsBloc>().state;

    return Column(
      children: [
        if (state.orderHistoryDetails.orderHistoryDetailsOrderItem
            .bundleItemDetailsList.isNotEmpty)
          _BundleItemDetailsSection(
            orderNumber: state.orderHistoryDetails.orderNumber,
          ),
        if (state.orderHistoryDetails.orderHistoryDetailsOrderItem
            .materialItemDetailsList.isNotEmpty)
          OrderItemDetailsSection(
            viewByOrderHistoryGroupList: state.orderHistoryDetails
                .orderHistoryDetailsOrderItem.materialItemDetailsList,
            isMarketPlace: state.orderHistoryDetails.isMarketPlace,
          ),
      ],
    );
  }
}
