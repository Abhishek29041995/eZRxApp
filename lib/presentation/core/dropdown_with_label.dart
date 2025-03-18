import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class DropdownWithLabel extends StatelessWidget {
  const DropdownWithLabel({
    super.key,
    required this.fieldKey,
    required this.labelText,
    required this.items,
    required this.onChanged,
    required this.initialValue,
    this.isEnabled = true,
    this.hintText = '',
    this.mandatory = false,
    required this.validator,
  });

  final Key fieldKey;
  final String labelText;
  final ValueChanged<String?>? onChanged;
  final bool isEnabled;
  final String hintText;
  final String initialValue;
  final bool mandatory;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: Theme.of(context).textTheme.labelSmall,
            children: <TextSpan>[
              if (mandatory)
                TextSpan(
                  text: ' *',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          key: fieldKey,
          isExpanded: true,
          decoration: InputDecoration(
            enabled: isEnabled,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
          ),
          hint: Text(
            hintText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ZPColors.lightGray),
          ),
          items: items,
          onChanged: onChanged,
          value: initialValue.isEmpty ? null : initialValue,
          validator: validator,
        ),
      ],
    );
  }
}
