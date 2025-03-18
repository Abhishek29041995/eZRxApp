import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final double borderRadius;
  final double extentRatio;
  final List<CustomSlidableAction> endActionPaneActions;

  const CustomSlidable({
    super.key,
    required this.child,
    this.enabled = true,
    this.borderRadius = 0,
    this.endActionPaneActions = const <CustomSlidableAction>[],
    this.extentRatio = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return Center(child: child);

    return Slidable(
      key: const Key('slidable'),
      endActionPane: endActionPaneActions.isEmpty
          ? null
          : ActionPane(
              extentRatio: extentRatio,
              motion: const ScrollMotion(),
              children: endActionPaneActions
                  .map(
                    (e) => SlidableAction(
                      key: e.key,
                      onPressed: e.onPressed,
                      backgroundColor: e.backgroundColor,
                      foregroundColor: e.foregroundColor,
                      icon: e.icon,
                      label: e.label,
                      borderRadius: endActionPaneActions.last == e
                          ? BorderRadius.only(
                              topRight: Radius.circular(borderRadius),
                              bottomRight: Radius.circular(borderRadius),
                            )
                          : BorderRadius.zero,
                    ),
                  )
                  .toList(),
            ),
      child: child,
    );
  }
}

class CustomSlidableAction {
  final String label;
  final IconData icon;
  final Function(BuildContext context) onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Key? key;

  const CustomSlidableAction({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = ZPColors.red,
    this.foregroundColor = ZPColors.white,
    this.key,
  });
}
