import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';

class InvoiceSummary extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  final List<CustomerDocumentDetail> customerDocumentDetail;

  const InvoiceSummary({
    super.key,
    required this.invoiceItem,
    required this.customerDocumentDetail,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Total summary'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            key: WidgetKeys.invoiceDetailSubTotal,
            children: [
              Flexible(
                child: Text(
                  context.tr(
                    'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                  ),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              PriceComponent(
                type: PriceStyle.summaryPrice,
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price:
                    eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown
                        ? customerDocumentDetail.totalNetAmount.toString()
                        : customerDocumentDetail.totalGrossAmount.toString(),
              ),
            ],
          ),
          if (eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                key: WidgetKeys.invoiceDetailTax,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Tax'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    type: PriceStyle.summaryPrice,
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: customerDocumentDetail.totalTaxAmount.toString(),
                  ),
                ],
              ),
            ),
          ],
          if (eligibilityState.salesOrg.showSmallOrderFee) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                key: WidgetKeys.invoiceDetailSmallOrderFee,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Small order fee'),
                  ),
                  PriceComponent(
                    type: PriceStyle.summaryPrice,
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: invoiceItem.deliveryFee.toString(),
                  ),
                ],
              ),
            ),
            Text(
              '${context.tr('Applies to orders less than')} ${StringUtils.formatPrice(
                eligibilityState.salesOrgConfigs,
                eligibilityState.salesOrgConfigs.salesOrg.smallOrderThreshold,
              )}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
          if (eligibilityState.salesOrg.showManualFee)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                key: WidgetKeys.invoiceDetailManualFee,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Manual fee'),
                  ),
                  PriceComponent(
                    type: PriceStyle.summaryPrice,
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: invoiceItem.manualFee.toString(),
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
            key: WidgetKeys.invoiceDetailGrandTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('Grand total'),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                type: PriceStyle.totalPrice,
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: invoiceItem.amountInTransactionCurrency.toString(),
              ),
            ],
          ),
          if (eligibilityState.salesOrg.showTotalSaving)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                key: WidgetKeys.invoiceDetailTotalSaving,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Total savings'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    type: PriceStyle.summaryPrice,
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: invoiceItem.discount.toString(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
