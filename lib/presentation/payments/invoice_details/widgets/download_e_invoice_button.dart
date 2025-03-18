part of 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';

class _DownloadEInvoiceButton extends StatelessWidget {
  final String invoiceNumber;

  const _DownloadEInvoiceButton({
    required this.invoiceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadEInvoiceBloc>(
      create: (context) => locator<DownloadEInvoiceBloc>()
        ..add(
          DownloadEInvoiceEvent.fetchUrl(
            invoiceNumber: invoiceNumber,
            salesOrg: context.read<EligibilityBloc>().state.salesOrg,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
          ),
        ),
      child: BlocConsumer<DownloadEInvoiceBloc, DownloadEInvoiceState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) => state.failureOrSuccessOption.fold(
          () => {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) => CustomSnackBar(
              messageText: context.tr('File downloaded successfully'),
            ).show(context),
          ),
        ),
        buildWhen: (previous, current) =>
            previous.isDownloading != current.isDownloading ||
            previous.eInvoiceUrl != current.eInvoiceUrl,
        builder: (context, state) {
          if (state.eInvoiceUrl.url.isEmpty) return const SizedBox();

          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ZPColors.boxShadowGray,
                    blurRadius: 2.0,
                    offset: Offset(0.1, -2.75),
                  ),
                ],
                color: ZPColors.white,
              ),
              child: OutlinedButton(
                key: WidgetKeys.downloadEInvoiceButton,
                onPressed: state.isDownloading
                    ? null
                    : () {
                        state.isDownloadSuccess
                            ? context
                                .read<DownloadEInvoiceBloc>()
                                .add(const DownloadEInvoiceEvent.openFile())
                            : context
                                .read<DownloadEInvoiceBloc>()
                                .add(const DownloadEInvoiceEvent.download());
                      },
                child: state.isDownloading
                    ? const _DownloadingText()
                    : Text(
                        context.tr(
                          state.isDownloadSuccess
                              ? 'Open e-invoice'
                              : 'Download e-invoice',
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DownloadingText extends StatelessWidget {
  const _DownloadingText();

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer.withChild(
      center: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.sync, size: 24),
          const SizedBox(width: 6),
          Text('${context.tr('Downloading')}...'),
        ],
      ),
    );
  }
}
