part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _QRCodeTransferSection extends StatelessWidget {
  const _QRCodeTransferSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          context.tr(
            'For QR Code payment',
          ),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          context.tr(
            '1. Log in to Banking App',
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          context.tr(
            '2. Scan below & Pay',
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          context.tr(
            'For Bank Transfer or UEN Payment',
          ),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 8),
        Text(
          context.tr(
            '1. Log in to Banking App or Online banking',
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          context.tr(
            '2. Select Bank Account Transfer or UEN payment',
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
