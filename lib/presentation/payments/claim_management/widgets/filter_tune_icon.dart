part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class _FilterTuneIcon extends StatelessWidget {
  const _FilterTuneIcon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimManagementBloc, ClaimManagementState>(
      buildWhen: (previous, current) =>
          previous.appliedFilter.appliedFilterCount !=
              current.appliedFilter.appliedFilterCount ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          key: WidgetKeys.claimManagementFilterIcon,
          badgeColor: ZPColors.orange,
          count: state.appliedFilter.appliedFilterCount,
          onPressed: !state.isLoading ? () => _showFilterPage(context) : () {},
        );
      },
    );
  }

  Future<void> _showFilterPage(BuildContext context) async {
    context.read<ClaimManagementFilterBloc>().add(
          ClaimManagementFilterEvent.openFilterBottomSheet(
            appliedFilter:
                context.read<ClaimManagementBloc>().state.appliedFilter,
          ),
        );

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.hardEdge,
      builder: (_) {
        return const ClaimManagementFilterBottomSheet();
      },
    );
  }
}
