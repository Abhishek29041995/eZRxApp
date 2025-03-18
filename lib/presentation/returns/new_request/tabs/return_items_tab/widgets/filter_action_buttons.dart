part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      builder: (context, state) {
        return Expanded(
          child: OutlinedButton(
            key: WidgetKeys.filterResetButton,
            onPressed: () {
              if (context.read<ReturnItemsFilterBloc>().state.filter !=
                  ReturnItemsFilter.empty()) {
                context.read<ReturnItemsBloc>().add(
                      ReturnItemsEvent.fetch(
                        appliedFilter: ReturnItemsFilter.init(),
                        searchKey:
                            context.read<ReturnItemsBloc>().state.searchKey,
                      ),
                    );
              }
              context.router.popForced();
            },
            child: Text(
              context.tr('Reset'),
              style: const TextStyle(color: ZPColors.primary),
            ),
          ),
        );
      },
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
          final filterBloc = context.read<ReturnItemsFilterBloc>();
          final returnItemsState = context.read<ReturnItemsBloc>().state;
          if (filterBloc.state.filter != returnItemsState.appliedFilter) {
            context.read<ReturnItemsBloc>().add(
                  ReturnItemsEvent.fetch(
                    appliedFilter: filterBloc.state.filter,
                    searchKey: returnItemsState.searchKey,
                  ),
                );
          }
          context.router.popForced();
        },
        child: Text(
          'Apply'.tr(),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
