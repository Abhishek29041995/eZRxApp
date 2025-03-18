part of 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';

//TODO(Hob): Will fix the duplicate when we apply single filter same with payment
//ignore_for_file: code-duplication
class _RequestDateRangePicker extends StatelessWidget {
  const _RequestDateRangePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _FromRequestDateFilter(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding6),
          child: Text(
            '-',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const _ToRequestDateFilter(),
      ],
    );
  }
}

class _FromRequestDateFilter extends StatelessWidget {
  const _FromRequestDateFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getReturnDateFilterDateRange !=
          current.filter.getReturnDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.fromReturnDateField,
            onTap: () async {
              final returnByItemFilterBloc =
                  context.read<ViewByItemReturnFilterBloc>();
              final returnDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getReturnDateFilterDateRange,
              );
              if (returnDateRange == null) return;
              returnByItemFilterBloc.add(
                ViewByItemReturnFilterEvent.setReturnDate(
                  returnDateRange: returnDateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.returnDateFrom.dateString,
            ),
            decoration: InputDecoration(
              hintText: context.tr('Date from'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: padding6),
                child: Icon(
                  Icons.calendar_month,
                  size: 20,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(maxWidth: padding24),
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.disabledBorder,
            ),
          ),
        );
      },
    );
  }
}

class _ToRequestDateFilter extends StatelessWidget {
  const _ToRequestDateFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getReturnDateFilterDateRange !=
          current.filter.getReturnDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.toReturnDateField,
            onTap: () async {
              final returnByItemFilterBloc =
                  context.read<ViewByItemReturnFilterBloc>();
              final returnDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getReturnDateFilterDateRange,
              );
              if (returnDateRange == null) return;
              returnByItemFilterBloc.add(
                ViewByItemReturnFilterEvent.setReturnDate(
                  returnDateRange: returnDateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.returnDateTo.dateString,
            ),
            decoration: InputDecoration(
              hintText: context.tr('Date to'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: padding6),
                child: Icon(
                  Icons.calendar_month,
                  size: 20,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(maxWidth: padding24),
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.disabledBorder,
            ),
          ),
        );
      },
    );
  }
}
