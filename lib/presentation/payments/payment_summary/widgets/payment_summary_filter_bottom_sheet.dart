part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryFilterBottomSheet extends StatelessWidget {
  final bool isMarketPlace;

  const _PaymentSummaryFilterBottomSheet({
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {

    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages ||
            previous.filter.filterOption != current.filter.filterOption,
        builder: (context, state) => CustomBottomSheet(
          sheetKey: WidgetKeys.paymentSummaryFilter,
          headerText: 'Filter',
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RadioFilterSection(
                  radioValue: FilterOption.documentDate(),
                  selectedValue: state.filter.filterOption,
                  title: 'Created date',
                  padding: const EdgeInsets.only(bottom: 16.0),
                  filterWidet: Row(
                    children: [
                      BlocBuilder<PaymentSummaryFilterBloc,
                          PaymentSummaryFilterState>(
                        buildWhen: (previous, current) =>
                            previous.filter.getCreatedDateFilterDateRange !=
                            current.filter.getCreatedDateFilterDateRange,
                        builder: (context, state) => FromDocumentDateFilter(
                          documentDateFilterDateRange:
                              state.filter.getCreatedDateFilterDateRange,
                          documentDateFrom:
                              state.filter.createdDateFrom.dateString,
                          onDocumentDateChanged:
                              (DateTimeRange documentDateRange) => context
                                  .read<PaymentSummaryFilterBloc>()
                                  .add(
                                    PaymentSummaryFilterEvent.setCreatedDate(
                                      documentDateRange,
                                    ),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      BlocBuilder<PaymentSummaryFilterBloc,
                          PaymentSummaryFilterState>(
                        buildWhen: (previous, current) =>
                            previous.filter.getCreatedDateFilterDateRange !=
                            current.filter.getCreatedDateFilterDateRange,
                        builder: (context, state) => ToDocumentDateFilter(
                          documentDateFilterDateRange:
                              state.filter.getCreatedDateFilterDateRange,
                          documentDateTo: state.filter.createdDateTo.dateString,
                          onDocumentDateChanged:
                              (DateTimeRange documentDateRange) => context
                                  .read<PaymentSummaryFilterBloc>()
                                  .add(
                                    PaymentSummaryFilterEvent.setCreatedDate(
                                      documentDateRange,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                RadioFilterSection(
                  radioValue: FilterOption.amountRange(),
                  selectedValue: state.filter.filterOption,
                  title: 'Amount range',
                  showErrorMessage: state.showErrorMessages &&
                      !state.filter.isAmountValueRangeValid,
                  filterWidet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<PaymentSummaryFilterBloc,
                          PaymentSummaryFilterState>(
                        buildWhen: (previous, current) =>
                            previous.filter.amountValueFrom !=
                            current.filter.amountValueFrom,
                        builder: (context, state) => AmountFromFilter(
                          amountFrom:
                              state.filter.amountValueFrom.apiParameterValue,
                          onAmountFromChanged: (value) =>
                              context.read<PaymentSummaryFilterBloc>().add(
                                    PaymentSummaryFilterEvent
                                        .amountValueFromChanged(
                                      value,
                                    ),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      BlocBuilder<PaymentSummaryFilterBloc,
                          PaymentSummaryFilterState>(
                        buildWhen: (previous, current) =>
                            previous.filter.amountValueTo !=
                            current.filter.amountValueTo,
                        builder: (context, state) => AmountToFilter(
                          amountTo:
                              state.filter.amountValueTo.apiParameterValue,
                          onAmountToChanged: (value) => context
                              .read<PaymentSummaryFilterBloc>()
                              .add(
                                PaymentSummaryFilterEvent.amountValueToChanged(
                                  value,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                RadioFilterSection(
                  radioValue: FilterOption.status(),
                  selectedValue: state.filter.filterOption,
                  title: 'Status',
                  filterWidet: BlocBuilder<PaymentSummaryFilterBloc,
                      PaymentSummaryFilterState>(
                    buildWhen: (previous, current) =>
                        previous.filter.filterStatuses !=
                        current.filter.filterStatuses,
                    builder: (context, state) =>
                        StatusSelectorFilter<FilterStatus>(
                      statusesDisplay: state.statuses,
                      filteredStatuses: state.filter.filterStatuses,
                      onStatusSelected: (status, value) =>
                          context.read<PaymentSummaryFilterBloc>().add(
                                PaymentSummaryFilterEvent.statusChanged(
                                  status,
                                ),
                              ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    _PaymentSummaryResetButton(),
                    SizedBox(
                      width: 16,
                    ),
                    _PaymentSummaryApplyButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
