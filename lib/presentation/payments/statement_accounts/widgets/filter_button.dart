part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _Filter extends StatelessWidget {
  const _Filter();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const SizedBox(width: 5),
          BlocBuilder<SoaBloc, SoaState>(
            bloc: context.soaBloc(context.isMPPayment),
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching ||
                previous.appliedFilter != current.appliedFilter,
            builder: (context, state) {
              return CustomBadge(
                Icons.tune_outlined,
                key: WidgetKeys.soaFilterButton,
                badgeColor: ZPColors.orange,
                count: state.appliedFilter.appliedFilterCount,
                onPressed: () =>
                    state.isFetching ? null : _showFilterBottomSheet(context),
              );
            },
          ),
          const SizedBox(width: 5),
          Text(
            context.tr('Filter by month'),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    context.read<SoaFilterBloc>().add(
          SoaFilterEvent.setFilter(
            context.soaBloc(context.isMPPayment).state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (_) {
        return const _SOAFilterBottomSheet(
          key: WidgetKeys.soaFilterBottomSheetKey,
        );
      },
    ).then(
      (value) {
        if (value == null) return;
        applyFilter(context: context, filter: value as SoaFilter);
      },
    );
  }

  void applyFilter({
    required BuildContext context,
    required SoaFilter filter,
  }) {
    final soaBloc = context.soaBloc(context.isMPPayment);
    if (soaBloc.state.appliedFilter == filter) return;
    soaBloc.add(SoaEvent.updateFilter(soaFilter: filter));
  }
}
