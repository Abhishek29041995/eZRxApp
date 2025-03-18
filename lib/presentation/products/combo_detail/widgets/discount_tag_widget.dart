import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class DiscountTagWidget extends StatelessWidget {
  final String rateDisplay;
  const DiscountTagWidget({required this.rateDisplay, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.comboDealMaterialItemDiscountTag,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.discountOfferBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        context.tr(
          '{percent}% Discount',
          namedArgs: {
            'percent': rateDisplay,
          },
        ),
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: ZPColors.lightBgYellow,
        ),
      ),
    );
  }
}
