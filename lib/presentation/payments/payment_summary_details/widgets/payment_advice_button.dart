part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentAdviceButton extends StatelessWidget {
  const _PaymentAdviceButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.isSavingAdvice != current.isSavingAdvice ||
          previous.isCancelingAdvice != current.isCancelingAdvice,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            final eligibilityState = context.read<EligibilityBloc>().state;
            if (!state.isSavingAdvice && !eligibilityState.salesOrg.isID) {
              CustomSnackBar(
                messageText: context.tr('Payment advice has been downloaded.'),
              ).show(context);
            }
            if (!state.isCancelingAdvice && eligibilityState.salesOrg.isID) {
              CustomSnackBar(
                messageText: context.tr('Payment cancel successfully'),
              ).show(context);
              context.read<PaymentSummaryDetailsBloc>().add(
                    PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                      details: state.details,
                      isMarketPlace: context.isMPPayment,
                    ),
                  );
              context.paymentSummaryBloc(context.isMPPayment).add(
                    PaymentSummaryEvent.fetch(
                      appliedFilter: PaymentSummaryFilter.defaultFilter(),
                    ),
                  );
            }
          },
          (option) => option.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (r) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching ||
          previous.isSavingAdvice != current.isSavingAdvice ||
          previous.isFetchingAdvice != current.isFetchingAdvice ||
          previous.isDeletingPayment != current.isDeletingPayment ||
          previous.isCancelingAdvice != current.isCancelingAdvice ||
          previous.savedAdvice != current.savedAdvice,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;
        var buttons = _getDefaultButtons(state);
        if (eligibilityState.salesOrg.isID) {
          buttons = _getIDButtons(state);
        }

        return buttons.isEmpty
            ? const SizedBox.shrink()
            : Container(
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
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 16,
                  bottom: 30,
                ),
                child: state.isButtonLoading
                    ? SizedBox(
                        key: WidgetKeys.paymentAdviceButtonLoading,
                        height: 20,
                        child: LoadingShimmer.tile(),
                      )
                    : Row(
                        key: WidgetKeys.buttonRowKey,
                        children: buttons,
                      ),
              );
      },
    );
  }

  List<Widget> _getIDButtons(PaymentSummaryDetailsState state) => [
        if (!state.details.status.getIsSuccessfulOrProcessed)
          _CancelAdviceButton(state: state),
      ];

  List<Widget> _getDefaultButtons(
    PaymentSummaryDetailsState state,
  ) =>
      [
        if (state.showDeleteAdviceButton) _DeleteAdviceButton(state: state),
        if (state.showDeleteAdviceButton)
          const SizedBox(
            width: 16,
          ),
        _DownloadAdviceButton(state: state),
      ];
}

class _DeleteAdviceButton extends StatelessWidget {
  const _DeleteAdviceButton({required this.state});

  final PaymentSummaryDetailsState state;

  void _showDeleteAdviceBottomSheet(
    BuildContext context, {
    required String paymentAdviceNumber,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => DeleteCancelAdviceBottomSheet.delete(
        paymentAdviceNumber: paymentAdviceNumber,
        isInProgress: state.details.status.getIsInProgress,
        isMarketPlace: context.isMPPayment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.deleteAdviceButtonKey,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: ZPColors.red,
          ),
        ),
        child: FittedBox(
          child: LoadingShimmer.withChild(
            enabled: state.isDeletingPayment,
            child: Text(
              context.tr('Delete advice'),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
          if (state.isDeletingPayment) return;
          _showDeleteAdviceBottomSheet(
            context,
            paymentAdviceNumber: state.details.zzAdvice.displayDashIfEmpty,
          );
        },
      ),
    );
  }
}

class _DownloadAdviceButton extends StatelessWidget {
  const _DownloadAdviceButton({required this.state});

  final PaymentSummaryDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.downloadAdviceButtonKey,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: ZPColors.primary,
          ),
        ),
        child: FittedBox(
          child: LoadingShimmer.withChild(
            enabled: state.isSavingAdvice,
            child: Text(
              state.isSavedAdviceEmpty
                  ? context.tr('Download advice')
                  : context.tr('Open advice'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.primary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () => state.isSavedAdviceEmpty
            ? context.read<PaymentSummaryDetailsBloc>().add(
                  const PaymentSummaryDetailsEvent.saveAdvice(),
                )
            : context.read<PaymentSummaryDetailsBloc>().add(
                  const PaymentSummaryDetailsEvent.viewSavedAdvice(),
                ),
      ),
    );
  }
}

class _CancelAdviceButton extends StatelessWidget {
  const _CancelAdviceButton({
    required this.state,
  });

  final PaymentSummaryDetailsState state;

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
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.cancelAdviceButtonKey,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: ZPColors.red,
          ),
        ),
        child: SizedBox(
          height: 20,
          child: LoadingShimmer.withChild(
            enabled: state.isCancelingAdvice,
            child: Text(
              context.tr('Cancel advice'),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
          if (state.isCancelingAdvice) return;
          _showCancelAdviceBottomSheet(context);
        },
      ),
    );
  }
}
