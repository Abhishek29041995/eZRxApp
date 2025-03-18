part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _WarningAnnouncement extends StatelessWidget {
  const _WarningAnnouncement();

  @override
  Widget build(BuildContext context) {
    return const ColorContainer(
      key: WidgetKeys.createPaymentAdviseWarning,
      color: ZPColors.priceWarning,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      children: [
        RichTextSpan(
          text:
              'You are advised to generate the Payment Advice Notice (PAN) only when you intend to make payment within [b]15 calendar days.[b] Unused PANs will be [b]automatically deleted after 30 days.[b] You may create a new PAN thereafter.',
        ),
      ],
    );
  }
}
