part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrder extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;

  const _ViewByOrder({
    required this.viewByOrderHistoryItem,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return CustomCard(
      key: WidgetKeys.viewByOrdersItemKey,
      child: ListTile(
        onTap: () {
          if (!context.read<ReOrderPermissionBloc>().state.isFetching &&
              !context.read<CartBloc>().state.isBuyAgain) {
            trackMixpanelEvent(
              TrackingEvents.orderDetailViewed,
              props: {
                TrackingProps.subTabFrom:
                    RouterUtils.buildRouteTrackingName(context.routeData.path),
              },
            );
            context.read<ViewByOrderDetailsBloc>().add(
                  ViewByOrderDetailsEvent.fetch(
                    orderNumber: viewByOrderHistoryItem.orderNumber,
                  ),
                );
          }
        },
        contentPadding: const EdgeInsets.symmetric(
          horizontal: padding12,
          vertical: padding6,
        ),
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (viewByOrderHistoryItem.isMarketPlace)
                  const Padding(
                    padding: EdgeInsets.only(right: padding6),
                    child: MarketPlaceLogo(),
                  ),
                Flexible(
                  child: RichText(
                    key: WidgetKeys.viewByOrdersCodeLabelKey,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelSmall,
                      children: [
                        TextSpan(
                          text:
                              '${context.tr(viewByOrderHistoryItem.processingStatus.prefix)} #${viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
                        ),
                        if (viewByOrderHistoryItem.processingStatus.isInQueue)
                          const WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: QueueNumberInfoIcon(),
                          ),
                      ],
                    ),
                  ),
                ),
                if (eligibilityState.salesOrg.isID)
                  StatusLabel(
                    key: WidgetKeys.viewByOrderStatusKey,
                    status: StatusType(
                      viewByOrderHistoryItem.processingStatus
                          .getOrDefaultValue(''),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      context.tr(
                        '{qty} items',
                        namedArgs: {
                          'qty': viewByOrderHistoryItem.itemCount.toString(),
                        },
                      ),
                      key: WidgetKeys.viewByOrdersQtyLabelKey,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  PriceComponent(
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: viewByOrderHistoryItem.totalValue.toStringAsFixed(2),
                    title: context.tr('Order total : '),
                    priceLabelStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                  ),
                ],
              ),
            ),
            if (context.read<ViewByOrderBloc>().state.displayBuyAgainButton(
                  viewByOrderHistoryItem.type,
                  viewByOrderHistoryItem.isMarketPlace,
                ))
              BuyAgainButton(
                viewByOrderHistoryItem: viewByOrderHistoryItem,
                key: WidgetKeys.viewByOrderBuyAgainButtonKey,
              ),
          ],
        ),
      ),
    );
  }
}
