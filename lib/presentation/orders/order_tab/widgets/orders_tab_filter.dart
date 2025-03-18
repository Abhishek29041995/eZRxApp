part of 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';

class _OrdersTabFilter extends StatelessWidget {
  const _OrdersTabFilter({super.key, required this.viewByItem});
  final bool viewByItem;

  @override
  Widget build(BuildContext context) {
    return viewByItem
        ? BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterElement(
                isNotFetching:
                    !context.read<ViewByItemsBloc>().state.isFetching,
                viewByItem: viewByItem,
                appliedFilterCount: context
                    .read<ViewByItemsBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          )
        : BlocBuilder<ViewByOrderBloc, ViewByOrderState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterElement(
                isNotFetching:
                    !context.read<ViewByOrderBloc>().state.isFetching,
                viewByItem: viewByItem,
                appliedFilterCount: context
                    .read<ViewByOrderBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          );
  }
}

class _FilterElement extends StatelessWidget {
  const _FilterElement({
    required this.isNotFetching,
    required this.viewByItem,
    required this.appliedFilterCount,
  });
  final bool isNotFetching;
  final bool viewByItem;
  final int appliedFilterCount;

  @override
  Widget build(BuildContext context) {
    return CustomBadge(
      Icons.tune_outlined,
      key: WidgetKeys.filterOrderIcon,
      count: appliedFilterCount,
      badgeColor: ZPColors.orange,
      onPressed: () => isNotFetching
          ? _showFilterPage(
              context: context,
              viewByItem: viewByItem,
            )
          : null,
    );
  }

  void _showFilterPage({
    required BuildContext context,
    required bool viewByItem,
  }) {
    if (!viewByItem) {
      context.read<ViewByOrderFilterBloc>().add(
            ViewByOrderFilterEvent.updateCurrentFilter(
              currentFilter:
                  context.read<ViewByOrderBloc>().state.appliedFilter,
            ),
          );
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.88),
      builder: (_) {
        return viewByItem
            ? const ViewByItemFilterSheet()
            : const ViewByOrderFilterBottomSheet();
      },
    ).then(
      (value) {
        if (value == null) return;
        viewByItem
            ? _doFetchViewByItem(
                context: context,
                filter: value as ViewByItemFilter,
              )
            : _doFetchViewByOrder(
                context: context,
                filter: value as ViewByOrdersFilter,
              );
      },
    );
  }

  void _doFetchViewByItem({
    required BuildContext context,
    required ViewByItemFilter filter,
  }) {
    trackMixpanelEvent(
      TrackingEvents.orderDetailFiltered,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          const ViewByItemsPageRoute().routeName,
        ),
        TrackingProps.filterUsed: [
          '${filter.orderDateFrom.dateString} - ${filter.orderDateTo.dateString}',
          ...filter.orderStatusList.map((e) => e.getOrDefaultValue('')),
        ],
      },
    );
    context.read<ViewByItemsBloc>().add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: filter,
            searchKey: context.read<ViewByItemsBloc>().state.searchKey,
          ),
        );
  }

  void _doFetchViewByOrder({
    required BuildContext context,
    required ViewByOrdersFilter filter,
  }) {
    trackMixpanelEvent(
      TrackingEvents.orderDetailFiltered,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          const ViewByOrdersPageRoute().routeName,
        ),
        TrackingProps.filterUsed: [
          '${filter.orderDateFrom.dateString} - ${filter.orderDateTo.dateString}',
        ],
      },
    );
    context.read<ViewByOrderBloc>().add(
          ViewByOrderEvent.fetch(
            filter: filter,
            searchKey: context.read<ViewByOrderBloc>().state.searchKey,
            isDetailsPage: false,
          ),
        );
  }
}
