part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    required this.title,
    required this.price,
    this.type = PriceStyle.commonPrice,
  });
  final String title;
  final String price;
  final PriceStyle type;
  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.paymentSummaryTitle(title),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.tr(title),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        PriceComponent(
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: price,
          type: type,
        ),
      ],
    );
  }
}
