part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterAppBar extends StatelessWidget {
  const _ViewByItemFilterAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.tr('Filter'),
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: ZPColors.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          key: WidgetKeys.closeButton,
          onPressed: () {
            context.read<ViewByItemFilterBloc>().add(
                  ViewByItemFilterEvent.resetFiltersToLastApplied(
                    lastAppliedFilter:
                        context.read<ViewByItemsBloc>().state.appliedFilter,
                  ),
                );
            context.router.maybePop();
          },
          icon: const Icon(
            Icons.clear,
            color: ZPColors.black,
          ),
        ),
      ],
    );
  }
}
