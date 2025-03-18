import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.fieldKey,
    required this.labelText,
    this.controller,
    this.validator,
    required this.onChanged,
    required this.decoration,
    this.isEnabled = true,
    this.autoCorrect = false,
    this.keyboardType,
    this.initValue,
    this.textColor,
    this.obscureText = false,
    this.onDone,
    this.onTap,
    this.maxLines = 1,
    this.mandatory = false,
    this.readOnly = false,
    this.focusNode,
    this.obscuringCharacter = '•',
    this.inputFormatters,
    this.onTapOutside,
    this.maxLength,
    this.buildCounter,
    this.labelStyle,
  });
  final Key fieldKey;
  final String labelText;
  final TextEditingController? controller;
  final String obscuringCharacter;
  final Function(String?)? validator;
  final Function(String) onChanged;
  final InputDecoration decoration;
  final bool isEnabled;
  final bool autoCorrect;
  final TextInputType? keyboardType;
  final String? initValue;
  final Color? textColor;
  final bool obscureText;
  final Function(String)? onDone;
  final Function()? onTap;
  final int maxLines;
  final bool mandatory;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TapRegionCallback? onTapOutside;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: labelStyle ?? Theme.of(context).textTheme.labelSmall,
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
        TextFormField(
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          obscuringCharacter: obscuringCharacter,
          key: fieldKey,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: textColor),
          autocorrect: autoCorrect,
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          decoration: decoration.copyWith(
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
            prefix: const SizedBox(width: 15),
          ),
          obscureText: obscureText,
          onChanged: onChanged,
          validator: (value) => validator?.call(value),
          initialValue: initValue,
          onFieldSubmitted: onDone,
          onTapOutside: onTapOutside,
          maxLines: maxLines,
          maxLength: maxLength,
          readOnly: readOnly,
          onTap: onTap,
          buildCounter: buildCounter,
        ),
      ],
    );
  }
}
