import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/image_box_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderItemCommonTile extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final String label;
  final Widget priceComponentSubtitle;
  final Widget footerWidget;
  final bool showOfferTag;
  final Widget statusWidget;
  final String quantity;
  final MaterialNumber materialNumber;
  final bool isCovidItem;
  final bool showBundleTag;
  final String materialDescription;
  final Widget tenderContractSection;
  final Widget batchExpiryDate;
  final String sellerName;
  final StatusType statusTag;
  final bool showTenderTag;
  const OrderItemCommonTile({
    super.key,
    this.onTap,
    this.padding,
    required this.label,
    required this.priceComponentSubtitle,
    required this.footerWidget,
    this.showOfferTag = false,
    required this.statusWidget,
    required this.quantity,
    required this.materialNumber,
    this.isCovidItem = false,
    this.showBundleTag = false,
    this.sellerName = '',
    required this.materialDescription,
    required this.tenderContractSection,
    required this.batchExpiryDate,
    required this.statusTag,
    required this.showTenderTag,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: statusWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageBoxWidget(
                    materialNumber: materialNumber,
                    isCovidItem: isCovidItem,
                    showOfferTag: showOfferTag,
                    showBundleTag: showBundleTag,
                    showTenderTag: showTenderTag,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  label,
                                  key: WidgetKeys.commonTileItemLabel,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              if (statusTag.isStatusTagValid) ...[
                                const SizedBox(width: 5),
                                StatusLabel(
                                  key: WidgetKeys.commonTileItemStatusLabel,
                                  status: statusTag,
                                  valueColor: statusTag.displayStatusTextColor,
                                ),
                              ],
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              materialDescription,
                              key: WidgetKeys.commonTileItemTitle,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          batchExpiryDate,
                          if (sellerName.isNotEmpty)
                            Text(
                              sellerName,
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: ZPColors.neutralsGrey1,
                              ),
                            ),
                          priceComponentSubtitle,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              endIndent: 0,
              indent: 0,
              height: 8,
              color: ZPColors.lightGray2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: footerWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: tenderContractSection,
            ),
          ],
        ),
      ),
    );
  }
}
