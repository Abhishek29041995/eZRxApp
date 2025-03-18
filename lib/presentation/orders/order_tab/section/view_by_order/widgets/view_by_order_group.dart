part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrderGroup extends StatelessWidget {
  final ViewByOrdersGroup viewByOrdersItem;

  final bool showDivider;
  final bool showBanner;

  const _ViewByOrderGroup({
    required this.viewByOrdersItem,
    required this.showDivider,
    required this.showBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.viewByOrdersGroupKey,
      children: [
        if (showBanner)
          InfoLabel(
            textValue: context
                .tr('Order history is limited to the last 6 months from today'),
            mainColor: ZPColors.blueAccent,
            margin: const EdgeInsets.symmetric(horizontal: padding12),
          ),
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: padding24,
                  bottom: padding12,
                ),
                child: Text(
                  '${context.tr('Ordered on')} ${viewByOrdersItem.createdDate.dateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              ...viewByOrdersItem.orderHeaders.map(
                (e) => _ViewByOrder(
                  viewByOrderHistoryItem: e,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
