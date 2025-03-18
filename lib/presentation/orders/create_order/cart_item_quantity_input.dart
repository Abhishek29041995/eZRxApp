import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class CartItemQuantityInput extends StatelessWidget {
  final TextEditingController controller;
  final Key quantityTextKey;
  final Function(int) onFieldChange;
  final Function(int) minusPressed;
  final Function(int) addPressed;
  final Function(int) onSubmit;
  final Key quantityAddKey;
  final Key quantityDeleteKey;
  final bool isEnabled;
  final bool isLoading;
  final bool returnZeroOnFieldEmpty;
  final int minimumQty;
  final int maximumQty;
  final double height;

  const CartItemQuantityInput({
    super.key,
    required this.controller,
    required this.quantityTextKey,
    required this.onFieldChange,
    required this.onSubmit,
    required this.minusPressed,
    required this.addPressed,
    required this.quantityAddKey,
    required this.quantityDeleteKey,
    required this.isEnabled,
    this.returnZeroOnFieldEmpty = false,
    this.isLoading = false,
    this.minimumQty = 1,
    this.maximumQty = 99999,
    this.height = 35,
  });

  bool get _isEnableMinusWithMinQty {
    final value = (int.tryParse(controller.text) ?? 0) - 1;

    return value >= minimumQty;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CartItemQuantityInputShimmer(controller: controller)
        : SizedBox(
            width: double.infinity,
            height: height,
            child: CustomNumericTextField.wholeNumber(
              onTapOutside: (event) {
                if (controller.text.isEmpty) {
                  controller.value = TextEditingValue(
                    text: 1.toString(),
                    selection: TextSelection.collapsed(
                      offset: controller.selection.base.offset,
                    ),
                  );
                }
              },
              isEnabled: isEnabled,
              fieldKey: quantityTextKey,
              controller: controller,
              textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                // limit charcter length to maximum quantity length
                LengthLimitingTextInputFormatter(maximumQty.toString().length),
              ],
              onChanged: (String text) {
                if (text.isEmpty) {
                  if (returnZeroOnFieldEmpty) {
                    onFieldChange(0);
                  }

                  return;
                }
                onFieldChange(int.parse(text));
              },
              onDone: (String text) {
                if (text.isEmpty) {
                  _updateTextControllerValue(1.toString());

                  return;
                }
                final value = (int.tryParse(controller.text) ?? 0);
                if (value < minimumQty) {
                  _updateTextControllerValue(minimumQty.toString());

                  return;
                }

                if (value > maximumQty) {
                  _updateTextControllerValue(maximumQty.toString());

                  return;
                }

                onSubmit(int.parse(text));
              },
              decoration: InputDecoration(
                fillColor: isEnabled ? ZPColors.white : ZPColors.lightSilver,
                isDense: true,
                prefixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, __, ___) => IconButton(
                    key: quantityDeleteKey,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final value = (int.tryParse(controller.text) ?? 0) - 1;
                      if (value >= minimumQty) {
                        final text = value.toString();
                        controller.value = TextEditingValue(
                          text: text,
                          selection: TextSelection.collapsed(
                            offset: controller.selection.base.offset,
                          ),
                        );
                        minusPressed.call(value);
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: _isEnableMinusWithMinQty
                          ? ZPColors.primary
                          : ZPColors.disableQuantityButton,
                    ),
                  ),
                ),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, __, ___) => IconButton(
                    key: quantityAddKey,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final value = (int.tryParse(controller.text) ?? 0) + 1;
                      if (value <= maximumQty) {
                        final text = value.toString();
                        controller.value = TextEditingValue(
                          text: text,
                          selection: TextSelection.collapsed(
                            offset: controller.selection.base.offset,
                          ),
                        );
                        addPressed.call(value);
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                border:
                    isEnabled ? const UnderlineInputBorder() : InputBorder.none,
              ),
            ),
          );
  }

  void _updateTextControllerValue(String newText) {
    controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
    onSubmit(int.parse(newText));
  }
}

class CartItemQuantityInputShimmer extends StatelessWidget {
  final TextEditingController controller;
  const CartItemQuantityInputShimmer({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer.withChild(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: TextField(
          enabled: false,
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            contentPadding: EdgeInsets.zero,
            border: const UnderlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
