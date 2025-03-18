import 'package:collection/collection.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/credit_invoice_detail_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';

class InvoiceItemsSection extends StatelessWidget {
  const InvoiceItemsSection({super.key, required this.customerDocumentDetail});
  final List<CustomerDocumentDetail> customerDocumentDetail;

  @override
  Widget build(BuildContext context) {
    return customerDocumentDetail.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                context.tr('No files found'),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customerDocumentDetail.groupList.length,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 45),
            itemBuilder: (context, index) {
              final principalName = customerDocumentDetail.groupList
                  .elementAt(index)
                  .principalName
                  .name;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: context.isMPPayment
                        ? MarketPlaceSellerTitle(
                            sellerName: principalName,
                            iconSize: 20,
                          )
                        : Text(
                            principalName,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: ZPColors.black,
                                ),
                          ),
                  ),
                  ...customerDocumentDetail.groupList
                      .elementAt(index)
                      .items
                      .mapIndexed(
                        (itemIndex, e) => CreditInvoiceDetailItemTile(
                          key: WidgetKeys.invoiceDetailMaterial(
                            index,
                            itemIndex,
                          ),
                          customerDocumentDetail: e,
                        ),
                      )
                      ,
                ],
              );
            },
          );
  }
}
