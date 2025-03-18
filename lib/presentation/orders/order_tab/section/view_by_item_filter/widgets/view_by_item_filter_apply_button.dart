part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterApplyButton extends StatelessWidget {
  const _ViewByItemFilterApplyButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.filterApplyButton,
      onPressed: () {
        Navigator.of(context).pop(
          context.read<ViewByItemFilterBloc>().state.filter,
        );
      },
      child: Text(
        context.tr('Apply'),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
