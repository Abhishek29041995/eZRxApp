part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceButtons extends StatelessWidget {
  const _PaymentAdviceButtons();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf !=
              current.isFetchingInvoiceInfoPdf &&
          !current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        final isQRPayment = state.selectedPaymentMethod.paymentMethod.isQrCode;
        if (state.paymentInvoiceInfoPdf == PaymentInvoiceInfoPdf.empty()) {
          return const SizedBox.shrink();
        }

        return Container(
          key: WidgetKeys.paymentAdviceButton,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: ZPColors.boxShadowGray,
              ),
            ],
            color: ZPColors.white,
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Row(
            key: WidgetKeys.buttonRowKey,
            children: [
              if (!isQRPayment) ...[
                Expanded(
                  key: WidgetKeys.paymentSummaryButton,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: ZPColors.primary,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                    ),
                    child: Text(
                      context.tr('Payment summary'),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.primary,
                          ),
                    ),
                    onPressed: () {
                      context.router.popAndPush(
                        PaymentSummaryPageRoute(
                          isMarketPlace: context.isMPPayment,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              Expanded(
                child: PaymentSavePdfButton(
                  text: isQRPayment
                      ? 'Download payment advice'
                      : 'Download advice',
                  key: WidgetKeys.downloadAdviceButton,
                  backgroundColor: isQRPayment ? null : ZPColors.primary,
                  textStyle: isQRPayment
                      ? null
                      : Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
