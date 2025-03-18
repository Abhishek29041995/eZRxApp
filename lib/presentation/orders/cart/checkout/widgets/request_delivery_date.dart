part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _RequestDeliveryDate extends StatefulWidget {
  const _RequestDeliveryDate();

  @override
  State<_RequestDeliveryDate> createState() => _RequestDeliveryDateState();
}

class _RequestDeliveryDateState extends State<_RequestDeliveryDate> {
  late TextEditingController _deliveryDateText;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    final salesConfig = context.read<EligibilityBloc>().state.salesOrgConfigs;
    _startDate = salesConfig.deliveryStartDate;
    _endDate = salesConfig.deliveryEndDate;
    _deliveryDateText = TextEditingController(
      text: context.read<AdditionalDetailsBloc>().state.displayDeliveryDate,
    );
    super.initState();
  }

  @override
  void dispose() {
    _deliveryDateText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) =>
          previous.deliveryInfoData.greenDeliveryEnabled !=
              current.deliveryInfoData.greenDeliveryEnabled ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFieldWithLabel(
            readOnly: true,
            fieldKey: WidgetKeys.deliveryDate,
            labelText: context.tr('Request delivery date'),
            controller: _deliveryDateText,
            onTap: state.deliveryInfoData.greenDeliveryEnabled ||
                    state.isLoading
                ? null
                : ([bool mounted = true]) async {
                    final dateTime = await pickDate(context);
                    if (!mounted || dateTime == null || !context.mounted) {
                      return;
                    }
                    _deliveryDateText.text =
                        DateTimeUtils.getDeliveryDateString(dateTime);
                    context.read<AdditionalDetailsBloc>().add(
                          AdditionalDetailsEvent.onTextChange(
                            label: DeliveryInfoLabel.deliveryDate,
                            newValue: DateTimeUtils.getApiDateWithDashString(
                              dateTime,
                            ),
                          ),
                        );
                  },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: context.tr('Select date'),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 22, minHeight: 22),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.date_range_outlined,
                  size: 22,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
        context: context,
        firstDate: _startDate,
        lastDate: _endDate,
        initialDate:
            DateTimeUtils.getDeliveryDate(_deliveryDateText.text) ?? _startDate,
        selectableDayPredicate: (DateTime val) => !DateTimeUtils.isWeekend(val),
      );
}
