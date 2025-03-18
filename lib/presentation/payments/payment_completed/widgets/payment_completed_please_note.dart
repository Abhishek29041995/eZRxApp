part of 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart';

class _PaymentCompletedPleaseNote extends StatelessWidget {
  const _PaymentCompletedPleaseNote();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                text: context.tr(
                  'There may be situations where payments fail during the payment process, or it may take longer time. Please make sure to check the payment status of your payment request.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 4),
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
                    text: context.tr(
                      context.isMPPayment
                          ? 'MP Payment summary'
                          : 'Payment summary',
                    ),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.extraDarkGreen,
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
          const SizedBox(height: 4),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  context.isMPPayment
                      ? 'If payment request fails, you may choose to retry payment or delete the failed payment advice then generate a new payment advice.'
                      : 'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 4),
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
