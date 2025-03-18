import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_details_group.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/credit_invoice_detail_item_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CreditItemsSection extends StatelessWidget {
  final List<CustomerDocumentDetailGroup> creditItems;
  const CreditItemsSection({
    super.key,
    required this.creditItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: WidgetKeys.scrollList,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: creditItems.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final principalName = creditItems[index].principalName.name;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: context.isMPPayment
                  ? MarketPlaceSellerTitle(sellerName: principalName)
                  : Text(
                      principalName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.black,
                          ),
                    ),
            ),
            ...creditItems[index]
                .items
                .mapIndexed(
                  (itemIndex, creditItem) => CreditInvoiceDetailItemTile(
                    key: WidgetKeys.creditDetailMaterial(index, itemIndex),
                    customerDocumentDetail: creditItem,
                  ),
                )
                ,
          ],
        );
      },
    );
  }
}
