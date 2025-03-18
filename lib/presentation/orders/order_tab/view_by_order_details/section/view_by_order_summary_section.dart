import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/widgets/price_not_available_message.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final salesOrgConfigs = eligibilityState.salesOrgConfigs;
    final orderDetails =
        context.read<ViewByOrderDetailsBloc>().state.orderHistoryDetails;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Order Summary'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          //on order detail as there is single entity we can directly fetch subtotal value as order value
          _PriceTile(
            key: WidgetKeys.viewByOrderSubtotalKey,
            orderNumber: orderDetails.orderNumber,
            title: context.tr(
              'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
            ),
            value: orderDetails.orderValue,
          ),
          if (eligibilityState.salesOrg.isID) ...[
            const SizedBox(height: 10),
            _PriceTile(
              key: WidgetKeys.viewByOrderIdTaxKey,
              orderNumber: orderDetails.orderNumber,
              title: '${context.tr('Tax at')} ${orderDetails.taxRate}%',
              value: orderDetails.totalTax,
            ),
            const SizedBox(height: 10),
            _PriceTile(
              key: WidgetKeys.viewByOrderIdSmallOrderFeeKey,
              orderNumber: orderDetails.orderNumber,
              title: context.tr('Small order fee'),
              value: orderDetails.deliveryFee,
            ),
            Text(
              '${context.tr('Applies to orders less than')} ${StringUtils.formatPrice(
                salesOrgConfigs,
                eligibilityState.salesOrg.smallOrderThreshold,
              )}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            const SizedBox(height: 10),
            _PriceTile(
              key: WidgetKeys.viewByOrderIdManualFeeKey,
              orderNumber: orderDetails.orderNumber,
              title: context.tr('Manual fee'),
              value: orderDetails.manualFee,
            ),
            const _SectionDivider(),
            _PriceTile(
              key: WidgetKeys.viewByOrderIdGrandTotalKey,
              orderNumber: orderDetails.orderNumber,
              title: context.tr('Grand total'),
              value: orderDetails.totalValue,
              priceStyle: PriceStyle.grandTotalPrice,
            ),
            const SizedBox(height: 10),
            _PriceTile(
              key: WidgetKeys.viewByOrderIdTotalSavingsKey,
              orderNumber: orderDetails.orderNumber,
              title: context.tr('Total savings'),
              value: orderDetails.totalDiscount,
            ),
          ] else ...[
            const SizedBox(
              height: 5,
            ),
            if (eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)
              _PriceTile(
                key: WidgetKeys.viewByOrderTaxKey,
                orderNumber: orderDetails.orderNumber,
                title: eligibilityState.salesOrg.isMaterialTax
                    ? context.tr('Tax')
                    : '${context.tr('Tax at')} ${orderDetails.taxRate}%',
                value: orderDetails.totalTax,
              ),
            const SizedBox(
              height: 5,
            ),
            /*const BalanceTextRow(
              keyText: 'Stamp duty',
              valueText: '',
            ),
            const BalanceTextRow(
              keyText: 'Small order fee',
              valueText: '',
            ),*/
            const _SectionDivider(),
            _PriceTile(
              key: WidgetKeys.viewByOrderGrandTotalKey,
              orderNumber: orderDetails.orderNumber,
              title: context.tr('Grand total'),
              priceStyle: PriceStyle.grandTotalPrice,
              value: orderDetails.totalValue,
            ),
            if (orderDetails
                .orderHistoryDetailsOrderItem.containsMaterialsWithInvalidPrice)
              const PriceNotAvailableMessage(
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
            // const BalanceTextRow(
            //   keyText: 'Total savings', // TODO: after getting information will enhance and allign with web
            //   valueText: '',
            // ),
          ],
        ],
      ),
    );
  }
}

class _PriceTile extends StatelessWidget {
  const _PriceTile({
    super.key,
    required this.value,
    required this.title,
    required this.orderNumber,
    this.priceStyle = PriceStyle.summaryPrice,
  });

  final PriceStyle priceStyle;
  final double value;
  final String title;
  final OrderNumber orderNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(child: Text('$title:')),
        PriceComponent(
          type: priceStyle,
          price: orderNumber.isValid() ? value.toString() : context.tr('NA'),
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
        ),
      ],
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 0,
      height: 15,
      endIndent: 0,
      thickness: 1,
      color: ZPColors.lightGray2,
    );
  }
}
