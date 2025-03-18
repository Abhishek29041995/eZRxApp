part of 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    required this.creditItem,
  });

  final CreditAndInvoiceItem creditItem;

  @override
  Widget build(BuildContext context) {
    final isIDMarket = context.read<EligibilityBloc>().state.salesOrg.isID;

    return CustomCard(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        key: WidgetKeys.creditsItemTile,
        onTap: !isIDMarket ? () => _onItemClick(context) : null,
        child: Column(
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
                    '${context.tr('Account credit')} #${creditItem.searchKey.displayNAIfEmpty}',
                    key: WidgetKeys.creditItemId(
                      creditItem.searchKey.getOrDefaultValue(''),
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                if (!isIDMarket)
                  StatusLabel(
                    key: WidgetKeys.creditStatusTag,
                    status: StatusType(
                      creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
                    ),
                  ),
              ],
            ),
            if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
              Text(
                '${context.tr('Gov. no')} ${creditItem.documentReferenceID.displayDashIfEmpty}',
                key: WidgetKeys.governmentNumber,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                creditItem.accountingDocumentType,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: creditItem.convertIfAmountInTransactionCurrencyIsNegative
                  .toString(),
              priceLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemClick(BuildContext context) {
    trackMixpanelEvent(TrackingEvents.paymentDocumentViewed);
    context.read<CreditAndInvoiceDetailsBloc>().add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItem,
            isMarketPlace: context.isMPPayment,
          ),
        );
    context.read<DownloadECreditBloc>().add(
          DownloadECreditEvent.fetchECreditDownloadUrl(
            eCredit: creditItem.searchKey.getOrDefaultValue(''),
          ),
        );
    context.router
        .push(CreditDetailsPageRoute(isMarketPlace: context.isMPPayment));
  }
}
