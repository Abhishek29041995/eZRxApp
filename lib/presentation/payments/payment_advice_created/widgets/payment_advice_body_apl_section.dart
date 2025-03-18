part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceBodyAPLSection extends StatelessWidget {
  const _PaymentAdviceBodyAPLSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      key: WidgetKeys.paymentAdviceBodyAPLSection,
      buildWhen: (previous, current) =>
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                SvgImage.checkCircle,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ).copyWith(bottom: 0),
              child: Text(
                '${context.tr('Your payment advice')} #${state.details.zzAdvice.displayNAIfEmpty} ${context.tr('has been generated')}.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.darkerGrey,
                    ),
              ),
            ),
            LoadingShimmer.withChild(
              enabled: state.details.isEmpty,
              child: AttentionSection(
                widgetKey: WidgetKeys.accountSummaryDetailsAttention,
                visible: !state.details.status.getIsSuccessfulOrProcessed,
                createdTime: state.details.createdDate,
                onCountdownComplete: () {
                  context.read<PaymentSummaryDetailsBloc>().add(
                        PaymentSummaryDetailsEvent
                            .fetchPaymentSummaryDetailsInfo(
                          details: state.details,
                          isMarketPlace: context.isMPPayment,
                        ),
                      );
                },
              ),
            ),
            BankAccountSection(
              widgetKey: WidgetKeys.accountSummaryBankAccountSection,
              visible: true,
              details: state.details,
              isLoading: state.isDetailFetching,
            ),
            TransferMethodsSection(
              visible: !state.details.status.getIsSuccessfulOrProcessed,
              bankInstruction: state.bankInstruction,
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
