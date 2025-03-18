part of 'package:ezrxmobile/presentation/payments/payment_failed/payment_failed_page.dart';

class _PaymentFailedPageFooter extends StatelessWidget {
  const _PaymentFailedPageFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ZPColors.boxShadowGray,
            blurRadius: 2.0,
            offset: Offset(0.1, -2.75),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 40,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      child: SafeArea(
        top: false,
        child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
          buildWhen: (previous, current) =>
              previous.isUpdatePaymentGateway != current.isUpdatePaymentGateway,
          builder: (context, state) {
            final isLoading = state.isUpdatePaymentGateway;

            return ElevatedButton(
              key: WidgetKeys.paymentSummaryRouteButton,
              onPressed: isLoading
                  ? null
                  : () => context.router.push(
                        PaymentSummaryPageRoute(
                          isMarketPlace: context.isMPPayment,
                        ),
                      ),
              child: LoadingShimmer.withChild(
                enabled: isLoading,
                center: false,
                child: Text(
                  context.tr(
                    context.isMPPayment
                        ? 'MP Payment summary'
                        : 'Payment summary',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
