part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _Export extends StatelessWidget {
  final String currentActiveTabName;

  const _Export({
    super.key,
    required this.currentActiveTabName,
  });

  void _downloadAttachment(BuildContext context) {
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      context.read<DownloadPaymentAttachmentsBloc>().add(
            DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
              queryObject: context
                  .allInvoicesBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
              isMarketPlace: context.isMPPayment,
            ),
          );

      return;
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      context.read<DownloadPaymentAttachmentsBloc>().add(
            DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
              queryObject: context
                  .allCreditsBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
              isMarketPlace: context.isMPPayment,
            ),
          );

      return;
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      context.read<DownloadPaymentAttachmentsBloc>().add(
            DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
              queryObject: context
                  .fullSummaryBloc(context.isMPPayment)
                  .state
                  .appliedFilter,
              isMarketPlace: context.isMPPayment,
            ),
          );

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) => CustomSnackBar(
              messageText: context.tr('File downloaded successfully'),
            ).show(context),
          ),
        );
      },
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => _downloadAttachment(context),
        color: ZPColors.extraDarkGreen,
        icon: const Icon(
          Icons.cloud_download_outlined,
        ),
      ),
    );
  }
}
