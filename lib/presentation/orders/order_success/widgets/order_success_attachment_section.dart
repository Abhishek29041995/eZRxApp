import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/core/entities/po_documents.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';

class OrderSuccessAttachmentSection extends StatelessWidget {
  const OrderSuccessAttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '${context.tr('Attachments')}:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
        Expanded(
          flex: 4,
          child: context
                  .read<OrderSummaryBloc>()
                  .state
                  .orderHistoryDetails
                  .poDocumentsAvailable
              ? const _AttachmentsWithIcon()
              : Text(
                  context.tr('NA'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
        ),
      ],
    );
  }
}

class _AttachmentsWithIcon extends StatelessWidget {
  const _AttachmentsWithIcon();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoAttachmentBloc, PoAttachmentState>(
      key: WidgetKeys.orderSuccessAttachment,
      listenWhen: (previous, current) =>
          previous != current && current.fileDownloading && !current.isFetching,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) => CustomSnackBar(
              messageText: context.tr('Attachments downloaded successfully.'),
            ).show(context),
          ),
        );
      },
      child: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
        buildWhen: (previous, current) =>
            previous.isExpanded != current.isExpanded,
        builder: (context, state) {
          return Column(
            children: [
              ...state.poDocumentsList
                  .map(
                    (e) => _AttachmentFile(document: e),
                  )
                  ,
              if (state.displayShowMoreOrLess)
                InkWell(
                  key: WidgetKeys.orderSuccessAttachmentShowButton,
                  onTap: () => context.read<OrderSummaryBloc>().add(
                        OrderSummaryEvent.updateIsExpanded(
                          isExpanded: !state.isExpanded,
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        state.isExpanded
                            ? context.tr('Show less')
                            : context.tr('Show more'),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: ZPColors.attachmentColor,
                            ),
                      ),
                      Icon(
                        state.isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: ZPColors.attachmentColor,
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _AttachmentFile extends StatelessWidget {
  final PoDocuments document;
  const _AttachmentFile({required this.document});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<PoAttachmentBloc>().add(
            PoAttachmentEvent.downloadFile(
              files: [document],
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                document.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.cloud_download_outlined,
                  color: ZPColors.attachmentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
