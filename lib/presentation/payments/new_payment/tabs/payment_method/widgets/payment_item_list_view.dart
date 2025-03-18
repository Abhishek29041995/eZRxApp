part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _PaymentItemListView extends StatelessWidget {
  const _PaymentItemListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.selectedInvoices != current.selectedInvoices ||
          previous.selectedCredits != current.selectedCredits,
      builder: (context, state) {
        return Column(
          key: WidgetKeys.invoiceCreditListView,
          children: [
            ...state.allSelectedItems.map(
              (e) => _InvoiceCreditItemTile(customerOpenItem: e),
            ),
          ],
        );
      },
    );
  }
}

class _InvoiceCreditItemTile extends StatelessWidget {
  final CustomerOpenItem customerOpenItem;

  const _InvoiceCreditItemTile({
    required this.customerOpenItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.invoiceCreditItemTile,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${customerOpenItem.postingKeyName} #${customerOpenItem.accountingDocument}',
            key: WidgetKeys.invoiceCreditItemId,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '${context.tr('Gov. no')} ${customerOpenItem.documentReferenceID.displayDashIfEmpty}',
                key: WidgetKeys.governmentNumber,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  customerOpenItem.netDueDate.dateString,
                  key: WidgetKeys.invoiceCreditItemDate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
                PriceComponent(
                  key: WidgetKeys.invoiceCreditItemAmount,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price:
                      customerOpenItem.openAmountInTransCrcy.abs().toString(),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            endIndent: 0,
            indent: 0,
            color: ZPColors.extraLightGrey3,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
