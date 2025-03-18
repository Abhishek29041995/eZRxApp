part of 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart';

class _DownloadECreditButton extends StatelessWidget {
  const _DownloadECreditButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadECreditBloc, DownloadECreditState>(
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
          previous.fileUrl != current.fileUrl ||
          previous.isDownloading != current.isDownloading,
      builder: (context, state) {
        return state.fileUrl.url.isNotEmpty
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: OutlinedButton(
                    key: WidgetKeys.downloadECreditButton,
                    onPressed: state.isDownloading
                        ? null
                        : () => context.read<DownloadECreditBloc>().add(
                              const DownloadECreditEvent.downloadECredit(),
                            ),
                    child: state.isDownloading
                        ? LoadingAnimationWidget.discreteCircle(
                            key: WidgetKeys
                                .downloadECreditLoadingAnimationWidget,
                            color: ZPColors.primary,
                            secondRingColor: ZPColors.secondary,
                            thirdRingColor: ZPColors.orange,
                            size: 18,
                          )
                        : Text(
                            context.tr('Download e-credit'),
                          ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
