import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_with_logo.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/attachment_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHeaderSection extends StatelessWidget {
  const OrderHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final orderDetails = state.orderHistoryDetails;
        final isMarketPlace = state.orderHistoryDetails.isMarketPlace;

        return Container(
          color: ZPColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: RichText(
                      key: WidgetKeys.viewByOrderDetailOrderCode,
                      text: TextSpan(
                        text:
                            '${context.tr(orderDetails.processingStatus.prefix)} #${orderDetails.orderNumber.getOrDefaultValue('')}',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.white,
                                ),
                        children: [
                          if (orderDetails.processingStatus.isInQueue)
                            const WidgetSpan(
                              child: QueueNumberInfoIcon(
                                iconColor: ZPColors.attachmentColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (isMarketPlace &&
                  orderDetails.orderHistoryDetailsOrderItem.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MarketPlaceSellerWithLogo.elevated(
                    orderDetails.orderHistoryDetailsOrderItem.first
                        .principalData.principalName.name,
                  ),
                ),
              BalanceTextRow(
                key: WidgetKeys.viewByOrderDetailOrderDate,
                keyText: context.tr('Order date'),
                valueText: orderDetails.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
                keyFlex: 8,
                valueFlex: 7,
              ),
              const SizedBox(height: 5),
              BalanceTextRow(
                keyText: context.tr('PO reference'),
                valueText: orderDetails.poReference.displayNAIfEmpty,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
                keyFlex: 8,
                valueFlex: 7,
              ),
              if (eligibilityState.salesOrgConfigs.enableFutureDeliveryDay) ...[
                const SizedBox(height: 5),
                BalanceTextRow(
                  keyText: context.tr('Request delivery date'),
                  valueText:
                      orderDetails.requestedDeliveryDate.dateTimeOrNaString,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (eligibilityState.salesOrgConfigs.enableReferenceNote) ...[
                const SizedBox(height: 5),
                BalanceTextRow(
                  keyText: context.tr('Reference note'),
                  valueText: orderDetails.referenceNotes.displayNAIfEmpty,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (!eligibilityState.disablePaymentTermsDisplayForCustomer) ...[
                const SizedBox(height: 5),
                BalanceTextRow(
                  key: WidgetKeys.paymentTermKey,
                  keyText: context.tr('Payment term'),
                  valueText: orderDetails
                      .orderHistoryDetailsPaymentTerm.displayPaymentTerm,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (eligibilityState.salesOrgConfigs.enableMobileNumber) ...[
                const SizedBox(height: 5),
                BalanceTextRow(
                  keyText: context.tr('Contact person'),
                  valueText: orderDetails.orderBy.displayNAIfEmpty,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
                const SizedBox(height: 5),
                BalanceTextRow(
                  keyText: context.tr('Contact number'),
                  key: WidgetKeys.viewByOrderDetailsContactNumber,
                  valueText:
                      orderDetails.telephoneNumber.displayTelephoneNumber,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (eligibilityState
                  .salesOrgConfigs.enableSpecialInstructions) ...[
                const SizedBox(height: 8),
                BalanceTextRow(
                  keyText: context.tr('Delivery instructions'),
                  valueText: orderDetails
                      .orderHistoryDetailsSpecialInstructions.displayNAIfEmpty,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (eligibilityState.salesOrgConfigs.showPOAttachment) ...[
                const SizedBox(height: 5),
                const AttachmentSection(),
              ],
            ],
          ),
        );
      },
    );
  }
}
