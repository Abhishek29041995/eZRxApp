part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdvicePleaseNote extends StatelessWidget {
  const _PaymentAdvicePleaseNote();

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.paymentAdvicePleaseNote,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Please note'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text:
                    '${context.tr('You can check your payment status from the.')} "',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
                children: [
                  TextSpan(
                    text: context.tr('Payment summary'),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraLightGrey4,
                          fontWeight: FontWeight.bold,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.router.push(
                            PaymentSummaryPageRoute(
                              isMarketPlace: context.isMPPayment,
                            ),
                          ),
                  ),
                  TextSpan(
                    text: '" ${context.tr('page')}.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                  ),
                ],
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  context
                          .read<NewPaymentBloc>()
                          .state
                          .selectedPaymentMethod
                          .paymentMethod
                          .isBankIn
                      ? 'If payment request fails, you may choose to retry payment or delete the failed payment advice then generate a new payment advice.'
                      : 'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'Please note that system-generated payment advice(s) will be automatically deleted if payment is not received within 30 days.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.warningTextColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
