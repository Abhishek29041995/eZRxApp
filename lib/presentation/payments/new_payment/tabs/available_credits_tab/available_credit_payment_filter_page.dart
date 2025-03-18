import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_from_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_to_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/from_document_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/radio_filter_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/to_document_date_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableCreditPaymentFilterPage extends StatelessWidget {
  const AvailableCreditPaymentFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  context.router.maybePop();
                },
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const _PaymentFilter(),
          ),
        ],
      ),
    );
  }
}

class _PaymentFilter extends StatelessWidget {
  const _PaymentFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage ||
          previous.filter.filterOption != current.filter.filterOption,
      builder: (context, state) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioFilterSection(
                radioValue: FilterOption.documentDate(),
                selectedValue: state.filter.filterOption,
                title: 'Document date',
                padding: const EdgeInsets.only(bottom: 16.0),
                filterWidet: Row(
                  children: [
                    BlocBuilder<AvailableCreditFilterBloc,
                        AvailableCreditFilterState>(
                      buildWhen: (previous, current) =>
                          previous.filter.getDocumentDateFilterDateRange !=
                          current.filter.getDocumentDateFilterDateRange,
                      builder: (context, state) => FromDocumentDateFilter(
                        documentDateFilterDateRange:
                            state.filter.getDocumentDateFilterDateRange,
                        documentDateFrom:
                            state.filter.documentDateFrom.dateString,
                        onDocumentDateChanged:
                            (DateTimeRange documentDateRange) => context
                                .read<AvailableCreditFilterBloc>()
                                .add(
                                  AvailableCreditFilterEvent.setDocumentDate(
                                    documentDateRange: documentDateRange,
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
                    BlocBuilder<AvailableCreditFilterBloc,
                        AvailableCreditFilterState>(
                      buildWhen: (previous, current) =>
                          previous.filter.getDocumentDateFilterDateRange !=
                          current.filter.getDocumentDateFilterDateRange,
                      builder: (context, state) => ToDocumentDateFilter(
                        documentDateFilterDateRange:
                            state.filter.getDocumentDateFilterDateRange,
                        documentDateTo: state.filter.documentDateTo.dateString,
                        onDocumentDateChanged:
                            (DateTimeRange documentDateRange) => context
                                .read<AvailableCreditFilterBloc>()
                                .add(
                                  AvailableCreditFilterEvent.setDocumentDate(
                                    documentDateRange: documentDateRange,
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
                showErrorMessage: state.showErrorMessage &&
                    !state.filter.isAvailableCreditAmountValueRangeValid,
                filterWidet: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AvailableCreditFilterBloc,
                        AvailableCreditFilterState>(
                      buildWhen: (previous, current) =>
                          previous.filter.amountValueFrom !=
                          current.filter.amountValueFrom,
                      builder: (context, state) => AmountFromFilter(
                        amountFrom:
                            state.filter.amountValueFrom.apiParameterValue,
                        onAmountFromChanged: (value) =>
                            context.read<AvailableCreditFilterBloc>().add(
                                  AvailableCreditFilterEvent.setAmountFrom(
                                    amountFrom: value.isNotEmpty ? value : '',
                                  ),
                                ),
                        decoration: InputDecoration(
                          labelText:
                              '${context.tr('From')} (${salesOrgConfig.currency.code})',
                          labelStyle:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.darkGray,
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
                    BlocBuilder<AvailableCreditFilterBloc,
                        AvailableCreditFilterState>(
                      buildWhen: (previous, current) =>
                          previous.filter.amountValueTo !=
                          current.filter.amountValueTo,
                      builder: (context, state) => AmountToFilter(
                        amountTo: state.filter.amountValueTo.apiParameterValue,
                        onAmountToChanged: (value) =>
                            context.read<AvailableCreditFilterBloc>().add(
                                  AvailableCreditFilterEvent.setAmountTo(
                                    amountTo: value,
                                  ),
                                ),
                        decoration: InputDecoration(
                          labelText:
                              '${context.tr('To')} (${salesOrgConfig.currency.code})',
                          labelStyle:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  _ResetButton(),
                  SizedBox(
                    width: 16,
                  ),
                  _ApplyButton(),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      },
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
          context.read<AvailableCreditFilterBloc>().add(
                const AvailableCreditFilterEvent.resetFilters(),
              );
          Navigator.of(context).pop(
            AvailableCreditFilter.defaultFilter(),
          );
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
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        final lastAppliedFilter =
            context.read<AvailableCreditsBloc>().state.appliedFilter;
        final currentFilter = state.filter;
        final isEnable = lastAppliedFilter != currentFilter;

        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: isEnable ? () => _onPressed(context: context) : null,
            child: Text(
              context.tr('Apply'),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }

  void _onPressed({
    required BuildContext context,
  }) {
    final isValid = context
        .read<AvailableCreditFilterBloc>()
        .state
        .filter
        .isAvailableCreditAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<AvailableCreditFilterBloc>().state.filter,
          )
        : context.read<AvailableCreditFilterBloc>().add(
              const AvailableCreditFilterEvent.setValidationFailure(),
            );
  }
}
