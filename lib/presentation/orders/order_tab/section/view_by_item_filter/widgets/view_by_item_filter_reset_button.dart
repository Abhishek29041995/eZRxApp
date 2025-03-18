part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterResetButton extends StatelessWidget {
  const _ViewByItemFilterResetButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: WidgetKeys.filterResetButton,
      onPressed: () {
        context.read<ViewByItemFilterBloc>().add(
              const ViewByItemFilterEvent.resetFilter(),
            );
        Navigator.of(context).pop(
          context.read<ViewByItemFilterBloc>().state.emptyViewByItemFilter,
        );
      },
      child: Text(
        context.tr('Reset'),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}
