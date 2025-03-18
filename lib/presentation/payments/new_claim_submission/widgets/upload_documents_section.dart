part of 'package:ezrxmobile/presentation/payments/new_claim_submission/new_claim_submission_page.dart';

class _UploadDocumentsSection extends StatelessWidget {
  const _UploadDocumentsSection();

  @override
  Widget build(BuildContext context) {
    final maximumUploadSize = locator<Config>().maximumUploadSize;

    return BlocBuilder<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      buildWhen: (previous, current) =>
          previous.showUploadExeedMessage != current.showUploadExeedMessage ||
          previous.claimSubmission.claimType !=
              current.claimSubmission.claimType ||
          previous.isLoading ||
          current.isLoading,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: context.tr('Upload documents'),
                style: Theme.of(context).textTheme.labelSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: ZPColors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                key: WidgetKeys.newClaimDocumentUpload,
                onTap: state.isLoading
                    ? null
                    : () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          enableDrag: false,
                          isDismissible: false,
                          builder: (_) => SelectAttachmentBottomsheet(
                            onUploadOptionSelected: (option) =>
                                context.read<PoAttachmentBloc>().add(
                                      PoAttachmentEvent.pickFile(
                                        uploadOptionType: option,
                                        submitTicketFileExtension: false,
                                      ),
                                    ),
                          ),
                        );
                      },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: ZPColors.toggleOnDisableState,
                  dashPattern: const [8, 4],
                  strokeWidth: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ZPColors.paleBlueGray,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    width: double.infinity,
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: context.tr('Upload attachments'),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: ZPColors.textButtonColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' *',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: ZPColors.red),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: RichText(
                            text: TextSpan(
                              text: '${context.tr('Tap to')} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ZPColors.shadersGrey),
                              children: <TextSpan>[
                                TextSpan(
                                  text: context.tr('browse'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: ZPColors.skyBlueColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          context.tr(
                            'Allowed JPG, PNG & PDF Only',
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: ZPColors.neutralsGrey1),
                        ),
                        Text(
                          context.tr(
                            'Max file size {maximumUploadSize}MB',
                            namedArgs: {
                              'maximumUploadSize': maximumUploadSize.toString(),
                            },
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: ZPColors.neutralsGrey1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state.showUploadExeedMessage)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error,
                      size: 15,
                      color: ZPColors.priceNegative,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        context.tr(
                          'Exceed maximum file size of {maximumUploadSize}MB',
                          namedArgs: {
                            'maximumUploadSize': maximumUploadSize.toString(),
                          },
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ZPColors.priceNegative),
                      ),
                    ),
                  ],
                ),
              ),
            if (state.claimSubmission.claimType.isNotEmpty)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 84,
                      bottom: 8,
                      top: 16,
                    ),
                    child: Text(
                      '${context.tr(
                        'Expected support documents for selected claim type',
                      )}:',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  ...state.claimSubmission.claimType.documentTypes.map(
                    (e) => BulletWidget(
                      content: Text(
                        e.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
            BlocConsumer<PoAttachmentBloc, PoAttachmentState>(
              listenWhen: (previous, current) =>
                  previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption,
              listener: (context, state) {
                state.failureOrSuccessOption.fold(
                  () => {},
                  (either) => either.fold(
                    (failure) {
                      if (failure ==
                          const ApiFailure.cameraPermissionFailed(true)) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          enableDrag: false,
                          isDismissible: true,
                          builder: (_) => const OpenSettingBottomSheet(),
                        );
                      } else {
                        ErrorUtils.handleApiFailure(context, failure);
                      }
                    },
                    (success) {
                      context.read<NewClaimSubmissionBloc>().add(
                            NewClaimSubmissionEvent.addPoDocument(
                              poDocuments: state.localFiles,
                            ),
                          );
                    },
                  ),
                );
              },
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching ||
                  previous.fileUrl != current.fileUrl,
              builder: (context, _) {
                return UploadedDocumentsSection.claim(
                  context: context,
                  onDeleteLocalFile: state.isLoading
                      ? null
                      : (file) {
                          context.read<NewClaimSubmissionBloc>().add(
                                NewClaimSubmissionEvent.removePoDocument(
                                  poDocument: file,
                                ),
                              );
                        },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
