import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final String labelText;
  final TextStyle? labelStyle;
  final BorderRadiusGeometry? borderRadius;

  final EdgeInsets margin;
  final EdgeInsets padding;
  const IconLabel({
    super.key,
    required this.icon,
    this.iconColor = ZPColors.white,
    this.iconSize = 20,
    this.backgroundColor = ZPColors.skyBlueColor,
    required this.labelText,
    this.labelStyle,
    this.margin = const EdgeInsets.only(top: 10),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.borderRadius = const BorderRadius.only(
      topRight: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: ZPColors.white,
            size: iconSize,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            labelText,
            style: labelStyle,
          ),
        ],
      ),
    );
  }
}
