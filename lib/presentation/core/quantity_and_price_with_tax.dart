import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class QuantityAndPriceWithTax extends StatelessWidget {
  final int quantity;

  final String quantityDescription;
  final String netPrice;
  final double taxPercentage;
  final double taxValue;
  final bool isTopAligned;
  final double totalPrice;
  const QuantityAndPriceWithTax._({
    required this.quantity,
    required this.totalPrice,
    this.quantityDescription = '',
    required this.taxPercentage,
    required this.netPrice,
    required this.taxValue,
    this.isTopAligned = false,
  });

  factory QuantityAndPriceWithTax.order({
    required int quantity,
    required double totalPrice,
    required String netPrice,
    required double taxPercentage,
    required double taxValue,
    String quantityDescription = '',
    bool isTopAlignment = false,
  }) =>
      QuantityAndPriceWithTax._(
        quantity: quantity,
        totalPrice: totalPrice,
        quantityDescription: quantityDescription,
        netPrice: netPrice,
        taxPercentage: taxPercentage,
        isTopAligned: isTopAlignment,
        taxValue: taxValue,
      );

  factory QuantityAndPriceWithTax.invoice({
    required int quantity,
    required double totalPrice,
    required String netPrice,
    required double taxValue,
    required double taxPercentage,
  }) =>
      QuantityAndPriceWithTax._(
        quantity: quantity,
        totalPrice: totalPrice,
        netPrice: netPrice,
        taxValue: taxValue,
        taxPercentage: taxPercentage,
      );

  @override
  Widget build(BuildContext context) {
    //TODO: Will cover this parse in another refactoring task later
    final eligibilityState = context.read<EligibilityBloc>().state;
    final netPriceValue = double.tryParse(netPrice) ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          isTopAligned ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.tr('Qty')}: $quantity',
              key: WidgetKeys.cartItemProductQty,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            if (quantityDescription.isNotEmpty)
              Text(
                quantityDescription,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PriceComponent(
              key: WidgetKeys.cartItemProductTotalPrice,
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              price: netPrice,
            ),
            if (eligibilityState.salesOrgConfigs.displayItemTaxBreakdown &&
                netPriceValue > 0)
              ItemTax(
                finalPriceTotalWithTax: totalPrice,
                itemTax: taxValue,
                itemTaxPercent: taxPercentage,
              ),
          ],
        ),
      ],
    );
  }
}
