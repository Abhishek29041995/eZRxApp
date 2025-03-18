part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _NoteAnnouncement extends StatelessWidget {
  const _NoteAnnouncement();

  @override
  Widget build(BuildContext context) {
    return ColorContainer(
      key: WidgetKeys.createPaymentAdviseNote,
      color: ZPColors.lightBlueColor,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      children: [
        Text(
          '${context.tr(
            'Please note that once the Payment Advice is generated, you can no longer add or remove invoices/credit notes',
          )}. ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ZPColors.infoTextBlueColor,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          context.tr(
            'Please review and confirm the information below before you proceed. If there are any errors, you’ll be required to delete and create a new Payment Advice.',
          ),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ZPColors.shadesBlack,
              ),
        ),
      ],
    );
  }
}
