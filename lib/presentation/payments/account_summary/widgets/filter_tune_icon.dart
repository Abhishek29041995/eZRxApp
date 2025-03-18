part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _FilterTuneIcon extends StatelessWidget {
  final String currentActiveTabName;

  const _FilterTuneIcon({
    super.key,
    required this.currentActiveTabName,
  });

  @override
  Widget build(BuildContext context) {
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      return BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
        bloc: context.allInvoicesBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _FilterElement(
            isActive: !state.isLoading,
            appliedFilterCount: state.appliedFilter.appliedFilterCount,
          );
        },
      );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      return BlocBuilder<AllCreditsBloc, AllCreditsState>(
        bloc: context.allCreditsBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          final count = state.appliedFilter.appliedFilterCount;

          return _FilterElement(
            key: WidgetKeys.creditFilterApplied(count),
            isActive: !state.isLoading,
            appliedFilterCount: count,
          );
        },
      );
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      return BlocBuilder<FullSummaryBloc, FullSummaryState>(
        bloc: context.fullSummaryBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _FilterElement(
            isActive: !state.isLoading,
            appliedFilterCount: state.appliedFilter.appliedFilterCount,
          );
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class _FilterElement extends StatelessWidget {
  const _FilterElement({
    super.key,
    required this.isActive,
    required this.appliedFilterCount,
  });
  final bool isActive;
  final int appliedFilterCount;

  @override
  Widget build(BuildContext context) {
    return CustomBadge(
      Icons.tune_outlined,
      key: WidgetKeys.paymentSummaryFilterIcon,
      badgeColor: ZPColors.orange,
      count: appliedFilterCount,
      onPressed: isActive
          ? () {
              _showFilterPage(context);
            }
          : () {},
    );
  }

  Future<void> _showFilterPage(BuildContext context) async {
    final currentActiveTabName = context.tabsRouter.current.name;
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      context.read<AllInvoicesFilterBloc>().add(
            AllInvoicesFilterEvent.openFilterBottomSheet(
              appliedFilter: context
                  .allInvoicesBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
            ),
          );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      context.read<AllCreditsFilterBloc>().add(
            AllCreditsFilterEvent.openFilterBottomSheet(
              appliedFilter: context
                  .allCreditsBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
            ),
          );
    }

    if (currentActiveTabName == FullSummaryPageRoute.name) {
      context.read<FullSummaryFilterBloc>().add(
            FullSummaryFilterEvent.openFilterBottomSheet(
              appliedFilter: context
                  .fullSummaryBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
            ),
          );
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.hardEdge,
      builder: (_) {
        if (currentActiveTabName == AllInvoicesPageRoute.name) {
          return AllInvoicesFilterBottomSheet(
            isMarketPlace: context.isMPPayment,
          );
        }
        if (currentActiveTabName == AllCreditsPageRoute.name) {
          return AllCreditsFilterBottomSheet(
            isMarketPlace: context.isMPPayment,
          );
        }
        if (currentActiveTabName == FullSummaryPageRoute.name) {
          return FullSummaryFilterBottomSheet(
            isMarketPlace: context.isMPPayment,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
