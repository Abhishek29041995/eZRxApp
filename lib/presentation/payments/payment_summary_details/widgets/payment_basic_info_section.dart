part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentBasicInfoSection extends StatelessWidget {
  const _PaymentBasicInfoSection();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;
        final paymentDate = state.details.displayPaymentDate
            ? DateFormat(
                DateTimeFormatString.displayDateFormat,
                context.locale.languageCode,
              ).format(state.details.paymentDate.dateTime)
            : 'NA';
        final paCreatedDate = state.details.createdDate.isValid()
            ? DateFormat(
                DateTimeFormatString.displayDateFormat,
                context.locale.languageCode,
              ).format(state.details.createdDate.dateTime)
            : 'NA';

        return Container(
          key: WidgetKeys.paymentSummaryDetails,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          color: ZPColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (context.isMPPayment)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: ZPColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const MarketPlaceRectangleLogo(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.isDetailFetching
                      ? SizedBox(width: 150, child: LoadingShimmer.tile())
                      : Text(
                          '${eligibilityState.salesOrg.paymentIdPretext} #${state.details.zzAdvice.getValue()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ZPColors.white),
                        ),
                  LoadingShimmer.withChild(
                    enabled: state.isDetailFetching,
                    child: StatusLabel(
                      status: StatusType(
                        state.details.status.displayStatusText,
                      ),
                    ),
                  ),
                ],
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Payment method'),
                valueTextLoading: state.isDetailFetching,
                valueText: context
                    .tr(state.details.paymentMethod.getOrDefaultValue('')),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('PA created date'),
                valueTextLoading: state.isDetailFetching,
                valueText: paCreatedDate,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Advice expiry'),
                valueTextLoading: state.isDetailFetching,
                valueText: context.tr(
                  state.adviceExpiryText.message,
                  namedArgs: state.adviceExpiryText.arguments,
                ),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: state
                          .details.status.getAdviceExpiryTextColorForFailed,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Payment date'),
                valueTextLoading: state.isDetailFetching,
                valueText: paymentDate,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
