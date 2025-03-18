part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentSummarySection extends StatelessWidget {
  const _PaymentSummarySection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return state.isLoading || state.details.paymentItems.isEmpty
            ? const SizedBox.shrink()
            : DetailsInfoSection(
                label: 'Payment summary',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _InvoicesAndCreditsTotalSection(
                      visible:
                          !context.read<EligibilityBloc>().state.salesOrg.isID,
                      paymentItems: state.details.paymentItems,
                    ),
                    _PriceWidget(
                      title: '${context.tr('Total')}:',
                      price: state.details.paymentAmount.toString(),
                      type: PriceStyle.grandTotalPrice,
                    ),
                    const Divider(
                      indent: 0,
                      height: 20,
                      endIndent: 0,
                      color: ZPColors.lightGray2,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
