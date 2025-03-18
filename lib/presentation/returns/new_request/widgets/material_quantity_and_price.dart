import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialQuantityAndPrice extends StatelessWidget {
  const MaterialQuantityAndPrice({
    super.key,
    required this.returnQuantity,
    required this.balanceQuantity,
    required this.totalPrice,
    this.displayReturnableQuantity = false,
  });

  final int returnQuantity;
  final int balanceQuantity;
  final double totalPrice;
  final bool displayReturnableQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.tr('Qty')}: $returnQuantity',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.black,
                  ),
              key: WidgetKeys.itemQtyKey,
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: totalPrice.toString(),
              key: WidgetKeys.itemTotalPriceKey,
            ),
          ],
        ),
        if (displayReturnableQuantity)
          Text(
            '${context.tr('Returnable Qty')}: $balanceQuantity',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
            key: WidgetKeys.itemBalanceQtyKey,
          ),
      ],
    );
  }
}
