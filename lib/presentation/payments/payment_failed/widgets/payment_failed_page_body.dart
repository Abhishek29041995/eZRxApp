part of 'package:ezrxmobile/presentation/payments/payment_failed/payment_failed_page.dart';

class _PaymentFailedPageBody extends StatelessWidget {
  const _PaymentFailedPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SvgPicture.asset(
              SvgImage.alert,
              fit: BoxFit.fitHeight,
              height: 80,
            ),
          ),
          Text(
            context.tr(
              'Unfortunately there was an error from payment gateway while processing your payment.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            context.tr(
              'Please delete the payment advice and generate a new payment advice.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            context.tr(
              'Alternatively, you may visit the payment summary page to try again.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
        ],
      ),
    );
  }
}
