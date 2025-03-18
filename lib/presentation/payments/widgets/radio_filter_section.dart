import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioFilterSection extends StatelessWidget {
  final FilterOption radioValue;
  final FilterOption selectedValue;
  final String title;
  final Widget filterWidet;
  final EdgeInsets? padding;
  final bool showErrorMessage;

  const RadioFilterSection({
    super.key,
    required this.title,
    required this.radioValue,
    required this.selectedValue,
    required this.filterWidet,
    this.padding,
    this.showErrorMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.only(bottom: 16.0, top: 24.0),
          child: Row(
            children: [
              Radio(
                value: radioValue,
                groupValue: selectedValue,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                onChanged: (_) {},
              ),
              const SizedBox(width: 5),
              Text(
                '${context.tr(title)}${_suffixTitle(context)}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        filterWidet,
        if (showErrorMessage)
          ValueRangeError(
            key: WidgetKeys.amountRangeFilterError,
            label: context.tr('Invalid Amount range!'),
            isValid: !showErrorMessage,
          ),
      ],
    );
  }

  String _suffixTitle(BuildContext context) => radioValue ==
          FilterOption.amountRange()
      ? ' (${context.read<EligibilityBloc>().state.salesOrgConfigs.currency.code})'
      : '';
}
