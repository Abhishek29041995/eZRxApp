part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';

class _FromInvoiceDateFilter extends StatelessWidget {
  const _FromInvoiceDateFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getInvoiceDateFilterDateRange !=
          current.filter.getInvoiceDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.fromInvoiceDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<ReturnItemsFilterBloc>();
            final invoiceDateRange = await showDateRangePicker(
              context: context,
              firstDate: locator<Config>().newReturnRequestFilterStartDate,
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getInvoiceDateFilterDateRange,
            );
            if (invoiceDateRange == null) return;
            returnApproverFilterBloc.add(
              ReturnItemsFilterEvent.setInvoiceDate(
                invoiceDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.invoiceDateFrom.dateString,
          ),
          decoration: InputDecoration(
            hintText: context.tr('Date from'),
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

class _ToInvoiceDateFilter extends StatelessWidget {
  const _ToInvoiceDateFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getInvoiceDateFilterDateRange !=
          current.filter.getInvoiceDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.toInvoiceDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<ReturnItemsFilterBloc>();
            final invoiceDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(
                DateTime.now().year - 2,
                DateTime.now().month,
                DateTime.now().day,
              ),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getInvoiceDateFilterDateRange,
            );
            if (invoiceDateRange == null) return;
            returnApproverFilterBloc.add(
              ReturnItemsFilterEvent.setInvoiceDate(
                invoiceDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.invoiceDateTo.dateString,
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
