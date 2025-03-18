import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoice_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/invoice_item_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/widgets/outstanding_invoices_search_bar.dart';

@RoutePage()
class OutstandingInvoicesTab extends StatelessWidget {
  const OutstandingInvoicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.outstandingInvoicesPage,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Row(
            children: [
              const Expanded(
                child: _OutstandingInvoicesSearchBar(),
              ),
              _FilterTune(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: ZPColors.lightBorderYellow,
          ),
          child: Row(
            children: [
              Text(
                context.tr('Outstanding: '),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ZPColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                key: WidgetKeys.textOutstanding,
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: context
                    .accountSummaryBloc(context.isMPPayment)
                    .state
                    .outstandingBalance
                    .amount
                    .getOrDefaultValue('0'),
              ),
            ],
          ),
        ),
        BlocConsumer<OutstandingInvoicesBloc, OutstandingInvoicesState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.items != current.items,
          builder: (context, state) {
            return Expanded(
              child: state.isLoading && state.items.isEmpty
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ScrollList<CustomerOpenItem>(
                        noRecordFoundWidget: NoRecordFound.newPaymentInvoices(
                          isSearchAndFilterEmpty: state.isSearchAndFilterEmpty,
                        ),
                        dismissOnDrag: true,
                        controller: ScrollController(),
                        onRefresh: () {
                          context.read<OutstandingInvoicesBloc>().add(
                                OutstandingInvoicesEvent.fetch(
                                  appliedFilter:
                                      OutstandingInvoiceFilter.defaultFilter(),
                                  searchKey: SearchKey.empty(),
                                  isMarketPlace: context.isMPPayment,
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<OutstandingInvoicesBloc>().add(
                                OutstandingInvoicesEvent.loadMore(
                                  isMarketPlace: context.isMPPayment,
                                ),
                              );
                        },
                        isLoading: state.isLoading,
                        itemBuilder: (context, index, item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: _PaymentItem(
                            data: item,
                          ),
                        ),
                        items: state.items,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    required this.data,
  });

  final CustomerOpenItem data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.paymentItem,
      child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
        builder: (context, state) {
          return EdgeCheckbox(
            onChanged: (bool value) {
              context.read<NewPaymentBloc>().add(
                    NewPaymentEvent.toggleInvoice(selected: value, item: data),
                  );
            },
            value: state.selectedInvoices.contains(data),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: InvoiceItemCard(customerOpenItem: data),
            ),
          );
        },
      ),
    );
  }
}

class _FilterTune extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoicesBloc, OutstandingInvoicesState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () =>
              !state.isLoading ? _showFilterPage(context: context) : null,
        );
      },
    );
  }

  void _showFilterPage({required BuildContext context}) {
    context.read<OutstandingInvoiceFilterBloc>().add(
          OutstandingInvoiceFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter:
                context.read<OutstandingInvoicesBloc>().state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const OutstandingInvoicePaymentFilterPage(
          key: WidgetKeys.outstandingInvoiceFilterPage,
        );
      },
    ).then(
      (value) {
        if (value == null) return;
        final newFilter = value as OutstandingInvoiceFilter;
        final alreadyAppliedFilter =
            context.read<OutstandingInvoicesBloc>().state.appliedFilter;
        if (newFilter != alreadyAppliedFilter) {
          trackMixpanelEvent(
            TrackingEvents.newPaymentFilterUsed,
            props: {TrackingProps.filterUsed: newFilter.trackingInfo},
          );
          context.read<OutstandingInvoicesBloc>().add(
                OutstandingInvoicesEvent.fetch(
                  appliedFilter: newFilter,
                  searchKey:
                      context.read<OutstandingInvoicesBloc>().state.searchKey,
                  isMarketPlace: context.isMPPayment,
                ),
              );
        }
      },
    );
  }
}
