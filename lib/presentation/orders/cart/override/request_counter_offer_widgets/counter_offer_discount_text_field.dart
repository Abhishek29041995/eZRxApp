part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferDiscountTextField extends StatefulWidget {
  final PriceAggregate cartItem;
  final bool isPriceOverrideEnable;
  const _CounterOfferDiscountTextField({
    required this.cartItem,
    required this.isPriceOverrideEnable,
  });

  @override
  State<_CounterOfferDiscountTextField> createState() =>
      _CounterOfferDiscountTextFieldState();
}

class _CounterOfferDiscountTextFieldState
    extends State<_CounterOfferDiscountTextField> {
  late TextEditingController _discountController;
  @override
  void initState() {
    _discountController = TextEditingController.fromValue(
      TextEditingValue(
        text: _counterOfferDiscountText,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CounterOfferDiscountTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_discountController.text != _counterOfferDiscountText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _discountController.text = _counterOfferDiscountText;
      });
    }
  }

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages ||
          previous.isPriceOverride != current.isPriceOverride,
      builder: (context, state) {
        return Form(
          autovalidateMode: widget.isPriceOverrideEnable
              ? AutovalidateMode.onUserInteraction
              : state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomNumericTextField.wholeNumber(
              fieldKey: WidgetKeys.counterOfferDiscountField,
              labelText: context.tr('Discount counter offer (%)'),
              decoration: InputDecoration(
                hintText: context.tr('Enter counter offer percentage discount'),
                errorMaxLines: 2,
              ),
              controller: _discountController,
              onChanged: (value) {
                context.read<PriceOverrideBloc>().add(
                      PriceOverrideEvent.onDiscountValueChanged(
                        newValue: value,
                      ),
                    );
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.deny(ZPRegexes.specialCharacters),
              ],
              validator: (value) => state.isPriceOverride &&
                      _discountController.text.isEmpty
                  ? null
                  : CounterOfferDiscountValue(value ?? '').value.fold(
                        (f) => f.mapOrNull(
                          empty: (_) =>
                              context.tr('Please enter discount counter offer'),
                          numberMustBiggerThanZero: (_) =>
                              context.tr('Discount offer price cannot be zero'),
                          exceedingMaxValue: (_) => context.tr(
                            'Please input counter offer percentage discount of less than 100%',
                          ),
                        ),
                        (_) => null,
                      ),
            ),
          ),
        );
      },
    );
  }

  String get _counterOfferDiscountText => widget
      .cartItem.materialInfo.counterOfferDetails.discountOverridePercentage
      .getOrDefaultValue('');
}
