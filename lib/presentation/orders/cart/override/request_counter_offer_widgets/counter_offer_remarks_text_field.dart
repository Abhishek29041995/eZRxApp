part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferRemarksTextField extends StatefulWidget {
  final String remarks;
  const _CounterOfferRemarksTextField({required this.remarks});

  @override
  State<_CounterOfferRemarksTextField> createState() =>
      __CounterOfferRemarksTextFieldState();
}

class __CounterOfferRemarksTextFieldState
    extends State<_CounterOfferRemarksTextField> {
  late TextEditingController _remarksController;

  @override
  void initState() {
    _remarksController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.remarks,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CounterOfferRemarksTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_remarksController.text != widget.remarks) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _remarksController.text = widget.remarks;
      });
    }
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: TextFieldWithLabel(
        fieldKey: WidgetKeys.counterOfferRemarksField,
        labelText: context.tr('Remarks'),
        decoration: InputDecoration(
          hintText: context.tr('Enter remarks (Optional)'),
        ),
        controller: _remarksController,
        onChanged: (value) {
          context.read<PriceOverrideBloc>().add(
                PriceOverrideEvent.onRemarksValueChange(
                  newRemarks: value,
                ),
              );
        },
        buildCounter: (
          context, {
          required int currentLength,
          required bool isFocused,
          maxLength,
        }) {
          return SizedBox(
            width: double.infinity,
            child: Text(
              context.tr(
                'Maximum: {max} characters',
                namedArgs: {
                  'max': '$currentLength/$maxLength',
                },
              ),
            ),
          );
        },
        maxLines: 3,
        maxLength: 132,
      ),
    );
  }
}
