import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    this.widgetKey,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.all(12),
    this.circularRadius = 8,
    required this.color,
    required this.children,
  });

  final Key? widgetKey;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double circularRadius;
  final Color color;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(circularRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
