part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _UrgentDeliveryTimePicker extends StatelessWidget {
  const _UrgentDeliveryTimePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.urgentDeliveryOption != current.urgentDeliveryOption,
      builder: (context, state) => InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (_) => _UrgentDeliveryBottomSheet(
            selectedOption: state.urgentDeliveryOption,
          ),
        ).then((value) {
          if (value is UrgentDeliveryTimePickerOption) {
            context
                .read<OrderEligibilityBloc>()
                .add(OrderEligibilityEvent.updateUrgentDeliveryOption(value));
          }
        }),
        child: Container(
          key: WidgetKeys.cartUrgentDeliveryTimePicker,
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: ZPColors.inputBorderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  state.urgentDeliveryOption.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.keyboard_arrow_down, size: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UrgentDeliveryBottomSheet extends StatefulWidget {
  final UrgentDeliveryTimePickerOption selectedOption;

  const _UrgentDeliveryBottomSheet({required this.selectedOption});

  @override
  State<_UrgentDeliveryBottomSheet> createState() =>
      _UrgentDeliveryBottomSheetState();
}

class _UrgentDeliveryBottomSheetState
    extends State<_UrgentDeliveryBottomSheet> {
  late var _selectedDeliveryTime = widget.selectedOption;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(padding12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding12),
              child: Text(
                context.tr('Urgent delivery'),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding12),
                child: _UrgentDeliveryTimeList(
                  onSelect: (value) => setState(() {
                    _selectedDeliveryTime = value;
                  }),
                  selectedOption: _selectedDeliveryTime,
                ),
              ),
            ),
            const SizedBox(height: padding24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: WidgetKeys.cancelButton,
                    onPressed: () => context.router.maybePop(),
                    child: Text(context.tr('Cancel')),
                  ),
                ),
                const SizedBox(width: padding12),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.confirmButton,
                    onPressed: () =>
                        context.router.maybePop(_selectedDeliveryTime),
                    child: Text(context.tr('Confirm')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UrgentDeliveryTimeList extends StatelessWidget {
  final UrgentDeliveryTimePickerOption selectedOption;
  final Function(UrgentDeliveryTimePickerOption value) onSelect;

  const _UrgentDeliveryTimeList({
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrganisationConfigs =
        context.read<OrderEligibilityBloc>().state.configs;
    final urgentDeliveryOptions =
        salesOrganisationConfigs.urgentDeliveryOptions;

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final option = urgentDeliveryOptions[index];

        return ListTileTheme(
          horizontalTitleGap: 4,
          child: RadioListTile<UrgentDeliveryTimePickerOption>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              option.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              if (value != null) onSelect.call(value);
            },
            groupValue: selectedOption,
            value: option,
          ),
        );
      },
      itemCount: urgentDeliveryOptions.length,
    );
  }
}
