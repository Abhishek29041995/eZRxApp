part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ApplyButton extends StatelessWidget {
  const _ApplyButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.filterApplyButton,
        onPressed: () => Navigator.of(context).pop(
          context.read<ViewByOrderFilterBloc>().state.filter,
        ),
        child: Text(
          context.tr('Apply'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
