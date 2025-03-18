
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsInfoSection extends StatelessWidget {
  const DetailsInfoSection({
    super.key,
    required this.label,
    this.labelStyle,
    required this.child,
    this.padding,
  });
  final String label;
  final Widget child;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Text(
            context.tr(label),
            style: labelStyle ?? Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ],
    );
  }
}
