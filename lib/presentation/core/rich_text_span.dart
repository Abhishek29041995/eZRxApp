import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class RichTextSpan extends StatelessWidget {
  final String text;
  final Color textColor;
  const RichTextSpan({
    super.key,
    required this.text,
    this.textColor = ZPColors.black,
  });

  @override
  Widget build(BuildContext context) {
    final boldRegex = RegExp(r'\[b\](.*?)\[b\]');
    final textSpans = <TextSpan>[];

    text.splitMapJoin(
      boldRegex,
      onMatch: (Match match) {
        final boldText = match.group(1) ?? '';
        if (boldText.isNotEmpty) {
          textSpans.add(
            TextSpan(
              text: context.tr(boldText),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
            ),
          );
        }

        return '';
      },
      onNonMatch: (String nonMatch) {
        if (nonMatch.isNotEmpty) {
          textSpans.add(
            TextSpan(
              text: context.tr(nonMatch),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: textColor,
                  ),
            ),
          );
        }

        return '';
      },
    );

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}
