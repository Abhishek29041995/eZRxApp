import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

@RoutePage()
class AllInvoicesPage extends StatefulWidget {
  final bool isMarketPlace;

  const AllInvoicesPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<AllInvoicesPage> createState() => _AllInvoicesPageState();
}

class _AllInvoicesPageState extends State<AllInvoicesPage> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: widget.isMarketPlace,
      child: Scaffold(
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
            bloc: context.allInvoicesBloc(widget.isMarketPlace),
            listenWhen: (previous, current) =>
                previous.failureOrSuccessOption !=
                current.failureOrSuccessOption,
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
              return ScrollList<CreditAndInvoiceGroup>(
                noRecordFoundWidget: const NoRecordFound(
                  title: 'No invoice found',
                ),
                dismissOnDrag: true,
                controller: _controller,
                onRefresh: () =>
                    context.allInvoicesBloc(widget.isMarketPlace).add(
                          AllInvoicesEvent.fetch(
                            appliedFilter: AllInvoicesFilter.defaultFilter(),
                          ),
                        ),
                onLoadingMore: () =>
                    context.allInvoicesBloc(widget.isMarketPlace).add(
                          const AllInvoicesEvent.loadMore(),
                        ),
                isLoading: state.isLoading,
                itemBuilder: (context, index, item) => _InvoiceGroup(
                  data: item,
                  showDivider: index != 0,
                ),
                items: state.items.groupList,
              );
            },
          ),
        ),
        floatingActionButton: NewPaymentButton.scale(
          controller: _controller,
        ),
      ),
    );
  }
}

class _InvoiceGroup extends StatelessWidget {
  final CreditAndInvoiceGroup data;
  final bool showDivider;

  const _InvoiceGroup({
    required this.data,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '${context.tr('Created on')} ${data.dueDate.dateString}',
                  key: WidgetKeys.invoiceItemCreatedDate,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: data.items
                    .map(
                      (e) => _InvoiceItem(
                        invoiceItem: e,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;

  const _InvoiceItem({
    required this.invoiceItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.invoiceItem,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        onTap: () {
          trackMixpanelEvent(TrackingEvents.paymentDocumentViewed);
          context.read<CreditAndInvoiceDetailsBloc>().add(
                CreditAndInvoiceDetailsEvent.fetch(
                  creditAndInvoiceItem: invoiceItem,
                  isMarketPlace: context.isMPPayment,
                ),
              );

          context.router.push(
            InvoiceDetailsPageRoute(isMarketPlace: context.isMPPayment),
          );
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (context.isMPPayment) ...[
                  MarketPlaceLogo.small(),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    '${context.tr('Invoice')} #${invoiceItem.searchKey.displayNAIfEmpty}',
                    key: WidgetKeys.invoiceItemId,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                StatusLabel(
                  key: WidgetKeys.invoiceItemStatus,
                  status: StatusType(
                    invoiceItem.invoiceProcessingStatus.getOrDefaultValue(''),
                  ),
                ),
              ],
            ),
            if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
              Padding(
                key: WidgetKeys.governmentNumber,
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  '${context.tr('Gov. no')} ${invoiceItem.documentReferenceID.displayDashIfEmpty}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${context.tr('Order')} #${invoiceItem.orderId.displayNAIfEmpty}',
                      key: WidgetKeys.invoiceItemOrderId,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${context.tr('Due on')} ${StringUtils.getDueDateString(
                        invoiceItem.netDueDate.dateTimeOrNull,
                        context.read<EligibilityBloc>().state.salesOrganisation,
                      )}',
                      key: WidgetKeys.invoiceItemDueDate,
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: invoiceItem
                                .invoiceProcessingStatus.displayDueDateColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: invoiceItem.amountInTransactionCurrency.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
