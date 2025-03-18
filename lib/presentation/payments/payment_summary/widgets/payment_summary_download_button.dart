part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryDownloadButton extends StatelessWidget {
  const _PaymentSummaryDownloadButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      buildWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              CustomSnackBar(
                key: WidgetKeys.paymentSummaryDownloadSuccess,
                messageText: context.tr('File downloaded successfully'),
              ).show(context);
            },
          ),
        );
      },
      builder: (context, state) => state.isDownloadInProgress
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingAnimationWidget.discreteCircle(
                key: WidgetKeys.paymentSummaryDownloadInProgress,
                color: ZPColors.primary,
                secondRingColor: ZPColors.secondary,
                thirdRingColor: ZPColors.orange,
                size: 20,
              ),
            )
          : IconButton(
              key: WidgetKeys.paymentSummaryDownloadButton,
              onPressed: () =>
                  context.read<DownloadPaymentAttachmentsBloc>().add(
                        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
                          paymentSummaryFilter: context
                              .paymentSummaryBloc(context.isMPPayment)
                              .state
                              .appliedFilter,
                          isMarketPlace: context.isMPPayment,
                        ),
                      ),
              icon: const Icon(Icons.cloud_download_outlined),
            ),
    );
  }
}
