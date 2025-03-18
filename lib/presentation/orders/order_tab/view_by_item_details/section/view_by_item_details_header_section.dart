part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class ViewByItemDetailsHeaderSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;

  const ViewByItemDetailsHeaderSection({
    super.key,
    required this.orderHistoryItem,
    required this.orderHistoryBasicInfo,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final config = eligibilityState.salesOrgConfigs;

    return Container(
      color: ZPColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderNumberSection(
            orderHistoryItem: orderHistoryItem,
          ),
          if (orderHistoryItem.isMarketPlace)
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 6),
              child: MarketPlaceSellerWithLogo.elevated(
                orderHistoryItem.principalData.principalName.name,
              ),
            ),
          const SizedBox(height: 10),
          BalanceTextRow(
            valueFlex: 1,
            key: WidgetKeys.viewByItemsOrderDetailOrderDate,
            keyText: context.tr('Order date'),
            valueText: orderHistoryItem.createdDate.dateString,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          const SizedBox(height: 8),
          InvoiceNumberSection(
            key: WidgetKeys.viewByItemsOrderDetailInvoiceNumber,
            invoiceNumber: orderHistoryItem.invoiceNumber.getOrDefaultValue(''),
            isMarketPlace: orderHistoryItem.isMarketPlace,
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            valueFlex: 1,
            key: WidgetKeys.viewByItemsOrderDetailPoReference,
            keyText: context.tr('PO reference'),
            valueText: orderHistoryItem.poReference.displayNAIfEmpty,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          if (config.enableFutureDeliveryDay) ...[
            const SizedBox(height: 8),
            BalanceTextRow(
              valueFlex: 1,
              key: WidgetKeys.viewByItemsOrderDetailsRequestedDeliveryDate,
              keyText: context.tr('Request delivery date'),
              valueText: orderHistoryItem.requestedDeliveryDate.dateString,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
          if (config.enableReferenceNote) ...[
            const SizedBox(height: 8),
            BalanceTextRow(
              key: WidgetKeys.viewByItemsOrderDetailsReferenceNote,
              valueFlex: 1,
              keyText: context.tr('Reference note'),
              valueText: orderHistoryItem.referenceNotes.displayDashIfEmpty,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
          if (!eligibilityState.disablePaymentTermsDisplayForCustomer) ...[
            const SizedBox(height: 8),
            LoadingShimmer.withChild(
              enabled:
                  context.read<ViewByItemDetailsBloc>().state.isDetailsLoading,
              child: BalanceTextRow(
                key: WidgetKeys.paymentTerm,
                keyText: context.tr('Payment term'),
                valueFlex: 1,
                valueText: orderHistoryBasicInfo.paymentTerm.displayValue,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
            ),
          ],
          if (config.enableMobileNumber) ...[
            const SizedBox(height: 8),
            BalanceTextRow(
              valueFlex: 1,
              key: WidgetKeys.viewByItemsOrderDetailsContactPerson,
              keyText: context.tr('Contact person'),
              valueText: orderHistoryItem.orderBy.displayNAIfEmpty,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(height: 8),
            BalanceTextRow(
              valueFlex: 1,
              key: WidgetKeys.viewByItemsOrderDetailsContactNumber,
              keyText: context.tr('Contact number'),
              valueText:
                  orderHistoryItem.telephoneNumber.displayTelephoneNumber,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
          if (config.enableSpecialInstructions) ...[
            const SizedBox(height: 8),
            BalanceTextRow(
              valueFlex: 1,
              keyText: context.tr('Delivery instructions'),
              valueText: orderHistoryItem.specialInstructions.displayNAIfEmpty,
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
          if (config.showPOAttachment) ...[
            const SizedBox(height: 8),
            const ViewByItemAttachmentSection(),
          ],
        ],
      ),
    );
  }
}
