import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemPrice extends StatelessWidget {
  final bool showPreviousPrice;
  final String originPrice;
  final String unitPrice;
  final bool hidePrice;
  const OrderItemPrice({
    super.key,
    required this.showPreviousPrice,
    required this.unitPrice,
    required this.hidePrice,
    this.originPrice = '',
  });

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (showPreviousPrice && !hidePrice)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PriceComponent(
                  key: WidgetKeys.orderItemPriceStrikeThrough,
                  salesOrgConfig: configs,
                  price: originPrice,
                  type: PriceStyle.counterOfferPrice,
                ),
              ),
            PriceComponent(
              key: WidgetKeys.orderItemUnitPrice,
              salesOrgConfig: configs,
              price: unitPrice,
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        if (showPreviousPrice)
          Text(
            context.tr('Requested counter offer'),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.darkGray,
            ),
          ),
      ],
    );
  }
}
