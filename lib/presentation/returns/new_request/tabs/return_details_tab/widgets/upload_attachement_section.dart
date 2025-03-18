part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _UploadAttachmentSection extends StatelessWidget {
  const _UploadAttachmentSection({
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnRequestAttachmentBloc,
        ReturnRequestAttachmentState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching &&
          previous.fileOperationMode == FileOperationMode.upload &&
          current.returnUuid == data.uuid,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (success) {
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.toggleFiles(
                      included: true,
                      uuid: data.uuid,
                      files: state.uploadedFiles,
                    ),
                  );
              CustomSnackBar(
                messageText: context.tr('File uploaded successfully'),
              ).show(context);
            },
          ),
        );
      },
      child: Column(
        children: [
          _AttachmentUploadButton(data: data),
          _UploadedFileList(
            data: context
                .read<NewRequestBloc>()
                .state
                .getReturnItemDetails(data.uuid),
          ),
        ],
      ),
    );
  }
}

class _AttachmentUploadButton extends StatelessWidget {
  const _AttachmentUploadButton({
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        key: WidgetKeys.returnUploadAttachmentButton(data.uuid),
        onPressed: () {
          if (!context.read<ReturnRequestAttachmentBloc>().state.isFetching) {
            showPlatformDialog(
              context: context,
              barrierDismissible: true,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return _AttachmentUploadOptionPicker(
                  uuid: data.uuid,
                  assignmentNumber: data.assignmentNumber,
                );
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ZPColors.whiteBgCard,
        ),
        child: Text('Upload attachment'.tr()),
      ),
    );
  }
}

class _AttachmentUploadOptionPicker extends StatefulWidget {
  const _AttachmentUploadOptionPicker({
    required this.uuid,
    required this.assignmentNumber,
  });
  final String uuid;
  final String assignmentNumber;

  @override
  State<_AttachmentUploadOptionPicker> createState() =>
      _AttachmentUploadOptionPickerState();
}

class _AttachmentUploadOptionPickerState
    extends State<_AttachmentUploadOptionPicker> {
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      widgetKey: WidgetKeys.returnAttachmentUploadDialog,
      title: Text(
        'Upload Attachment'.tr(),
      ),
      content: Text(
        'Choose a photo or a file'.tr(),
      ),
      actions: [
        PlatformDialogAction(
          widgetKey: WidgetKeys.returnAttachmentPhotoUploadButton,
          child: Column(
            children: [
              const Icon(
                Icons.image,
                color: ZPColors.kPrimaryColor,
              ),
              Text('Photos'.tr()),
            ],
          ),
          onPressed: () => uploadFile(
            uploadOptionType: UploadOptionType.gallery,
            uuid: widget.uuid,
            assignmentNumber: widget.assignmentNumber,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(
              color: ZPColors.kPrimaryColor,
            ),
          ),
        ),
        PlatformDialogAction(
          widgetKey: WidgetKeys.returnAttachmentFileUploadButton,
          child: Column(
            children: [
              const Icon(
                Icons.folder,
                color: ZPColors.kPrimaryColor,
              ),
              Text('Files'.tr()),
            ],
          ),
          onPressed: () => uploadFile(
            uuid: widget.uuid,
            uploadOptionType: UploadOptionType.file,
            assignmentNumber: widget.assignmentNumber,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(color: ZPColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }

  void uploadFile({
    required UploadOptionType uploadOptionType,
    required String uuid,
    required String assignmentNumber,
  }) {
    context.read<ReturnRequestAttachmentBloc>().add(
          ReturnRequestAttachmentEvent.uploadFile(
            returnUuid: uuid,
            assignmentNumber: assignmentNumber,
            uploadOptionType: uploadOptionType,
            user: context.read<EligibilityBloc>().state.user,
          ),
        );
    context.router.maybePop();
  }
}

class _UploadedFileList extends StatelessWidget with BottomsheetMixin {
  const _UploadedFileList({
    required this.data,
  });

  final ReturnItemDetails data;

  @override
  Widget build(BuildContext context) {
    return data.uploadedFiles.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                '${'Attachments'.tr()}:',
              ),
              ...data.uploadedFiles.map(
                (file) => Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: ZPColors.extraLightGray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${file.name} - ${file.size.displayText}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkerGreen,
                                  ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () async {
                          final confirmed = await showConfirmBottomSheet(
                            context: context,
                          );
                          if ((confirmed ?? false) && context.mounted) {
                            context.read<ReturnRequestAttachmentBloc>().add(
                                  ReturnRequestAttachmentEvent.deleteFile(
                                    file: file,
                                  ),
                                );
                            context.read<NewRequestBloc>().add(
                                  NewRequestEvent.toggleFiles(
                                    files: [file],
                                    included: false,
                                    uuid: data.uuid,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
