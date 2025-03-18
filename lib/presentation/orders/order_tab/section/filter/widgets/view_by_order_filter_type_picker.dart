part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ViewByOrderFilterHistoryTypePicker extends StatelessWidget {
  const _ViewByOrderFilterHistoryTypePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.orderHistoryType != current.filter.orderHistoryType,
      builder: (context, state) => Column(
        children: MaterialOriginFilter.supportedTypes.map((type) {
          return ListTileTheme(
            horizontalTitleGap: 2,
            child: RadioListTile<MaterialOriginFilter>(
              key: WidgetKeys.filterRadioTile(
                type.titleViewByOrder,
                state.filter.orderHistoryType == type,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                type.titleViewByOrder,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                if (value == null) return;
                context.read<ViewByOrderFilterBloc>().add(
                      ViewByOrderFilterEvent.setOrderHistoryType(type: value),
                    );
              },
              groupValue: state.filter.orderHistoryType,
              value: type,
            ),
          );
        }).toList(),
      ),
    );
  }
}
