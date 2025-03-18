import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/expandable_section.dart';
import 'package:ezrxmobile/presentation/core/load_more_indicator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryInvoiceTab extends StatelessWidget {
  final List<InvoiceDetail> invoices;
  final bool isLoading;
  final ScrollController controller;
  final List<LineNumber> lineNumberSelected;
  const OrderHistoryInvoiceTab({
    super.key,
    required this.invoices,
    required this.controller,
    this.isLoading = false,
    this.lineNumberSelected = const <LineNumber>[],
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    if (isLoading && invoices.isEmpty) {
      return LoadingShimmer.logo(
        key: WidgetKeys.loaderImage,
      );
    }
    if (invoices.isEmpty) {
      return const NoRecordFound(
        title: 'No invoice to show',
        subTitle: 'Invoices issued on eZRx+ will be shown here',
        svgImage: SvgImage.emptyBox,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        children: [
          ...List.generate(
            invoices.length,
            (index) {
              final invoice = invoices[index];
              final invoiceMaterials = invoice.getInvoiceOrderItemsDisplay(
                lineNumbersSelected: lineNumberSelected,
              );

              return CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${context.tr('Invoice')} #${invoice.invoiceNumber.displayNAIfEmpty}',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            StatusLabel(
                              status: StatusType(
                                invoice.invoiceStatus.getOrDefaultValue(''),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${context.tr('Material(s) quantity')}: ${invoice.getInvoiceTotalQtyDisplay(
                                  lineNumbersSelected: lineNumberSelected,
                                )}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            Text(
                              '${context.tr('Created on')} ${invoice.invoiceDate.dateString}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: PriceComponent(
                          salesOrgConfig: eligibilityState.salesOrgConfigs,
                          price: invoice
                              .getInvoiceTotalPriceDisplay(
                                lineNumbersSelected: lineNumberSelected,
                              )
                              .toString(),
                          type: PriceStyle.comboSubTotalExclTax,
                        ),
                      ),
                      ExpandableSection(
                        expanded: false,
                        child: Column(
                          children: [
                            if (eligibilityState.user.role.type.isSalesRepRole)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.error,
                                        size: 16,
                                        color: ZPColors.skyBlueColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        context.tr(
                                          'Show only materials are available to your account.',
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: ZPColors.skyBlueColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ...List.generate(
                              invoiceMaterials.length,
                              (
                                invoiceIndex,
                              ) {
                                final item = invoiceMaterials[invoiceIndex];

                                return _MaterialOfInvoice(
                                  material: item,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (isLoading)
            LoadingMoreIndicator(
              controller: controller,
            ),
        ],
      ),
    );
  }
}

class _MaterialOfInvoice extends StatelessWidget {
  final OrderHistoryDetailsOrderItem material;
  const _MaterialOfInvoice({required this.material});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ZPColors.tenderUnselectBg,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  showBorder: true,
                  showShadow: false,
                  clipBehavior: Clip.antiAlias,
                  child: ProductImage(
                    materialNumber: material.materialNumber,
                    fit: BoxFit.fitHeight,
                    width: 80,
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          material.materialNumber.displayMatNo,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          material.materialDescription,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ZPColors.tenderUnselectBorder,
            height: 16,
            indent: 0,
            endIndent: 0,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${context.tr('Qty')}: ${material.qty}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                PriceComponent(
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price:
                      material.isBonus ? 'FREE' : material.unitPrice.toString(),
                  type: PriceStyle.comboSubTotalExclTax,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
