part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferPriceTextField extends StatefulWidget {
  final bool isDiscountOverrideEnable;
  final PriceAggregate cartItem;

  const _CounterOfferPriceTextField({
    required this.isDiscountOverrideEnable,
    required this.cartItem,
  });

  @override
  State<_CounterOfferPriceTextField> createState() =>
      _CounterOfferPriceTextFieldState();
}

class _CounterOfferPriceTextFieldState
    extends State<_CounterOfferPriceTextField> {
  late TextEditingController _priceController;

  @override
  void initState() {
    _priceController = TextEditingController.fromValue(
      TextEditingValue(
        text: _counterOfferPriceText,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CounterOfferPriceTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_priceController.text != _counterOfferPriceText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _priceController.text = _counterOfferPriceText;
      });
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages ||
            previous.isDiscountOverride != current.isDiscountOverride,
        builder: (context, state) {
          final currency =
              context.read<EligibilityBloc>().state.salesOrgConfigs.currency;

          return Form(
            autovalidateMode: widget.isDiscountOverrideEnable
                ? AutovalidateMode.onUserInteraction
                : state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
            child: CustomNumericTextField.decimalNumber(
              fieldKey: WidgetKeys.counterOfferPriceField,
              labelText:
                  '${context.tr('Counter offer price')} (${currency.code})',
              mandatory: !widget.isDiscountOverrideEnable,
              decoration: InputDecoration(
                hintText: context.tr('Enter counter offer price'),
              ),
              controller: _priceController,
              onChanged: (value) {
                context.read<PriceOverrideBloc>().add(
                      PriceOverrideEvent.onPriceValueChange(
                        newPrice: value,
                      ),
                    );
              },
              validator: (value) => state.isDiscountOverride &&
                      _priceController.text.isEmpty
                  ? null
                  : CounterOfferValue(value ?? '').value.fold(
                        (f) => f.mapOrNull(
                          empty: (_) =>
                              context.tr('Please enter counter offer price'),
                          numberMustBiggerThanZero: (_) =>
                              context.tr('Counter offer price cannot be zero'),
                        ),
                        (_) => null,
                      ),
            ),
          );
        },
      ),
    );
  }

  String get _counterOfferPriceText =>
      widget.cartItem.materialInfo.counterOfferDetails.counterOfferPrice
          .getOrDefaultValue('');
}
