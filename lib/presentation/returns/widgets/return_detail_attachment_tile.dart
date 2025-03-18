import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReturnDetailAttachmentTile extends StatelessWidget {
  const ReturnDetailAttachmentTile({
    super.key,
    required this.attachment,
    required this.isDownloading,
    required this.tapDownload,
  });

  final PoDocuments attachment;
  final bool isDownloading;
  final VoidCallback tapDownload;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.returnAttachmentTile,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ZPColors.lightSilver,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              attachment.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          isDownloading
              ? LoadingAnimationWidget.discreteCircle(
                  key: WidgetKeys.loadMoreLoader,
                  color: ZPColors.primary,
                  secondRingColor: ZPColors.secondary,
                  thirdRingColor: ZPColors.orange,
                  size: 24,
                )
              : InkWell(
                  key: WidgetKeys.returnAttachmentDownloadButton,
                  onTap: tapDownload,
                  child: const Icon(
                    Icons.cloud_download_outlined,
                    color: ZPColors.primary,
                  ),
                ),
        ],
      ),
    );
  }
}
