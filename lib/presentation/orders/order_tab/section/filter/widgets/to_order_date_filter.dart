part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ToOrderDateFilter extends StatelessWidget {
  const _ToOrderDateFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.viewByOrdersFilterToDateKey,
          autocorrect: false,
          onTap: () async {
            final viewByOrderFilterBloc = context.read<ViewByOrderFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 180)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getOrderDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            viewByOrderFilterBloc.add(
              ViewByOrderFilterEvent.setDateRange(documentDateRange),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.orderDateTo.dateString,
          ),
          decoration: InputDecoration(
             hintText: context.tr('Date to'),
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }
}
