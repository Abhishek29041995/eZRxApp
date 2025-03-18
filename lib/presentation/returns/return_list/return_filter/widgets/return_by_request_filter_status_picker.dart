part of 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';

class _StatusPicker extends StatelessWidget {
  const _StatusPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByRequestReturnFilterBloc,
        ViewByRequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.returnStatusList != current.filter.returnStatusList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statusList.map((StatusType status) {
            final value = state.filter.returnStatusList.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.returnStatusFilter(
                status.displayStatusForViewByRequest,
                value,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                context.tr(status.displayStatusForViewByRequest),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ViewByRequestReturnFilterBloc>().add(
                      ViewByRequestReturnFilterEvent.setReturnStatus(
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
