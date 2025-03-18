part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceFooterSection extends StatelessWidget {
  const _PaymentAdviceFooterSection();

  @override
  Widget build(BuildContext context) {
    final state = context.read<NewPaymentBloc>().state;
    final isID = state.salesOrganisation.salesOrg.isID;
    if (isID) return const _PaymentCancelAdviceButton();

    return state.needOpenWebViewAndNotBankIn
        ? const _PaymentSummarySection()
        : const _PaymentAdviceButtons();
  }
}
