part of '../return_root.dart';

class _FilterReturnByRequest extends StatelessWidget {
  const _FilterReturnByRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByRequestBloc, ReturnListByRequestState>(
      buildWhen: (previous, current) =>
          previous.appliedFilter.appliedFilterCount !=
              current.appliedFilter.appliedFilterCount ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () => !state.isFetching
              ? _showFilterPage(
                  context: context,
                  stateFilter: state.appliedFilter,
                )
              : null,
        );
      },
    );
  }

  void _showFilterPage({
    required BuildContext context,
    required ReturnFilter stateFilter,
  }) {
    context.read<ViewByRequestReturnFilterBloc>().add(
          ViewByRequestReturnFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: stateFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const ReturnByRequestFilterPage();
      },
    ).then((value) {
      if (value != null && value as ReturnFilter != stateFilter) {
        trackMixpanelEvent(
          TrackingEvents.returnRequestFiltered,
          props: {
            TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
              const ReturnByRequestPageRoute().routeName,
            ),
            TrackingProps.filterUsed: value.trackingInfo,
          },
        );
        context.read<ReturnListByRequestBloc>().add(
              ReturnListByRequestEvent.fetch(
                appliedFilter: value,
                searchKey:
                    context.read<ReturnListByRequestBloc>().state.searchKey,
              ),
            );
      }
    });
  }
}
