part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class TicketContentSection extends StatefulWidget {
  const TicketContentSection({super.key});

  @override
  State<TicketContentSection> createState() => _TicketContentSectionState();
}

class _TicketContentSectionState extends State<TicketContentSection> {
  final _descriptionController = TextEditingController();

  void _onTextFieldChanged(
    BuildContext context, {
    required SubmitTicketLabel label,
    required String value,
  }) {
    context.read<SubmitTicketBloc>().add(
          SubmitTicketEvent.onTextChange(
            label: label,
            newValue: value,
          ),
        );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ezcsTicket = context.read<SubmitTicketBloc>().state.ezcsTicket;

    return CustomCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(padding12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Content'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding12),
            child: TextFieldWithLabel(
              fieldKey: WidgetKeys.submitTicketSubjectTextField,
              initValue: ezcsTicket.subject,
              mandatory: true,
              labelText: context.tr('Subject'),
              labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ZPColors.neutralsGrey1,
                  ),
              onChanged: (value) => _onTextFieldChanged(
                context,
                label: SubmitTicketLabel.subject,
                value: value,
              ),
              isEnabled: true,
              maxLength: 255,
              decoration: InputDecoration(
                hintText: context.tr('Type your subject'),
                hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.lightGray,
                    ),
                counterText: '',
              ),
              onDone: (value) => _onTextFieldChanged(
                context,
                label: SubmitTicketLabel.subject,
                value: value,
              ),
            ),
          ),
          TextFieldWithLabel(
            fieldKey: WidgetKeys.submitTicketDescriptionTextField,
            mandatory: true,
            controller: _descriptionController,
            labelText: context.tr('Description'),
            maxLength: 1300,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ZPColors.neutralsGrey1,
                ),
            onChanged: (value) => _onTextFieldChanged(
              context,
              label: SubmitTicketLabel.description,
              value: value,
            ),
            isEnabled: true,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: context.tr('Describe your ticket'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.lightGray,
                  ),
            ),
            onDone: (value) => _onTextFieldChanged(
              context,
              label: SubmitTicketLabel.description,
              value: value,
            ),
          ),
          const SizedBox(height: padding12),
          BlocConsumer<SubmitTicketBloc, SubmitTicketState>(
            listenWhen: (previous, current) =>
                previous.ezcsTicket.description !=
                current.ezcsTicket.description,
            listener: (context, state) {
              _descriptionController.text = state.ezcsTicket.description;
            },
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              return BlocConsumer<PoAttachmentBloc, PoAttachmentState>(
                listenWhen: (previous, current) =>
                    previous.fileUrl != current.fileUrl,
                listener: (context, state) =>
                    context.read<PoAttachmentBloc>().add(
                          PoAttachmentEvent.uploadFile(
                            user: context.read<EligibilityBloc>().state.user,
                          ),
                        ),
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, poAttachmentState) {
                  return OutlinedButton(
                    key: WidgetKeys.uploadAttachmentKey,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.maxFinite, 45),
                    ),
                    onPressed: () {
                      if (poAttachmentState.isFetching || state.isLoading) {
                        return;
                      }
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
                                      submitTicketFileExtension: true,
                                    ),
                                  ),
                        ),
                      );
                    },
                    child: LoadingShimmer.withChild(
                      enabled: poAttachmentState.isFetching || state.isLoading,
                      child: Text(
                        context.tr('Upload Document'),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  );
                },
              );
            },
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
                  (_) {
                    context.read<SubmitTicketBloc>().add(
                          SubmitTicketEvent.addPoDocument(
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
            builder: (context, state) {
              return BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
                buildWhen: (previous, current) =>
                    previous.showUploadExeedMessage !=
                    current.showUploadExeedMessage,
                builder: (context, state) {
                  return UploadedDocumentsSection.submitTicket(
                    context: context,
                    showErrorMessage: state.showUploadExeedMessage,
                    onDeleteLocalFile: (PlatformFile file) {
                      context.read<SubmitTicketBloc>().add(
                            SubmitTicketEvent.removePoDocument(
                              poDocument: file,
                            ),
                          );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
