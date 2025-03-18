import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/price_display_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallOrderFee extends StatelessWidget {
  final double value;
  final bool showMessage;

  const SmallOrderFee({
    super.key,
    required this.value,
    this.showMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final messageObject = orderEligibilityState.smallOrderFeeAppliedMessage;

    return Column(
      key: WidgetKeys.smallOrderFeeSection,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        if (!orderEligibilityState.smallOrderFeeForExtSalesRep)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Small order fee')}:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              PriceDisplayWidget(
                priceComponent: PriceComponent(
                  key: WidgetKeys.smallOrderFeePrice,
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: value.toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ),
            ],
          ),
        if (showMessage || orderEligibilityState.smallOrderFeeForExtSalesRep)
          InfoLabel(
            textValue: context.tr(
              messageObject.message,
              namedArgs: messageObject.arguments,
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            mainColor: ZPColors.blueAccent,
            textStyle: Theme.of(context).textTheme.bodySmall,
            textColor: ZPColors.infoTextBlueColor,
          ),
      ],
    );
  }
}
