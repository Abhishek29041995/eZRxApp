part of 'package:ezrxmobile/presentation/payments/full_summary/full_summary.dart';

class _InvoiceCreditItem extends StatelessWidget {
  final CreditAndInvoiceItem data;

  const _InvoiceCreditItem({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return CustomCard(
      key: WidgetKeys.invoiceCreditItem,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        onTap: () {
          trackMixpanelEvent(TrackingEvents.paymentDocumentViewed);
          context.read<CreditAndInvoiceDetailsBloc>().add(
                CreditAndInvoiceDetailsEvent.fetch(
                  creditAndInvoiceItem: data,
                  isMarketPlace: context.isMPPayment,
                ),
              );
          if (data.debitCreditCode.isCredit) {
            context.router.push(
              CreditDetailsPageRoute(isMarketPlace: context.isMPPayment),
            );

            return;
          }
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
                    '${context.tr(data.debitCreditCode.isCredit ? 'Credit' : 'Debit')} #${data.searchKey.displayNAIfEmpty}',
                    key: WidgetKeys.invoiceCreditItemId,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                StatusLabel(
                  key: WidgetKeys.invoiceItemStatus,
                  status: StatusType(
                    data.invoiceProcessingStatus.getOrDefaultValue(''),
                  ),
                ),
              ],
            ),
            if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
              Text(
                '${context.tr('Gov. no')} ${data.documentReferenceID.displayDashIfEmpty}',
                key: WidgetKeys.governmentNumber,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      data.postingKeyName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Text(
                      data.documentDate.dateString,
                      key: WidgetKeys.invoiceCreditDocumentDate,
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            PriceComponent(
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              type: data.debitCreditCode.isCredit
                  ? PriceStyle.creditSummaryPrice
                  : PriceStyle.commonPrice,
              price: data.amountInTransactionCurrency.toString(),
            ),
            ExpandableSection(
              expandedTitle: 'Hide Debit/Credit Ref. Number(s)',
              collapseTitle: 'Show Debit/Credit Ref. Number(s)',
              haveDivider: true,
              child: Padding(
                key: WidgetKeys.summaryExpandableSectionDetails,
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  data.referenceId.referenceListString,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
