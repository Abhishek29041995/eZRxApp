part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceBodySection extends StatelessWidget {
  const _PaymentAdviceBodySection();

  @override
  Widget build(BuildContext context) {
    final newPaymentState = context.read<NewPaymentBloc>().state;
    final isID = newPaymentState.salesOrganisation.salesOrg.isID;
    if (isID) return const _PaymentAdviceBodyAPLSection();

    return ListView(
      children: [
        const SizedBox(
          height: 8,
        ),
        newPaymentState.selectedPaymentMethod.paymentMethod.isBankIn
            ? const _PaymentBankInAdviceMessage()
            : const _PaymentGatewayAdviceMessage(),
        newPaymentState.needOpenWebViewAndNotBankIn
            ? const _PaymentAdviceNextStep()
            : const _PaymentAdvicePleaseNote(),
        const _PaymentAdviceDocument(),
      ],
    );
  }
}
