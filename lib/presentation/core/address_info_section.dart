import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInfoSection extends StatelessWidget {
  final String actionText;
  final Color? backgroundColor;
  final Color? infoTextColor;
  final Color? customerNameTextColor;
  final EdgeInsets padding;

  const AddressInfoSection._({
    required this.actionText,
    this.backgroundColor,
    this.infoTextColor,
    this.customerNameTextColor,
    this.padding = EdgeInsets.zero,
  });

  factory AddressInfoSection.order() => const AddressInfoSection._(
        actionText: 'Order for',
        customerNameTextColor: ZPColors.primary,
      );

  factory AddressInfoSection.returnRequest() =>
      const AddressInfoSection._(actionText: 'Return for');

  factory AddressInfoSection.noAction({Color? customerNameTextColor}) =>
      AddressInfoSection._(
        actionText: '',
        customerNameTextColor: customerNameTextColor,
      );

  factory AddressInfoSection.greenBackground({
    EdgeInsets padding = EdgeInsets.zero,
    String actionText = '',
  }) =>
      AddressInfoSection._(
        actionText: actionText,
        backgroundColor: ZPColors.primary,
        infoTextColor: ZPColors.white,
        padding: padding,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      builder: (context, state) {
        return Container(
          color: backgroundColor,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                key: WidgetKeys.addressInfoSectionActionLabel,
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: infoTextColor,
                      ),
                  children: <TextSpan>[
                    if (actionText.isNotEmpty)
                      TextSpan(
                        text: '${context.tr(actionText)} ',
                      ),
                    TextSpan(
                      text: state.customerCodeInfo.customerName.name1,
                      style: TextStyle(color: customerNameTextColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${context.tr('Customer code')}: ${state.customerCodeInfo.customerCodeSoldTo}',
                  key: WidgetKeys.addressInfoSectionCustomerCodeLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: infoTextColor,
                      ),
                ),
              ),
              Text(
                state.customerCodeInfo.fullCustomerAddress,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${context.tr('Delivery to')}: ${state.shipToInfo.shipToCustomerCode}',
                key: WidgetKeys.addressInfoSectionDeliveryToLabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.shipToInfo.fullDeliveryAddress,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
