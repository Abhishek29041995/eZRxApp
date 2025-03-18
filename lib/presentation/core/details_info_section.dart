import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class DetailsInfoSection extends StatelessWidget {
  const DetailsInfoSection({
    super.key,
    required this.label,
    this.labelStyle,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 20, 16, 16),
  });
  final String label;
  final Widget child;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.detailInfoSection(label),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(
            context.tr(label),
            style: labelStyle ?? Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
        const Divider(
          height: 40,
          endIndent: 0,
          indent: 0,
          color: ZPColors.lightGray2,
          thickness: 0.5,
        ),
      ],
    );
  }
}
