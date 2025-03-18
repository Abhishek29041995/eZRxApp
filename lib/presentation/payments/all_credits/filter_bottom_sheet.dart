import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_from_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_to_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/from_document_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/payments/widgets/radio_filter_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/status_selector_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/to_document_date_filter.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';

class AllCreditsFilterBottomSheet extends StatelessWidget {
  final bool isMarketPlace;

  const AllCreditsFilterBottomSheet({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
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
                            BlocBuilder<AllCreditsFilterBloc,
                                AllCreditsFilterState>(
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
                                        .read<AllCreditsFilterBloc>()
                                        .add(
                                          AllCreditsFilterEvent.setDocumentDate(
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
                            BlocBuilder<AllCreditsFilterBloc,
                                AllCreditsFilterState>(
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
                                        .read<AllCreditsFilterBloc>()
                                        .add(
                                          AllCreditsFilterEvent.setDocumentDate(
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
                            BlocBuilder<AllCreditsFilterBloc,
                                AllCreditsFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.filter.amountValueFrom !=
                                  current.filter.amountValueFrom,
                              builder: (context, state) => AmountFromFilter(
                                amountFrom: state
                                    .filter.amountValueFrom.apiParameterValue,
                                onAmountFromChanged: (value) =>
                                    context.read<AllCreditsFilterBloc>().add(
                                          AllCreditsFilterEvent
                                              .amountValueFromChanged(
                                            value,
                                          ),
                                        ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              child: Text(
                                '-',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            BlocBuilder<AllCreditsFilterBloc,
                                AllCreditsFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.filter.amountValueTo !=
                                  current.filter.amountValueTo,
                              builder: (context, state) => AmountToFilter(
                                amountTo: state
                                    .filter.amountValueTo.apiParameterValue,
                                onAmountToChanged: (value) =>
                                    context.read<AllCreditsFilterBloc>().add(
                                          AllCreditsFilterEvent
                                              .amountValueToChanged(
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
                        filterWidet: BlocBuilder<AllCreditsFilterBloc,
                            AllCreditsFilterState>(
                          buildWhen: (previous, current) =>
                              previous.filter.filterStatuses !=
                              current.filter.filterStatuses,
                          builder: (context, state) => StatusSelectorFilter<String>(
                            statusesDisplay: state.statuses,
                            filteredStatuses: state.filter.filterStatuses,
                            onStatusSelected: (status, value) =>
                                context.read<AllCreditsFilterBloc>().add(
                                      AllCreditsFilterEvent.statusChanged(
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
          if (context.read<AllCreditsFilterBloc>().state.filter.excludeSearch !=
              AllCreditsFilter.defaultFilter()) {
            context.allCreditsBloc(context.isMPPayment).add(
                  AllCreditsEvent.fetch(
                    appliedFilter: AllCreditsFilter.defaultFilter().copyWith(
                      searchKey: context
                          .allCreditsBloc(context.isMPPayment)
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
          final filterBloc = context.read<AllCreditsFilterBloc>();
          filterBloc.add(
            const AllCreditsFilterEvent.validateFilters(),
          );
          if (filterBloc.state.filter.isValid) {
            if (filterBloc.state.filter !=
                context
                    .allCreditsBloc(context.isMPPayment)
                    .state
                    .appliedFilter) {
              context.allCreditsBloc(context.isMPPayment).add(
                    AllCreditsEvent.fetch(
                      appliedFilter: filterBloc.state.filter,
                    ),
                  );
            }
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
