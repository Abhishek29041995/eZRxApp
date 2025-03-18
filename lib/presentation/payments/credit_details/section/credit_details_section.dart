import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditDetailsSection extends StatelessWidget {
  final CreditAndInvoiceItem creditItem;
  final List<CustomerDocumentDetail> creditItems;
  const CreditDetailsSection({
    super.key,
    required this.creditItem,
    required this.creditItems,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Column(
      children: [
        ListTile(
          key: WidgetKeys.creditDetailsTile,
          tileColor: ZPColors.primary,
          minVerticalPadding: 15.0,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  '${creditItem.postingKeyName} #${creditItem.searchKey.displayNAIfEmpty}',
                  key: WidgetKeys.creditItemId(
                    creditItem.searchKey.getOrDefaultValue(''),
                  ),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
              StatusLabel(
                status: StatusType(
                  creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              BalanceTextRow(
                keyText: context.tr('Document date'),
                valueText: creditItem.postingDate.dateString,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: context.tr('Document type'),
                valueText: creditItem.postingKeyName,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: context.tr('Reference Number'),
                valueText: creditItem.invoiceReference.getOrDefaultValue('NA'),
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
                BalanceTextRow(
                  valueFlex: 1,
                  keyText: context.tr('Gov. no'),
                  valueText: creditItem.documentReferenceID.displayDashIfEmpty,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              BalanceTextRow(
                keyText: context.tr('Details'),
                valueText: creditItem.postingKeyName,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddressInfoSection.order(),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        ListTile(
          key: WidgetKeys.creditSummaryTile,
          minVerticalPadding: 20.0,
          title: Text(
            context.tr('Credit summary'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (creditItems.isNotEmpty)
                  Row(
                    key: WidgetKeys.creditDetailSubTotal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr(
                          'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                        ),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      PriceComponent(
                        type: PriceStyle.summaryPrice,
                        salesOrgConfig: eligibilityState.salesOrgConfigs,
                        price: eligibilityState
                                .salesOrgConfigs.displaySubtotalTaxBreakdown
                            ? creditItems.totalNetAmount.toString()
                            : creditItems.totalGrossAmount.toString(),
                      ),
                    ],
                  ),
                if (eligibilityState
                        .salesOrgConfigs.displaySubtotalTaxBreakdown &&
                    creditItems.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      key: WidgetKeys.creditDetailTax,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.tr('Tax'),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        PriceComponent(
                          type: PriceStyle.summaryPrice,
                          salesOrgConfig: eligibilityState.salesOrgConfigs,
                          price: creditItems.totalTaxAmount.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
                if (eligibilityState.salesOrg.showSmallOrderFee &&
                    creditItems.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      key: WidgetKeys.creditDetailSmallOrderFee,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.tr('Small order fee')}:',
                        ),
                        PriceComponent(
                          type: PriceStyle.summaryPrice,
                          salesOrgConfig: eligibilityState.salesOrgConfigs,
                          price: creditItem.deliveryFee.toString(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${context.tr('Applies to orders less than')} ${StringUtils.formatPrice(
                      eligibilityState.salesOrgConfigs,
                      eligibilityState
                          .salesOrgConfigs.salesOrg.smallOrderThreshold,
                    )}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
                if (eligibilityState.salesOrg.showManualFee &&
                    creditItems.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      key: WidgetKeys.creditDetailManualFee,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.tr('Manual fee')}:',
                        ),
                        PriceComponent(
                          type: PriceStyle.summaryPrice,
                          salesOrgConfig: eligibilityState.salesOrgConfigs,
                          price: creditItem.manualFee.toString(),
                        ),
                      ],
                    ),
                  ),
                const Divider(
                  endIndent: 0,
                  indent: 0,
                  color: ZPColors.extraLightGrey2,
                  height: 20,
                  thickness: 0.5,
                ),
                Row(
                  key: WidgetKeys.creditDetailCreditTotal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr('Credit total:'),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    PriceComponent(
                      type: PriceStyle.totalPrice,
                      salesOrgConfig: eligibilityState.salesOrgConfigs,
                      price: creditItem
                          .convertIfAmountInTransactionCurrencyIsNegative
                          .toString(),
                    ),
                  ],
                ),
                if (creditItems.isEmpty)
                  InfoLabel(
                    key: WidgetKeys.creditItemAmountAdjustmentMessageWidget,
                    icon: const Icon(
                      Icons.error,
                      color: ZPColors.warning,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    mainColor: ZPColors.priceWarning,
                    textValue: context.tr(
                      'Return items are not related to this credit note. The total may or may not reflect the tax amount adjustments.',
                    ),
                  ),
              ],
            ),
          ),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}
