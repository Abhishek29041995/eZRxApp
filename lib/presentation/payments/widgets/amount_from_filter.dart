import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AmountFromFilter extends StatefulWidget {
  final String amountFrom;
  final Function(String) onAmountFromChanged;
  final InputDecoration? decoration;

  const AmountFromFilter({
    required this.amountFrom,
    required this.onAmountFromChanged,
    this.decoration,
    super.key,
  });

  @override
  State<AmountFromFilter> createState() => _AmountFromFilterState();
}

class _AmountFromFilterState extends State<AmountFromFilter> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.amountFrom;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AmountFromFilter oldWidget) {
    if (oldWidget.amountFrom != widget.amountFrom &&
        widget.amountFrom.isEmpty) {
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
        fieldKey: WidgetKeys.amountValueFrom,
        controller: controller,
        onChanged: widget.onAmountFromChanged,
        decoration: widget.decoration ??
            InputDecoration(
              hintText: context.tr('Amount from'),
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
