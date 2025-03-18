part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _InvoicesAndCreditsTotalSection extends StatelessWidget {
  const _InvoicesAndCreditsTotalSection({
    required this.visible,
    required this.paymentItems,
  });
  final List<PaymentItem> paymentItems;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return visible
        ? Column(
            children: [
              _PriceWidget(
                title: 'Invoice total:',
                price: paymentItems.invoiceTotal.toString(),
                type: PriceStyle.totalPrice,
              ),
              _PriceWidget(
                title: 'Credits applied:',
                type: PriceStyle.credits,
                price: paymentItems.creditTotal.toString(),
              ),
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
