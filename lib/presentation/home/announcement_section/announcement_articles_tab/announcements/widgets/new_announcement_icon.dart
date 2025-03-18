import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class NewAnnouncementIcon extends StatelessWidget {
  const NewAnnouncementIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        context.tr('New'),
        key: WidgetKeys.announcementItemNewTagKey,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ZPColors.whiteBgCard,
            ),
      ),
    );
  }
}
