import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadedFileList extends StatelessWidget {
  const UploadedFileList({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).uploadedFiles !=
          current.getReturnItemDetails(uuid).uploadedFiles,
      builder: (context, state) {
        final uploadedFiles = state.getReturnItemDetails(uuid).uploadedFiles;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Attachments'.tr(),
              keyTextStyle: Theme.of(context).textTheme.titleSmall,
              keyFlex: 2,
              valueFlex: 3,
              valueText: uploadedFiles.isEmpty ? 'N/A' : '',
            ),
            ...uploadedFiles
                .map(
                  (file) => BlocListener<ReturnRequestAttachmentBloc,
                      ReturnRequestAttachmentState>(
                    listenWhen: (previous, current) =>
                        previous != current && !current.isFetching,
                    listener: (context, state) =>
                        state.failureOrSuccessOption.fold(
                      () {},
                      (either) => either.fold(
                        (failure) =>
                            ErrorUtils.handleApiFailure(context, failure),
                        (success) => CustomSnackBar(
                          messageText: context
                              .tr('Attachments downloaded successfully.'),
                        ).show(context),
                      ),
                    ),
                    child: Container(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.darkerGreen,
                                  ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.cloud_download_outlined),
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              context.read<ReturnRequestAttachmentBloc>().add(
                                    ReturnRequestAttachmentEvent.downloadFile(
                                      file: file,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                ,
          ],
        );
      },
    );
  }
}
