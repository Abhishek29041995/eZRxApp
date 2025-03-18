import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ErrorTextWithIcon extends StatelessWidget {
  final String valueText;
  final EdgeInsets textPadding;
  const ErrorTextWithIcon({
    super.key,
    required this.valueText,
    this.textPadding = const EdgeInsets.symmetric(vertical: 5.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: textPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: ZPColors.error,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            valueText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.error,
                ),
          ),
        ],
      ),
    );
  }
}
