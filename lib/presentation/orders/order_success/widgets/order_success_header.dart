part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessHeader extends StatelessWidget {
  final List<OrderHistoryDetails> orderHistoryList;
  final OrderHistoryDetails orderHeader;

  const _OrderSuccessHeader({
    required this.orderHistoryList,
    required this.orderHeader,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ZPColors.white,
        );
    const keyFlex = 3;
    const valueFlex = 4;
    final zpOrders = orderHistoryList.zpOrderOnly;
    final mpOrders = orderHistoryList.mpOrderOnly;

    return Container(
      padding: const EdgeInsets.all(padding12),
      color: ZPColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (orderHistoryList.containInQueueOrder)
            const Padding(
              padding: EdgeInsets.only(bottom: padding12),
              child: _OrderSuccessRefreshWarning(
                description:
                    'Please {actionName} or tap on queue number to get the Order ID.',
              ),
            ),
          ...mpOrders.isNotEmpty
              ? [
                  if (zpOrders.isNotEmpty)
                    _OrderNumberList(
                      key: WidgetKeys.orderSuccessZPOrderNumbers,
                      prefix: 'ZP',
                      orderStatus: orderHeader.processingStatus,
                      orderNumber: zpOrders.map((e) => e.orderNumber).toList(),
                    ),
                  if (zpOrders.isNotEmpty && mpOrders.isNotEmpty)
                    const SizedBox(height: padding12),
                  if (mpOrders.isNotEmpty)
                    _OrderNumberList(
                      key: WidgetKeys.orderSuccessMPOrderNumbers,
                      prefix: 'MP',
                      orderStatus: orderHeader.processingStatus,
                      orderNumber: mpOrders.map((e) => e.orderNumber).toList(),
                    ),
                ]
              : [
                  _OrderNumberList(
                    orderStatus: orderHeader.processingStatus,
                    orderNumber: [orderHeader.orderNumber],
                  ),
                ],
          const SizedBox(height: padding12),
          BalanceTextRow(
            keyFlex: keyFlex,
            valueFlex: valueFlex,
            keyText: context.tr('Order Date'),
            keyTextStyle: textStyle,
            valueText: orderHeader.createdDate.dateOrNaString,
            valueTextStyle: textStyle,
          ),
          BalanceTextRow(
            keyFlex: keyFlex,
            valueFlex: valueFlex,
            keyText: context.tr('PO reference'),
            keyTextStyle: textStyle,
            valueText: orderHeader.poReference.displayNAIfEmpty,
            valueTextStyle: textStyle,
          ),
          if (eligibilityState.salesOrgConfigs.enableFutureDeliveryDay)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Request delivery date'),
              keyTextStyle: textStyle,
              valueText: orderHeader.requestedDeliveryDate.dateOrNaString,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableReferenceNote)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Reference note'),
              keyTextStyle: textStyle,
              valueText: orderHeader.referenceNotes.displayNAIfEmpty,
              valueTextStyle: textStyle,
            ),
          if (!eligibilityState.disablePaymentTermsDisplayForCustomer)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Payment term'),
              keyTextStyle: textStyle,
              valueText:
                  orderHeader.orderHistoryDetailsPaymentTerm.displayPaymentTerm,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableMobileNumber)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Contact person'),
              keyTextStyle: textStyle,
              valueText: orderHeader.orderBy.displayNAIfEmpty,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableMobileNumber)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Contact number'),
              keyTextStyle: textStyle,
              valueText: orderHeader.telephoneNumber.displayTelephoneNumber,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableSpecialInstructions)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Delivery instructions'),
              keyTextStyle: textStyle,
              valueText: orderHeader
                  .orderHistoryDetailsSpecialInstructions.displayNAIfEmpty,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.showPOAttachment)
            const OrderSuccessAttachmentSection(),
        ],
      ),
    );
  }
}

class _OrderNumberList extends StatelessWidget {
  const _OrderNumberList({
    super.key,
    required this.orderStatus,
    required this.orderNumber,
    this.prefix = '',
  });

  final OrderStepValue orderStatus;
  final List<OrderNumber> orderNumber;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: ZPColors.white,
        );

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(
            text:
                '${prefix.isNotEmpty ? '$prefix ' : ''}${context.tr(orderStatus.prefix)} ',
          ),
          ...orderNumber
              .mapIndexed(
                (index, e) => [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      key: WidgetKeys.orderSuccessOrderId,
                      onTap: () {
                        context.read<ViewByOrderDetailsBloc>().add(
                              ViewByOrderDetailsEvent.fetch(orderNumber: e),
                            );
                      },
                      child: Text(
                        '#${e.getOrDefaultValue('')}',
                        style: textStyle,
                      ),
                    ),
                  ),
                  if (index != orderNumber.length - 1)
                    const TextSpan(text: ', '),
                ],
              )
              .flattened,
          if (orderStatus.isInQueue)
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: QueueNumberInfoIcon(
                iconColor: ZPColors.attachmentColor,
              ),
            ),
        ],
      ),
    );
  }
}
