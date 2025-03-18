part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentDetailsSection extends StatelessWidget {
  const _PaymentDetailsSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PaymentBasicInfoSection(),
            const _PaymentTransferViaSection(
              key: WidgetKeys.transferViaSection,
            ),
            LoadingShimmer.withChild(
              enabled: state.details.isEmpty || state.isLoading,
              child: AttentionSection(
                widgetKey: WidgetKeys.accountSummaryDetailsAttention,
                visible: eligibilityState.salesOrg.isID &&
                    !state.details.status.getIsSuccessfulOrProcessed,
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
              visible: eligibilityState.salesOrg.isID,
              details: state.details,
              isLoading: state.isDetailFetching,
            ),
            TransferMethodsSection(
              visible: eligibilityState.salesOrg.isID &&
                  !state.details.status.getIsSuccessfulOrProcessed,
              bankInstruction: state.bankInstruction,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 0,
              height: 20,
              endIndent: 0,
              color: ZPColors.lightGray2,
            ),
            DetailsInfoSection(
              label: 'Payment details',
              child: AddressInfoSection.noAction(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 0,
              height: 20,
              endIndent: 0,
              color: ZPColors.lightGray2,
            ),
          ],
        );
      },
    );
  }
}
