import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/from_document_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/from_due_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/payments/widgets/radio_filter_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/status_selector_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/to_document_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/to_due_date_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullSummaryFilterBottomSheet extends StatelessWidget {
  final bool isMarketPlace;

  const FullSummaryFilterBottomSheet({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<FullSummaryFilterBloc, FullSummaryFilterState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages ||
            previous.filter.filterOption != current.filter.filterOption,
        builder: (context, state) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            key: WidgetKeys.tempFilter,
            children: <Widget>[
              AppBar(
                title: Text(
                  context.tr('Filter'),
                ),
                automaticallyImplyLeading: false,
                centerTitle: false,
                elevation: 0,
                actions: [
                  IconButton(
                    key: WidgetKeys.closeButton,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: ZPColors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12.0,
                ),
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
                        title: 'Document date',
                        padding: const EdgeInsets.only(bottom: 16.0),
                        filterWidet: Row(
                          children: [
                            BlocBuilder<FullSummaryFilterBloc,
                                FullSummaryFilterState>(
                              buildWhen: (previous, current) =>
                                  previous
                                      .filter.getDocumentDateFilterDateRange !=
                                  current.filter.getDocumentDateFilterDateRange,
                              builder: (context, state) =>
                                  FromDocumentDateFilter(
                                documentDateFilterDateRange:
                                    state.filter.getDocumentDateFilterDateRange,
                                documentDateFrom:
                                    state.filter.documentDateFrom.dateString,
                                onDocumentDateChanged:
                                    (DateTimeRange documentDateRange) => context
                                        .read<FullSummaryFilterBloc>()
                                        .add(
                                          FullSummaryFilterEvent
                                              .setDocumentDate(
                                            documentDateRange,
                                          ),
                                        ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '-',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            BlocBuilder<FullSummaryFilterBloc,
                                FullSummaryFilterState>(
                              buildWhen: (previous, current) =>
                                  previous
                                      .filter.getDocumentDateFilterDateRange !=
                                  current.filter.getDocumentDateFilterDateRange,
                              builder: (context, state) => ToDocumentDateFilter(
                                documentDateFilterDateRange:
                                    state.filter.getDocumentDateFilterDateRange,
                                documentDateTo:
                                    state.filter.documentDateTo.dateString,
                                onDocumentDateChanged:
                                    (DateTimeRange documentDateRange) => context
                                        .read<FullSummaryFilterBloc>()
                                        .add(
                                          FullSummaryFilterEvent
                                              .setDocumentDate(
                                            documentDateRange,
                                          ),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RadioFilterSection(
                        radioValue: FilterOption.dueDate(),
                        selectedValue: state.filter.filterOption,
                        title: 'Due Date',
                        filterWidet: Row(
                          children: [
                            BlocBuilder<FullSummaryFilterBloc,
                                FullSummaryFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.filter.getDueDateFilterDateRange !=
                                  current.filter.getDueDateFilterDateRange,
                              builder: (context, state) => FromDueDateFilter(
                                dueDateFilterDateRange:
                                    state.filter.getDueDateFilterDateRange,
                                dueDateFrom:
                                    state.filter.dueDateFrom.dateString,
                                onDueDateChanged:
                                    (DateTimeRange dueDateRange) => context
                                        .read<FullSummaryFilterBloc>()
                                        .add(
                                          FullSummaryFilterEvent.setDueDate(
                                            dueDateRange,
                                          ),
                                        ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '-',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            BlocBuilder<FullSummaryFilterBloc,
                                FullSummaryFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.filter.getDueDateFilterDateRange !=
                                  current.filter.getDueDateFilterDateRange,
                              builder: (context, state) => ToDueDateFilter(
                                dueDateFilterDateRange:
                                    state.filter.getDueDateFilterDateRange,
                                dueDateTo: state.filter.dueDateTo.dateString,
                                onDueDateChanged:
                                    (DateTimeRange dueDateRange) => context
                                        .read<FullSummaryFilterBloc>()
                                        .add(
                                          FullSummaryFilterEvent.setDueDate(
                                            dueDateRange,
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
                        filterWidet: BlocBuilder<FullSummaryFilterBloc,
                            FullSummaryFilterState>(
                          buildWhen: (previous, current) =>
                              previous.filter.filterStatuses !=
                              current.filter.filterStatuses,
                          builder: (context, state) => StatusSelectorFilter<String>(
                            statusesDisplay: state.statuses,
                            filteredStatuses: state.filter.filterStatuses,
                            onStatusSelected: (status, value) =>
                                context.read<FullSummaryFilterBloc>().add(
                                      FullSummaryFilterEvent.statusChanged(
                                        status,
                                        value,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          _ResetButton(),
                          SizedBox(width: 16),
                          _ApplyButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          if (context
                  .read<FullSummaryFilterBloc>()
                  .state
                  .filter
                  .excludeSearch !=
              FullSummaryFilter.defaultFilter()) {
            context.fullSummaryBloc(context.isMPPayment).add(
                  FullSummaryEvent.fetch(
                    appliedFilter: FullSummaryFilter.defaultFilter().copyWith(
                      searchKey: context
                          .fullSummaryBloc(context.isMPPayment)
                          .state
                          .appliedFilter
                          .searchKey,
                    ),
                  ),
                );
          }
          context.router.popForced();
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.filterApplyButton,
        onPressed: () {
          final filterBloc = context.read<FullSummaryFilterBloc>();
          filterBloc.add(
            const FullSummaryFilterEvent.validateFilters(),
          );
          if (filterBloc.state.filter.isValid &&
              (filterBloc.state.filter !=
                  context
                      .fullSummaryBloc(context.isMPPayment)
                      .state
                      .appliedFilter)) {
            context.fullSummaryBloc(context.isMPPayment).add(
                  FullSummaryEvent.fetch(
                    appliedFilter: filterBloc.state.filter,
                  ),
                );

            context.router.popForced();
          }
        },
        child: Text(
          context.tr('Apply'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
