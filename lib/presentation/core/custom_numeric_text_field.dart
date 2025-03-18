import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomNumericTextField extends StatefulWidget {
  const CustomNumericTextField._({
    required this.fieldKey,
    required this.onChanged,
    required this.decoration,
    required this.keyboardType,
    required this.inputFormatters,
    this.labelText,
    this.controller,
    this.validator,
    this.isEnabled = true,
    this.autoCorrect = false,
    this.initValue,
    this.onDone,
    this.mandatory = false,
    this.readOnly = false,
    this.focusNode,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.style,
  });

  final Key fieldKey;
  final String? labelText;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Function(String) onChanged;
  final InputDecoration decoration;
  final bool isEnabled;
  final bool autoCorrect;
  final TextInputType keyboardType;
  final String? initValue;
  final Function(String)? onDone;
  final bool mandatory;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter> inputFormatters;
  final TapRegionCallback? onTapOutside;
  final TextAlign textAlign;
  final TextStyle? style;

  factory CustomNumericTextField.wholeNumber({
    required Key fieldKey,
    required Function(String) onChanged,
    required InputDecoration decoration,
    String? labelText,
    TextEditingController? controller,
    Function(String?)? validator,
    bool isEnabled = true,
    bool autoCorrect = false,
    String? initValue,
    Function(String)? onDone,
    bool mandatory = false,
    bool readOnly = false,
    FocusNode? focusNode,
    required List<TextInputFormatter> inputFormatters,
    TapRegionCallback? onTapOutside,
    TextAlign textAlign = TextAlign.start,
    TextStyle? style,
  }) =>
      CustomNumericTextField._(
        fieldKey: fieldKey,
        labelText: labelText,
        onChanged: onChanged,
        decoration: decoration,
        controller: controller,
        validator: validator,
        isEnabled: isEnabled,
        autoCorrect: autoCorrect,
        initValue: initValue,
        onDone: onDone,
        mandatory: mandatory,
        readOnly: readOnly,
        focusNode: focusNode,
        onTapOutside: onTapOutside,
        textAlign: textAlign,
        style: style,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        inputFormatters: [
          if (inputFormatters.isNotEmpty) ...inputFormatters,
          FilteringTextInputFormatter.allow(ZPRegexes.onlyDigits),
          FilteringTextInputFormatter.deny(ZPRegexes.leadingZero),
        ],
      );

  factory CustomNumericTextField.decimalNumber({
    required Key fieldKey,
    String? initValue,
    required Function(String) onChanged,
    required InputDecoration decoration,
    String? labelText,
    TextEditingController? controller,
    Function(String?)? validator,
    bool isEnabled = true,
    bool autoCorrect = false,
    Function(String)? onDone,
    bool mandatory = false,
    bool readOnly = false,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    TapRegionCallback? onTapOutside,
    TextAlign textAlign = TextAlign.start,
    TextStyle? style,
  }) =>
      CustomNumericTextField._(
        fieldKey: fieldKey,
        labelText: labelText,
        onChanged: onChanged,
        decoration: decoration,
        controller: controller,
        validator: validator,
        isEnabled: isEnabled,
        autoCorrect: autoCorrect,
        initValue: initValue,
        onDone: onDone,
        mandatory: mandatory,
        readOnly: readOnly,
        focusNode: focusNode,
        onTapOutside: onTapOutside,
        textAlign: textAlign,
        style: style,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: true,
        ),
        inputFormatters: [
          if (inputFormatters != null && inputFormatters.isNotEmpty)
            ...inputFormatters,

          // on iOS, in some regions like VN, the system keyboard will appear ',' instead of '.' key
          // So to allow user enter decimal number, we convert ',' to '.'

          CommaToDotFormatter(),
          FilteringTextInputFormatter.allow(ZPRegexes.onlyDecimal),
        ],
      );

  @override
  State<CustomNumericTextField> createState() => _CustomNumericTextFieldState();
}

class _CustomNumericTextFieldState extends State<CustomNumericTextField> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formField = TextFormField(
      inputFormatters: widget.inputFormatters,
      key: widget.fieldKey,
      style: widget.style ?? Theme.of(context).textTheme.titleMedium,
      focusNode: _focusNode,
      autocorrect: widget.autoCorrect,
      enabled: widget.isEnabled,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: widget.decoration.copyWith(
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        prefixIcon: widget.decoration.prefixIcon ?? const SizedBox(width: 15),
        prefixIconConstraints: widget.decoration.prefixIcon == null
            ? const BoxConstraints(maxWidth: 15)
            : null,
      ),
      onChanged: widget.onChanged,
      validator: (value) => widget.validator?.call(value),
      initialValue: widget.initValue,
      onFieldSubmitted: widget.onDone,
      onTapOutside: widget.onTapOutside,
      maxLines: 1,
      readOnly: widget.readOnly,
      textAlign: widget.textAlign,
    );
    KeyboardActionsConfig buildConfig(BuildContext context) =>
        KeyboardActionsConfig(
          keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
          actions: [
            KeyboardActionsItem(
              focusNode: _focusNode,
              displayArrows: false,
              toolbarButtons: [
                (node) => InkWell(
                      onTap: () {
                        node.unfocus();
                        _focusNode.unfocus();
                        if (widget.onDone != null) {
                          widget.onDone!(
                            widget.controller?.text ?? widget.initValue ?? '',
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: ZPColors.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 8.0,
                        ),
                        child: Text(
                          context.tr('Done'),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.whiteBgCard,
                                  ),
                        ),
                      ),
                    ),
              ],
            ),
          ],
        );

    return KeyboardActions(
      autoScroll: false,
      config: buildConfig(context),
      tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
      child: widget.labelText != null && widget.labelText!.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.labelText,
                    style: Theme.of(context).textTheme.labelSmall,
                    children: <TextSpan>[
                      if (widget.mandatory)
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
                formField,
              ],
            )
          : formField,
    );
  }
}

class CommaToDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.replaceAll(',', '.'),
    );
  }
}
