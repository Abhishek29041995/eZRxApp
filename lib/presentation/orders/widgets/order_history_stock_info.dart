import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderHistoryStockInfo extends StatelessWidget {
  final List<String> batchNumber;
  final List<String> expiryDate;
  final bool displayBatchAndExpiryDate;

  const OrderHistoryStockInfo({
    super.key,
    required this.batchNumber,
    required this.expiryDate,
    this.displayBatchAndExpiryDate = false,
  });

  factory OrderHistoryStockInfo.viewByOrder({
    required OrderHistoryDetailsOrderItem item,
    required EligibilityState eligibilityState,
  }) {
    final stockInfos = item.batches.map(
      (e) => StockInfo.empty().copyWith(
        batch: e.batchNumber,
        expiryDate: e.expiryDate,
      ),
    );

    return OrderHistoryStockInfo(
      batchNumber: stockInfos
          .map(
            (e) => e.displayBatchNumber(isMarketPlace: item.isMarketPlace),
          )
          .toList(),
      expiryDate: stockInfos
          .map(
            (e) => e.displayExpiryDate(
              isMarketPlace: item.isMarketPlace,
              isPhMdi: eligibilityState.salesOrg.isPhMdi,
              isAbbotPrincipalCode: item.principalData.principalCode.isAbbot,
            ),
          )
          .toList(),
      displayBatchAndExpiryDate:
          eligibilityState.salesOrgConfigs.batchNumDisplay,
    );
  }

  factory OrderHistoryStockInfo.viewByItem({
    required OrderHistoryItem item,
    required EligibilityState eligibilityState,
  }) {
    final stockInfos = item.batches.map(
      (e) => StockInfo.empty().copyWith(
        batch: e.batchNumber,
        expiryDate: e.expiryDate,
      ),
    );

    return OrderHistoryStockInfo(
      batchNumber: stockInfos
          .map(
            (e) => e.displayBatchNumber(isMarketPlace: item.isMarketPlace),
          )
          .toList(),
      expiryDate: stockInfos
          .map(
            (e) => e.displayExpiryDate(
              isMarketPlace: item.isMarketPlace,
              isPhMdi: eligibilityState.salesOrg.isPhMdi,
              isAbbotPrincipalCode: item.principalData.principalCode.isAbbot,
            ),
          )
          .toList(),
      displayBatchAndExpiryDate:
          eligibilityState.salesOrgConfigs.batchNumDisplay,
    );
  }

  factory OrderHistoryStockInfo.creditInvoiceDetail({
    required CustomerDocumentDetail item,
    required bool isMarketPlaceAccess,
    required EligibilityState eligibilityState,
  }) {
    final stockInfos = item.batches.map(
      (e) => StockInfo.empty().copyWith(
        batch: e.batchNumber,
        expiryDate: e.expiryDate,
      ),
    );

    return OrderHistoryStockInfo(
      batchNumber: stockInfos
          .map(
            (e) => e.displayBatchNumber(isMarketPlace: isMarketPlaceAccess),
          )
          .toList(),
      expiryDate: stockInfos
          .map(
            (e) => e.displayExpiryDate(
              isMarketPlace: isMarketPlaceAccess,
              isPhMdi: eligibilityState.salesOrg.isPhMdi,
              isAbbotPrincipalCode: item.principalData.principalCode.isAbbot,
            ),
          )
          .toList(),
      displayBatchAndExpiryDate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!displayBatchAndExpiryDate) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(batchNumber.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Text(
            '${context.tr('Batch')}: ${batchNumber[index]} - ${context.tr('Expires')}: ${expiryDate[index]}',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ZPColors.neutralsGrey1),
          ),
        );
      }),
    );
  }
}
