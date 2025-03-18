part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _RequestDeliveryDatePicker extends StatefulWidget {
  const _RequestDeliveryDatePicker();

  @override
  State<_RequestDeliveryDatePicker> createState() =>
      _RequestDeliveryDatePickerState();
}

class _RequestDeliveryDatePickerState
    extends State<_RequestDeliveryDatePicker> {
  late final bloc = context.read<OrderEligibilityBloc>();
  late final _deliveryDateText = TextEditingController(
    text: bloc.state.selectedRequestDeliveryDate,
  );
  late var didTapOnTextFormField = false;

  @override
  void dispose() {
    _deliveryDateText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.isSelectedRequestDeliveryDateEmpty !=
          current.isSelectedRequestDeliveryDateEmpty,
      builder: (context, state) {
        return TextFormField(
          key: WidgetKeys.deliveryDate,
          readOnly: true,
          controller: _deliveryDateText,
          onTap: () async {
            final dateTime = await showDatePicker(
              context: context,
              firstDate: state.configs.deliveryStartDate,
              initialDate:
                  DateTimeUtils.getDeliveryDate(_deliveryDateText.text) ??
                      state.configs.deliveryStartDate,
              lastDate: state.configs.cartDeliveryEndDate,
              selectableDayPredicate: (DateTime val) =>
                  !DateTimeUtils.isWeekend(val),
            );
            if (!didTapOnTextFormField) {
              if (mounted) {
                setState(() {
                  didTapOnTextFormField = true;
                });
              }
            }
            if (dateTime == null || !context.mounted) return;
            _deliveryDateText.text =
                DateTimeUtils.getDeliveryDateString(dateTime);

            bloc.add(
              OrderEligibilityEvent.selectRequestDeliveryDate(
                _deliveryDateText.text,
              ),
            );
          },
          decoration: InputDecoration(
            hintText: context.tr('Select delivery date'),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 22, minHeight: 22),
            errorText: didTapOnTextFormField &&
                    state.isSelectedRequestDeliveryDateEmpty
                ? context.tr("Selected delivery date can't be empty!")
                : null,
            focusedBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            fillColor: Colors.white,
            filled: true,
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.date_range_outlined, size: 22),
            ),
          ),
        );
      },
    );
  }
}
