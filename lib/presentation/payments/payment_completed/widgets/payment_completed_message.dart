part of 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart';

class _PaymentCompletedMessage extends StatelessWidget {
  const _PaymentCompletedMessage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SvgPicture.asset(
              SvgImage.orderCreated,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            context.isMPPayment
                ? '${context.tr('Thank you')} ${context.read<EligibilityBloc>().state.user.fullName.toTitleCase}! ${context.tr(
                    'Our payment processor is coordinating with the bank to process your Marketplace payment request.',
                  )}'
                : '${context.tr('Our payment processor is coordinating with the bank to process your payment request for payment advice ')} #${context.read<NewPaymentBloc>().state.paymentInvoiceInfoPdf.zzAdvice}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('We’ll send a payment advice copy to')} ${context.read<EligibilityBloc>().state.user.email.maskedValue} ${context.tr('shortly')}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(height: 24.0),
          const Divider(
            indent: 0,
            thickness: 1,
            endIndent: 0,
            height: 1,
            color: ZPColors.extraLightGrey3,
          ),
        ],
      ),
    );
  }
}
