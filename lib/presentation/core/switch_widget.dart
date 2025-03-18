import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final bool disable;
  final Function(bool) onChanged;
  const SwitchWidget({
    super.key,
    this.disable = false,
    this.value = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor:
          disable ? ZPColors.toggleOnDisableState : ZPColors.textButtonColor,
      inactiveTrackColor: ZPColors.lightGrey,
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) => ZPColors.white,
      ),
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const Icon(
              Icons.check,
              color: ZPColors.textButtonColor,
            );
          }

          return const Icon(
            Icons.close,
            color: ZPColors.lightGrey,
          );
        },
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
