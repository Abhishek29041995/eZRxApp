part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _DeliveryOptionCard extends StatelessWidget {
  final DeliveryOption deliveryOption;
  final DeliveryOption selectedDeliveryOption;

  const _DeliveryOptionCard({
    required this.deliveryOption,
    required this.selectedDeliveryOption,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = deliveryOption == selectedDeliveryOption;

    return CustomCard(
      child: EdgeCheckbox(
        key: WidgetKeys.cartDeliveryOptionCard(
          deliveryOption.title,
          isSelected,
        ),
        value: isSelected,
        onChanged: (_) {
          context.read<OrderEligibilityBloc>().add(
                OrderEligibilityEvent.selectDeliveryOption(
                  deliveryOption,
                ),
              );
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: padding12,
            horizontal: padding6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                deliveryOption.icon,
                height: 32,
                width: 32,
                alignment: Alignment.center,
              ),
              const SizedBox(height: padding6),
              Text(
                context.tr(deliveryOption.title),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
              const SizedBox(height: padding6),
              if (deliveryOption == DeliveryOption.urgentDelivery() &&
                  !isSelected)
                Text(
                  '-',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                )
              else
                BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
                  buildWhen: (previous, current) =>
                      previous.urgentDeliveryFee != current.urgentDeliveryFee,
                  builder: (context, state) => PriceComponent(
                    key: WidgetKeys.priceSummaryGrandTotal,
                    salesOrgConfig: state.configs,
                    type: PriceStyle.deliveryOptionFee,
                    maxLine: null,
                    align: TextAlign.center,
                    price: context.tr(
                      deliveryOption.price,
                      namedArgs: {
                        'urgentDeliveryPrice':
                            state.urgentDeliveryFee.toString(),
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
