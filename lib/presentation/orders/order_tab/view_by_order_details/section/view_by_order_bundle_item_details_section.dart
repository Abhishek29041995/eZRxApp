part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';

class _BundleItemDetailsSection extends StatelessWidget {
  final OrderNumber orderNumber;
  const _BundleItemDetailsSection({
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) =>
          previous.isLoadingBundleDetail != current.isLoadingBundleDetail,
      builder: (context, state) {
        return Padding(
          key: WidgetKeys.viewByOrderDetailBundleSection,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: state.orderHistoryDetails.orderHistoryDetailsOrderItem
                .bundleItemDetailsList
                .map(
                  (e) => OrderBundleItem(
                    viewByOrdersGroup: e,
                    orderNumber: orderNumber,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
