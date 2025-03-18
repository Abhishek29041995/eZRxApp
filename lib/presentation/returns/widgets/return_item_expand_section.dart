part of 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';

const _keyFlex = 4;
const _valueFlex = 5;
const _itemSpacing = 8.0;

class _ReturnItemExpandSection extends StatelessWidget {
  const _ReturnItemExpandSection({
    super.key,
    required this.returnRequestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  });
  final ReturnRequestInformation returnRequestInformation;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.returnDetailSummary,
      children: [
        _MaterialDetailsSection(
          requestInformation: returnRequestInformation,
        ),
        const Divider(
          indent: 0,
          height: 30,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _ApprovalDetailsSection(
          requestInformation: returnRequestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
        _ReturnDetailsSection(
          requestInformation: returnRequestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
        if (returnRequestInformation.bonusInformation.isNotEmpty) ...[
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
          ...returnRequestInformation.bonusInformation.map(
            (item) => _ReturnBonusItemSection(
              isExpandable: false,
              bonusItem: item,
              downloadingAttachments: downloadingAttachments,
              downloadAttachment: downloadAttachment,
            ),
          ),
        ],
      ],
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  const _MaterialDetailsSection({
    required this.requestInformation,
  });
  final ReturnRequestInformation requestInformation;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: ZPColors.neutralsBlack,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Material details'),
          style: textStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: _itemSpacing + 2),
        BalanceTextRow(
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          keyText: context.tr(requestInformation.displayPrincipalOrSellerCode),
          valueText: requestInformation.principal,
        ),
        const SizedBox(height: _itemSpacing),
        BalanceTextRow(
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          keyText: context.tr(requestInformation.displayPrincipalOrSellerName),
          valueText: requestInformation.principalName.name,
        ),
        const SizedBox(height: _itemSpacing),
        BalanceTextRow(
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          keyText: context.tr('Invoice number'),
          valueText: requestInformation.invoiceNo,
        ),
        const SizedBox(height: _itemSpacing),
        BalanceTextRow(
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          key: WidgetKeys.returnItemDetailMaterialInvoiceDate,
          keyText: context.tr('Invoice date'),
          valueText: requestInformation.invoiceDate.dateString,
        ),
      ],
    );
  }
}

class _ReturnDetailsSection extends StatelessWidget {
  const _ReturnDetailsSection({
    super.key,
    required this.requestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
    this.isBonusDetails = false,
  });
  final ReturnRequestInformation requestInformation;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;
  final bool isBonusDetails;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: ZPColors.neutralsBlack,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isBonusDetails
              ? context.tr('Bonus return details')
              : context.tr('Return details'),
          style: textStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: _itemSpacing + 2),
        BalanceTextRow(
          keyText: context.tr('Return type'),
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          valueText: requestInformation.returnTypeDesc,
        ),
        BalanceTextRow(
          keyText: context.tr('Reason'),
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          valueText: requestInformation.returnOrderDesc,
        ),
        const SizedBox(height: _itemSpacing),
        BalanceTextRow(
          keyText: context.tr('Comments'),
          keyFlex: _keyFlex,
          valueFlex: _valueFlex,
          keyTextStyle: textStyle,
          valueText: requestInformation.remarks.displayText,
        ),
        const SizedBox(height: _itemSpacing),
        _ReturnAttachmentSection(
          key: WidgetKeys.returnAttachmentSection,
          attachments: requestInformation.attachmentUrl,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
      ],
    );
  }
}

class _ApprovalDetailsSection extends StatelessWidget {
  const _ApprovalDetailsSection({
    super.key,
    required this.requestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
    this.isBonusDetails = false,
  });
  final ReturnRequestInformation requestInformation;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;
  final bool isBonusDetails;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: ZPColors.neutralsBlack,
        );

    return requestInformation.status.showApprovalDetails
        ? Column(
            key: WidgetKeys.returnApprovalDetail,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isBonusDetails
                    ? context.tr('Bonus approval details')
                    : context.tr('Approval details'),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: _itemSpacing + 2),
              BalanceTextRow(
                keyText: context.tr('Reason'),
                valueText: requestInformation.statusReason.getOrDefault,
                keyFlex: _keyFlex,
                valueFlex: _valueFlex,
                keyTextStyle: textStyle,
              ),
              const SizedBox(height: _itemSpacing),
              BalanceTextRow(
                keyText: context.tr('Approval number'),
                valueText: requestInformation.displayNAIfBapiStatusIsNotSuccess,
                keyFlex: _keyFlex,
                valueFlex: _valueFlex,
                keyTextStyle: textStyle,
              ),
              const SizedBox(height: _itemSpacing),
              _ReturnAttachmentSection(
                downloadingAttachments: downloadingAttachments,
                downloadAttachment: downloadAttachment,
                attachments: const <PoDocuments>[],
              ),
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _ReturnAttachmentSection extends StatelessWidget {
  const _ReturnAttachmentSection({
    super.key,
    required this.attachments,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  });
  final List<PoDocuments> attachments;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: ZPColors.neutralsBlack,
        );

    return attachments.isEmpty
        ? BalanceTextRow(
            keyFlex: _keyFlex,
            valueFlex: _valueFlex,
            keyText: context.tr('Attachments'),
            keyTextStyle: textStyle,
            valueText: '-',
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${context.tr('Attachments')}:',
                style: textStyle,
              ),
              const SizedBox(height: _itemSpacing - 2),
              ...List.generate(
                attachments.length,
                (index) {
                  final attachment = attachments.elementAt(index);
                  final isDownloading =
                      downloadingAttachments.contains(attachment);

                  return ReturnDetailAttachmentTile(
                    attachment: attachment,
                    isDownloading: isDownloading,
                    tapDownload: () => downloadAttachment(attachment),
                  );
                },
              ),
            ],
          );
  }
}
