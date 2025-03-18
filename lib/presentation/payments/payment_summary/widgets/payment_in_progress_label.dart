part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentInProgressLabel extends StatelessWidget {
  const _PaymentInProgressLabel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentInProgressBloc, PaymentInProgressState>(
      bloc: context.paymentInProgressBloc(context.isMPPayment),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: ZPColors.lightBorderYellow,
          ),
          child: PriceComponent(
            price: state.amount.getOrDefaultValue('0'),
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            title: '${context.tr('In-progress:')} ',
            priceLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.primary,
                ),
            type: PriceStyle.paymentInProgressPrice,
          ),
        );
      },
    );
  }
}
