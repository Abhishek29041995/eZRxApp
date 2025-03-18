import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as bd;

class CustomBadge extends StatelessWidget {
  final int count;
  final Color badgeColor;
  final IconData iconData;
  final VoidCallback onPressed;
  const CustomBadge(
    this.iconData, {
    super.key,
    required this.badgeColor,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return bd.Badge(
      key: WidgetKeys.customBadge,
      badgeContent: Text(
        count.toString(),
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: ZPColors.white,
        ),
      ),
      showBadge: count > 0,
      badgeStyle: const bd.BadgeStyle(
        badgeColor: ZPColors.orange,
        elevation: 0,
      ),
      badgeAnimation: const bd.BadgeAnimation.fade(),
      position: bd.BadgePosition.topEnd(top: 0, end: 0),
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: Icon(
          iconData,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
