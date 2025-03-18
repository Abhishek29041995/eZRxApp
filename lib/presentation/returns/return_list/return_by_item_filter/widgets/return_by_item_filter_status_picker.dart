part of 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';

class _StatusPicker extends StatelessWidget {
  const _StatusPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.returnStatusList != current.filter.returnStatusList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statusList.map((StatusType status) {
            final name = status.displayStatus;
            final value = state.filter.returnStatusList.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.returnStatusFilter(name, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                context.tr(name),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setReturnStatus(
                        status: status,
                        value: value ?? false,
                      ),
                    );
              },
              value: value,
            );
          }).toList(),
        );
      },
    );
  }
}
