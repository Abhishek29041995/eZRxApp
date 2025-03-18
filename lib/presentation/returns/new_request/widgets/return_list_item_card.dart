import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnListItemCard extends StatelessWidget {
  final ReturnRequestInformation data;
  final Function? onTap;
  final Widget? bottomWidget;
  final bool showReturnInvoiceData;
  final bool showUnitPrice;
  final bool showApproverUpdated;
  final String? returnId;
  final String? invoiceId;
  const ReturnListItemCard._({
    required this.data,
    this.bottomWidget,
    this.onTap,
    this.showReturnInvoiceData = false,
    this.returnId,
    this.invoiceId,
    this.showApproverUpdated = false,
    this.showUnitPrice = false,
    super.key,
  });

  factory ReturnListItemCard.listItem({
    required ReturnItem data,
    required Function onTap,
  }) =>
      ReturnListItemCard._(
        data: ReturnRequestInformation.empty().copyWith(
          status: data.status,
          materialNumber: data.materialNumber,
          isMarketPlace: data.isMarketPlace,
          outsidePolicy: data.outsidePolicy,
          prsfd: data.prsfd,
          materialDescription: data.defaultMaterialDescription,
          batch: data.batch,
          expiryDate: data.expiry,
          returnQuantity: data.itemQty.getIntValue,
          totalPrice: data.totalPrice,
          wareHouseStorageCondition: data.wareHouseStorageCondition,
        ),
        onTap: onTap,
        showReturnInvoiceData: true,
        returnId: data.requestId,
        invoiceId: data.invoiceID,
      );

  factory ReturnListItemCard.detailItem({
    required ReturnRequestInformation data,
    required Widget bottomWidget,
    Key? key,
  }) =>
      ReturnListItemCard._(
        data: data,
        bottomWidget: bottomWidget,
        showApproverUpdated: true,
        showUnitPrice: true,
        key: key,
      );

  factory ReturnListItemCard.summaryItem({
    required ReturnMaterial data,
    required ReturnItemDetails detailData,
    required Widget bottomWidget,
  }) =>
      ReturnListItemCard._(
        data: ReturnRequestInformation.empty().copyWith(
          status: StatusType('pending'),
          materialNumber: data.materialNumber,
          isMarketPlace: data.isMarketPlace,
          outsidePolicy: data.outsidePolicy,
          materialDescription: data.defaultMaterialDescription,
          batch: data.batch,
          expiryDate: data.expiryDate,
          returnQuantity: detailData.returnQuantity.getIntValue,
          totalPrice: detailData.returnValue,
          overrideValue: detailData.priceOverride.doubleValue,
          wareHouseStorageCondition: data.wareHouseStorageCondition,
          unitPrice: detailData.unitPrice,
        ),
        bottomWidget: bottomWidget,
        showUnitPrice: true,
      );

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return InkWell(
      key: WidgetKeys.returnItemKey,
      onTap: () => onTap?.call(),
      child: CustomCard(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: StatusLabel(
                          key: WidgetKeys.returnItemTileStatus,
                          status: StatusType(
                            data.status.displayStatus,
                          ),
                        ),
                      ),
                      if (data.displayOutSidePolicy(
                        eligibilityState
                            .salesOrgConfigs.allowReturnsOutsidePolicy,
                      ))
                        const Flexible(child: OutsideReturnPolicyTag()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ProductImage(
                            key: WidgetKeys.commonTileItemImage,
                            fit: BoxFit.fitHeight,
                            materialNumber: data.materialNumber,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 4,
                                children: [
                                  if (data.isMarketPlace)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: MarketPlaceLogo.small(),
                                    ),
                                  Text(
                                    data.materialNumber.displayMatNo,
                                    key: WidgetKeys.commonTileItemLabel,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  if (data.prsfd.isBonus &&
                                      !eligibilityState.salesOrg.isID)
                                    const BonusTag(
                                      key: WidgetKeys.returnItemTileBonusTag,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  data.materialDescription,
                                  key: WidgetKeys.commonTileItemTitle,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${context.tr('Batch')}: ${data.displayBatch} - ${context.tr('Expires')}: ${data.displayExpiryDate}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: ZPColors.neutralsGrey1),
                                key: WidgetKeys.returnBatchAndExpires,
                              ),
                              WareHouseStorageConditionTag(
                                wareHouseStorageCondition: data
                                    .wareHouseStorageCondition
                                    .displayStorageCondition,
                              ),
                              if (showUnitPrice)
                                ReturnSummaryItemPrice(
                                  requestInformation: data,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showReturnInvoiceData)
                    Wrap(
                      children: [
                        Text(
                          '${context.tr('Return')} #$returnId',
                          style: Theme.of(context).textTheme.bodySmall,
                          key: WidgetKeys.returnRequestId,
                        ),
                        Text(
                          ' | ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${context.tr('Invoice')} #$invoiceId',
                          key: WidgetKeys.returnInvoiceId,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const Divider(
              height: 16,
              indent: 0,
              endIndent: 0,
              thickness: 1,
              color: ZPColors.tenderUnselectBorder,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${context.tr('Qty')}: ${data.returnQuantity}',
                              style: Theme.of(context).textTheme.bodyLarge,
                              key: WidgetKeys.commonTileItemQty,
                            ),
                            if (data.isApprovedQuantityOverride &&
                                showApproverUpdated)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                  ),
                                  child: ReturnOverrideInfoIcon.quantity(
                                    context: context,
                                    initialQuantity: data.initialQuantity,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PriceComponent(
                            salesOrgConfig: eligibilityState.salesOrgConfigs,
                            price: data.totalPrice.toString(),
                            type: PriceStyle.grandTotalPrice,
                          ),
                          if (data.isApprovedCounterOffer &&
                              showApproverUpdated)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: ReturnOverrideInfoIcon.price(
                                context: context,
                                price: data.userOverrideValue.toString(),
                                displaySubContent: data.isApproverOverride,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: bottomWidget ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
