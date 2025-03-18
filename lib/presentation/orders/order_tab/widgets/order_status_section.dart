import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_history_stepper.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusSection extends StatelessWidget {
  final List<OrderHistoryStep> steps;
  final DateTimeStringValue deliveryDate;
  final String deliveryDateTitle;

  const OrderStatusSection({
    super.key,
    required this.steps,
    required this.deliveryDateTitle,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
              title: Text(
                context.tr('Order status'),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ZPColors.primary),
              ),
              subtitle: !context
                      .read<EligibilityBloc>()
                      .state
                      .salesOrgConfigs
                      .disableDeliveryDate
                  ? Text(
                      '${context.tr(deliveryDateTitle)}: ${deliveryDate.dateOrDashString}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : const SizedBox.shrink(),
            ),
            Flexible(
              child: OrderHistoryStepper(
                steps: steps,
              ),
            ),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ZPColors.lightGray2,
          ),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 55),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          context.tr('Close'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
