import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTapIconButton;
  const SectionTitle({
    super.key,
    required this.title,
    required this.onTapIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.tr(title),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        IconButton(
          // key: WidgetKeys.iconArrow,
          key: WidgetKeys.sectionTileIcon(context.tr(title)),
          onPressed: onTapIconButton,
          visualDensity: VisualDensity.compact,
          icon: const CircleAvatar(
            backgroundColor: ZPColors.arrowButtonBackgroundColor,
            radius: 12,
            child: Icon(
              Icons.arrow_forward,
              size: 16,
              color: ZPColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
