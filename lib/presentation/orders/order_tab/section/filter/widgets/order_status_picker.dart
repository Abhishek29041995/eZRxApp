part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _OrderStatusPicker extends StatelessWidget {
  final List<StatusType> statusList;
  final List<StatusType> selectedStatus;

  const _OrderStatusPicker({
    required this.statusList,
    required this.selectedStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: statusList.map(
        (StatusType status) {
          final name = context.tr(status.getOrDefaultValue(''));
          final value = selectedStatus.contains(status);

          return CheckboxListTile(
            key: WidgetKeys.statusFilter(name, value),
            contentPadding: EdgeInsets.zero,
            title: Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            visualDensity: VisualDensity.compact,
            onChanged: (bool? value) {
              context.read<ViewByOrderFilterBloc>().add(
                    ViewByOrderFilterEvent.setOrderStatus(
                      status: status,
                      value: value ?? false,
                    ),
                  );
            },
            value: value,
          );
        },
      ).toList(),
    );
  }
}
