part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentCancelAdviceButton extends StatelessWidget {
  const _PaymentCancelAdviceButton();

  void _showCancelAdviceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => DeleteCancelAdviceBottomSheet.cancel(
        isMarketPlace: context.isMPPayment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      key: WidgetKeys.paymentCancelAdviceButton,
      listenWhen: (previous, current) =>
          previous.isCancelingAdvice != current.isCancelingAdvice,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            Navigator.pop(context);
            CustomSnackBar(
              messageText: context.tr('Payment cancel successfully'),
            ).show(context);
          },
          (option) => option.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (r) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isCancelingAdvice != current.isCancelingAdvice ||
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ZPColors.lightGray2,
                ),
              ),
              color: ZPColors.whiteBgCard,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OutlinedButton(
                key: WidgetKeys.deleteAdviceButtonKey,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: ZPColors.red,
                  ),
                ),
                onPressed: state.isCancelingAdvice
                    ? null
                    : () => _showCancelAdviceBottomSheet(context),
                child: LoadingShimmer.withChild(
                  enabled: state.isCancelingAdvice,
                  child: Text(
                    context.tr('Cancel advice'),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: ZPColors.red),
                  ).tr(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
