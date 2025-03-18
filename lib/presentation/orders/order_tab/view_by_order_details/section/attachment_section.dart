import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttachmentSection extends StatelessWidget {
  const AttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (!state.orderHistoryDetails.poDocumentsAvailable) {
          return BalanceTextRow(
            keyFlex: 8,
            valueFlex: 7,
            keyText: context.tr('Attachments'),
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueText: 'NA',
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Text(
                '${context.tr('Attachments')}:',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ),
            const Expanded(
              flex: 7,
              child: _AttachmentsWithIcon(),
            ),
          ],
        );
      },
    );
  }
}

class _AttachmentWidget extends StatelessWidget {
  final PoDocuments poDocuments;

  const _AttachmentWidget({
    required this.poDocuments,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      poDocuments.name,
      key: WidgetKeys.poAttachmentTile,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: ZPColors.white,
          ),
    );
  }
}

class _AttachmentsWithIcon extends StatelessWidget {
  const _AttachmentsWithIcon();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoAttachmentBloc, PoAttachmentState>(
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
      child: BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        buildWhen: (previous, current) =>
            previous.isExpanded != current.isExpanded,
        builder: (context, state) {
          return state
                  .orderHistoryDetails.orderHistoryDetailsPoDocuments.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.totalItemCount,
                  itemBuilder: (context, index) {
                    return (index < state.displayedPoDocumentCount)
                        ? InkWell(
                            onTap: () => context.read<PoAttachmentBloc>().add(
                                  PoAttachmentEvent.downloadFile(
                                    files: [
                                      state.orderHistoryDetails
                                              .orderHistoryDetailsPoDocuments[
                                          index],
                                    ],
                                  ),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: _AttachmentWidget(
                                      poDocuments: state.orderHistoryDetails
                                              .orderHistoryDetailsPoDocuments[
                                          index],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: SvgPicture.asset(
                                      SvgImage.downloadIcon,
                                      
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              context.read<ViewByOrderDetailsBloc>().add(
                                    const ViewByOrderDetailsEvent
                                        .expandAttachments(),
                                  );
                            },
                            child: Row(
                              children: [
                                Text(
                                  state.isExpanded
                                      ? context.tr('Show less')
                                      : context.tr('Show more'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
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
                          );
                  },
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
