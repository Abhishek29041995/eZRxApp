import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AmountToFilter extends StatefulWidget {
  final String amountTo;
  final Function(String) onAmountToChanged;
  final InputDecoration? decoration;

  const AmountToFilter({
    required this.amountTo,
    required this.onAmountToChanged,
    this.decoration,
    super.key,
  });

  @override
  State<AmountToFilter> createState() => _AmountToFilterState();
}

class _AmountToFilterState extends State<AmountToFilter> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.amountTo;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AmountToFilter oldWidget) {
    if (oldWidget.amountTo != widget.amountTo && widget.amountTo.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.clear();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomNumericTextField.decimalNumber(
        autoCorrect: false,
        fieldKey: WidgetKeys.amountValueTo,
        controller: controller,
        onChanged: widget.onAmountToChanged,
        decoration: widget.decoration ??
            InputDecoration(
              hintText: context.tr('Amount to'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
      ),
    );
  }
}
