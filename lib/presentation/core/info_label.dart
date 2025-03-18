import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final Color mainColor;
  final Color textColor;
  final double radius;
  final String textValue;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget icon;
  const InfoLabel({
    super.key,
    this.radius = 5,
    this.mainColor = ZPColors.lightBlueColor,
    this.textColor = ZPColors.black,
    required this.textValue,
    this.textStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    this.icon = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              textValue,
              style: (textStyle ?? Theme.of(context).textTheme.bodyMedium)
                  ?.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
