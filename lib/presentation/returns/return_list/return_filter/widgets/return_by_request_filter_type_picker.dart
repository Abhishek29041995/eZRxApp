part of 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';

class _ReturnTypePicker extends StatelessWidget {
  const _ReturnTypePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByRequestReturnFilterBloc,
        ViewByRequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.materialOriginFilter !=
          current.filter.materialOriginFilter,
      builder: (context, state) => Column(
        children: MaterialOriginFilter.supportedTypes.map((type) {
          return ListTileTheme(
            horizontalTitleGap: 2,
            child: RadioListTile<MaterialOriginFilter>(
              key: WidgetKeys.filterRadioTile(
                type.titleViewByItem,
                state.filter.materialOriginFilter == type,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                context.tr(type.titleViewByItem),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                if (value == null) return;
                context.read<ViewByRequestReturnFilterBloc>().add(
                      ViewByRequestReturnFilterEvent.setReturnType(type: value),
                    );
              },
              groupValue: state.filter.materialOriginFilter,
              value: type,
            ),
          );
        }).toList(),
      ),
    );
  }
}
