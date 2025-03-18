part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageDeliveryOptions extends StatelessWidget {
  const _CartPageDeliveryOptions();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.cartDeliveryOptionsSection,
      color: Colors.white,
      padding: const EdgeInsets.all(padding12),
      child: BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
        buildWhen: (prev, current) =>
            prev.deliveryOption != current.deliveryOption ||
            prev.configs != current.configs,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('Delivery Options'),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(height: padding12),
              if (state.configs.disclaimer.isNotEmpty)
                InfoLabel(
                  margin: const EdgeInsets.only(bottom: padding12),
                  mainColor: ZPColors.blueAccent,
                  textColor: ZPColors.neutralsBlack,
                  textValue: state.configs.disclaimer,
                ),
              IntrinsicHeight(
                child: Row(
                  children: () {
                    final options = [
                      if (state.configs.enableStandardDelivery)
                        DeliveryOption.standardDelivery(),
                      if (state.configs.enableRequestDeliveryDate)
                        DeliveryOption.requestDeliveryDate(),
                      if (state.configs.enableUrgentDelivery)
                        DeliveryOption.urgentDelivery(),
                    ];
                    final children = <Widget>[];
                    for (var i = 0; i < options.length; i++) {
                      children.add(
                        Expanded(
                          child: _DeliveryOptionCard(
                            deliveryOption: options[i],
                            selectedDeliveryOption: state.deliveryOption,
                          ),
                        ),
                      );
                      if (i != options.length - 1) {
                        children.add(const SizedBox(width: padding12));
                      }
                    }

                    return children;
                  }(),
                ),
              ),
              const SizedBox(height: padding12),
              Text(
                context.tr(
                  state.deliveryOption.description,
                  namedArgs: {
                    'number': '${state.configs.standardDeliveryDays}',
                  },
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsGrey1),
              ),
              if (state.deliveryOption ==
                  DeliveryOption.requestDeliveryDate()) ...[
                const SizedBox(height: padding12),
                const _RequestDeliveryDatePicker(),
              ] else if (state.deliveryOption ==
                  DeliveryOption.urgentDelivery()) ...[
                const SizedBox(height: padding12),
                const _UrgentDeliveryTimePicker(),
              ],
              const SizedBox(height: padding24),
              const Divider(
                endIndent: 0,
                indent: 0,
                color: ZPColors.lightGrey,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
