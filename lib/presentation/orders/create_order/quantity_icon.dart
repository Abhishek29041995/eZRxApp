//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class QuantityIcon extends StatelessWidget {
  final Function pressed;
  final IconData icon;
  final bool isEnabled;
  const QuantityIcon({
    super.key,
    required this.pressed,
    required this.icon,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 23,
      margin: const EdgeInsets.all(6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ZPColors.transparent,
        ),
        onPressed: isEnabled ? () => pressed() : () {},
        child: Icon(
          icon,
          color: ZPColors.black,
          size: 20,
        ),
      ),
    );
  }
}
