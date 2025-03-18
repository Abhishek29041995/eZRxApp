import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTax extends StatelessWidget {
  const ItemTax({
    super.key,
    required this.finalPriceTotalWithTax,
    required this.itemTax,
    required this.itemTaxPercent,
  });

  final double finalPriceTotalWithTax;
  final double itemTax;
  final double itemTaxPercent;

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: ZPColors.darkGray,
        );

    return Column(
      key: WidgetKeys.itemTax,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Wrap(
          children: [
            Text(
              '+ ',
              style: txtStyle,
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: itemTax.toString(),
              type: PriceStyle.taxPrice,
            ),
            Text(
              ' ($itemTaxPercent% ${context.tr('tax')})',
              key: WidgetKeys.itemTaxPercentage,
              style: txtStyle,
            ),
          ],
        ),
        Wrap(
          key: WidgetKeys.finalTotalPriceWithTax,
          children: [
            Text(
              '= ',
              style: txtStyle,
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: finalPriceTotalWithTax.toStringAsFixed(2),
              type: PriceStyle.taxPrice,
            ),
          ],
        ),
      ],
    );
  }
}
