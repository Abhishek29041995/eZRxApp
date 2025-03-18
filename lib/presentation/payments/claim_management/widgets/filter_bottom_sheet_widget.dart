part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class ClaimManagementFilterBottomSheet extends StatelessWidget {
  const ClaimManagementFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.claimTypes != current.filter.claimTypes,
      builder: (context, state) => SafeArea(
        key: WidgetKeys.claimManagementFilterBottomsheet,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            key: WidgetKeys.tempFilter,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Filter'),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  IconButton(
                    key: WidgetKeys.closeButton,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: ZPColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const _FilterByClaimType(),
              const SizedBox(height: 40),
              const Row(
                children: [
                  _ClearAllButton(),
                  SizedBox(width: 16),
                  _ApplyButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClearAllButton extends StatelessWidget {
  const _ClearAllButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          final filterBloc = context.read<ClaimManagementFilterBloc>();
          final claimManagementBloc = context.read<ClaimManagementBloc>();

          if (filterBloc.state.filter.claimTypes.isNotEmpty) {
            claimManagementBloc.add(
              ClaimManagementEvent.applyFilter(
                appliedFilter: ClaimManagementFilter.empty().copyWith(
                  searchKey: claimManagementBloc.state.appliedFilter.searchKey,
                ),
              ),
            );
          }
          context.router.popForced();
        },
        child: Text(
          context.tr('Clear all'),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.primary,
              ),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.filterApplyButton,
        onPressed: () {
          final filterBloc = context.read<ClaimManagementFilterBloc>();
          final claimManagementBloc = context.read<ClaimManagementBloc>();

          if (filterBloc.state.filter !=
              claimManagementBloc.state.appliedFilter) {
            claimManagementBloc.add(
              ClaimManagementEvent.applyFilter(
                appliedFilter: filterBloc.state.filter.copyWith(
                  searchKey: claimManagementBloc.state.appliedFilter.searchKey,
                ),
              ),
            );

            context.router.popForced();
          }
        },
        child: Text(
          context.tr('Apply'),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.white,
              ),
        ),
      ),
    );
  }
}
