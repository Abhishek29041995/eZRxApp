part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferButtons extends StatelessWidget {
  final PriceAggregate cartItem;
  const _CounterOfferButtons({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages ||
          previous.isFetching != current.isFetching ||
          previous.item.materialInfo.counterOfferDetails !=
              current.item.materialInfo.counterOfferDetails,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                key: WidgetKeys.counterOfferConfirmButton,
                onPressed: () {
                  context
                      .read<PriceOverrideBloc>()
                      .add(const PriceOverrideEvent.validateInputFields());
                  if (state.isInputFieldValid &&
                      state.item.materialInfo.counterOfferDetails !=
                          cartItem.materialInfo.counterOfferDetails) {
                    context.read<CartBloc>().add(
                          CartEvent.upsertCart(
                            priceAggregate: state.item
                                .copyWith(quantity: state.item.quantity),
                          ),
                        );
                  }
                },
                child: LoadingShimmer.withChild(
                  enabled: state.isFetching,
                  child: Text('Confirm'.tr()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
