part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentTransferViaSection extends StatelessWidget {
  const _PaymentTransferViaSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final paymentSummaryDetailState =
        context.read<PaymentSummaryDetailsBloc>().state;

    return paymentSummaryDetailState.details.paymentMethod.isBankIn ||
            paymentSummaryDetailState.details.paymentMethod.isQrCode
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Text(
                  context.tr(
                    'Transfer via {paymentMethod}',
                    namedArgs: {
                      'paymentMethod': paymentSummaryDetailState
                          .details.paymentMethod
                          .getOrDefaultValue(''),
                    },
                  ),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              if (paymentSummaryDetailState.details.paymentMethod.isBankIn)
                BlocBuilder<PaymentSummaryDetailsBloc,
                    PaymentSummaryDetailsState>(
                  buildWhen: (previous, current) =>
                      previous.isFetchingAdvice != current.isFetchingAdvice &&
                      !current.isFetchingAdvice,
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: BankInfo(
                        key: WidgetKeys.bankInAccountInfo,
                        bankInAccounts:
                            state.paymentInvoiceInfoPdf.bankBeneficiary,
                      ),
                    );
                  },
                ),
              if (paymentSummaryDetailState.details.paymentMethod.isQrCode)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: _QRCodeTransferSection(
                    key: WidgetKeys.qrCodeTransferSection,
                  ),
                ),
            ],
          )
        : const SizedBox.shrink();
  }
}
