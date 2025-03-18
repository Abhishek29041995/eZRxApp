part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferDiscountedPriceField extends StatelessWidget {
  const _CounterOfferDiscountedPriceField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.finalCounterOfferPrice != current.finalCounterOfferPrice,
      builder: (context, state) {
        return Padding(
          key: WidgetKeys.counterOfferDiscountedPriceWidget,
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.tr('Final counter offer price:'),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ZPColors.darkerGrey),
                ),
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: state.finalCounterOfferPrice,
                type: PriceStyle.grandTotalPrice,
              ),
            ],
          ),
        );
      },
    );
  }
}
