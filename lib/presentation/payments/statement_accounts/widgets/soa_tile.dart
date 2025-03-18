part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _SoaTile extends StatelessWidget {
  final Soa soa;

  const _SoaTile({
    super.key,
    required this.soa,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      buildWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      builder: (context, state) {
        return CustomCard(
          key: WidgetKeys.soaSearchResultsKey,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 16),
              if (context.isMPPayment) ...[
                MarketPlaceLogo.small(),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  soa.soaData.simpleDateString,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(height: 1),
                  key: WidgetKeys.soaItemTextKey,
                ),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                key: WidgetKeys.genericKey(
                  key: 'soaDownloadButton#${soa.soaData.simpleDateString}',
                ),
                onPressed: state.isDownloadInProgress
                    ? null
                    : () {
                        trackMixpanelEvent(
                          TrackingEvents.paymentDocumentViewed,
                        );
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent.downloadSOA(
                                soaData: soa.soaData,
                              ),
                            );
                      },
                label: Text(
                  context.tr('Download'),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.extraDarkGreen),
                ),
                icon: state.isDownloadInProgress &&
                        SoaData(state.fileUrl.url) == soa.soaData
                    ? LoadingAnimationWidget.discreteCircle(
                        key: WidgetKeys.soaLoadingAnimationWidgetKey,
                        color: ZPColors.primary,
                        secondRingColor: ZPColors.secondary,
                        thirdRingColor: ZPColors.orange,
                        size: 18,
                      )
                    : const Icon(
                        Icons.cloud_download_outlined,
                        size: 20,
                        color: ZPColors.extraDarkGreen,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
