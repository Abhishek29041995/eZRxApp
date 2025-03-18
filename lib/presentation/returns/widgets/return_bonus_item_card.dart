part of 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';

class _ReturnBonusItemSection extends StatelessWidget {
  const _ReturnBonusItemSection({
    required this.bonusItem,
    required this.isExpandable,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  });
  final ReturnRequestInformation bonusItem;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;
  final bool isExpandable;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.returnBonusItemCard,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (bonusItem.displayOutSidePolicy(
              context
                  .read<EligibilityBloc>()
                  .state
                  .salesOrgConfigs
                  .allowReturnsOutsidePolicy,
            ))
              const OutsideReturnPolicyTag(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.tr('Bonus details'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                StatusLabel(
                  status: StatusType(
                    bonusItem.status.displayStatus,
                  ),
                ),
              ],
            ),
            const SizedBox(height: _itemSpacing),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: ZPColors.downPink,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    bonusItem.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: BonusTag(),
                  ),
                ],
              ),
              Text(
                bonusItem.materialDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${context.tr('Batch')} ${bonusItem.displayBatch} (${context.tr('Expires')} ${bonusItem.displayExpiryDate})',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ZPColors.neutralsGrey1),
                    ),
                  ),
                  if (bonusItem.bapiStatus.getIsBapiStatusFailed)
                    Text(
                      '${context.tr('Qty')}: ${bonusItem.returnQuantity} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
              bonusItem.bapiStatus.getIsBapiStatusFailed
                  ? BalanceTextRow(
                      keyText: context.tr('Reason for return'),
                      valueText: bonusItem.returnOrderDesc,
                      keyFlex: 3,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        key: WidgetKeys.bonusPriceComponent,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReturnSummaryItemPrice(
                                  requestInformation: bonusItem,
                                ),
                                if (bonusItem.isApprovedCounterOffer)
                                  ReturnOverrideInfoIcon.price(
                                    context: context,
                                    price:
                                        bonusItem.priceOverrideValue.toString(),
                                    displaySubContent:
                                        bonusItem.isApproverOverride,
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${context.tr('Qty')}: ${bonusItem.returnQuantity} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 5),
                              if (bonusItem.isApprovedQuantityOverride)
                                ReturnOverrideInfoIcon.quantity(
                                  context: context,
                                  initialQuantity: bonusItem.initialQuantity,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
              WareHouseStorageConditionTag(
                wareHouseStorageCondition:
                    bonusItem.wareHouseStorageCondition.displayStorageCondition,
              ),
              Text(
                context.tr(
                  'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
                ),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
              ),
            ],
          ),
        ),
        _ExpandableDetailSection(
          isExpandable: isExpandable,
          isExpanded: true,
          expandWidget: _ReturnBonusExpandSection(
            requestInformation: bonusItem,
            downloadingAttachments: downloadingAttachments,
            downloadAttachment: downloadAttachment,
          ),
        ),
      ],
    );
  }
}

class _ReturnBonusExpandSection extends StatelessWidget {
  const _ReturnBonusExpandSection({
    required this.requestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  });
  final ReturnRequestInformation requestInformation;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ApprovalDetailsSection(
          key: WidgetKeys.returnBonusApprovalDetail,
          requestInformation: requestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
          isBonusDetails: true,
        ),
        _ReturnDetailsSection(
          key: WidgetKeys.returnBonusReturnDetail,
          requestInformation: requestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
          isBonusDetails: true,
        ),
      ],
    );
  }
}
