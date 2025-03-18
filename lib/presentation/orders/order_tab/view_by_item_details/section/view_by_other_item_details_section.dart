part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class OtherItemDetailsSection extends StatelessWidget {
  final List<OrderHistoryItem> otherItems;
  final bool isMarketPlace;

  const OtherItemDetailsSection({
    super.key,
    required this.otherItems,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    if (otherItems.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 20,
        right: 20,
      ),
      child: custom.ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          context.tr('Other items in this order'),
          key: WidgetKeys.viewByItemDetailExpandButton,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        expandWidgetkey: WidgetKeys.viewByItemDetailOtherItemExpandSection,
        children: otherItems.getViewByOrderItemDetailsList
            .mapIndexed(
              (index, e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // All Marketplace items from the same manufacturer will be in one order
                  // hence we won't need to display the manufacturer name for each group of items here
                  if (index == 0 && isMarketPlace) const SizedBox(height: 16),
                  if (!isMarketPlace) ...[
                    const SizedBox(height: 16),
                    Text(
                      e.manufactureName.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 10),
                  ],
                  Column(
                    children: e.orderHistoryItem
                        .mapIndexed(
                          (index, e) => ViewByItemOrderItemTile(
                            orderHistoryItem: e,
                            key: WidgetKeys.genericKey(key: index.toString()),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
