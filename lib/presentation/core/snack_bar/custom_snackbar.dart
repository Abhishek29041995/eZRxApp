import 'dart:async';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/overlay_router.dart' as route;
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

enum CustomSnackBarStatus { showing, dismissed, isAppearing, isHiding }

//ignore: must_be_immutable
class CustomSnackBar<T> extends StatefulWidget {
  CustomSnackBar({
    super.key,
    required this.messageText,
    this.backgroundColor = ZPColors.backgroundTopSnackBar,
    this.icon = const Icon(
      Icons.check_circle,
      color: ZPColors.checkSnackBar,
    ),
    this.textStyle,
    this.mainButton,
  });

  final String messageText;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Widget icon;
  final Widget? mainButton;

  late route.OverlayRouter<T?>? snackbarRoute;

  Future<T?> show(BuildContext context) async {
    snackbarRoute = route.showSnackbar<T>(
      snackBar: this,
    ) as route.OverlayRouter<T?>;

    return await Navigator.of(context, rootNavigator: false)
        .push(snackbarRoute as Route<T>);
  }

  Future<T?> dismiss([T? result]) async {
    if (snackbarRoute == null) {
      return null;
    }

    if (snackbarRoute!.isCurrent) {
      snackbarRoute!.navigator!.pop(result);

      return snackbarRoute!.completed;
    } else if (snackbarRoute!.isActive) {
      snackbarRoute!.navigator!.removeRoute(snackbarRoute!);
    }

    return null;
  }

  @override
  State createState() => _CustomSnackBarState<T?>();
}

class _CustomSnackBarState<K extends Object?> extends State<CustomSnackBar<K>> {
  @override
  Widget build(BuildContext context) {
    return Material(
      key: WidgetKeys.customSnackBar,
      color: ZPColors.transparent,
      child: _ActualSnackbar(
        backgroundColor: widget.backgroundColor,
        icon: widget.icon,
        messageText: widget.messageText,
        textStyle: widget.textStyle,
        dismiss: widget.dismiss,
        mainButton: widget.mainButton,
      ),
    );
  }
}

class _ActualSnackbar extends StatelessWidget {
  const _ActualSnackbar({
    required this.backgroundColor,
    required this.icon,
    required this.messageText,
    required this.dismiss,
    this.mainButton,
    this.textStyle,
  });

  final Color backgroundColor;
  final Widget icon;
  final String messageText;
  final TextStyle? textStyle;
  final Widget? mainButton;
  final Function dismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: WidgetKeys.customSnackBarDismissable,
      direction: DismissDirection.horizontal,
      onDismissed: (direction) async {
        await dismiss();
      },
      child: GestureDetector(
        onPanUpdate: (details) async {
          final deltaY = details.delta.dy;
          const threshold = 20;

          // Dismiss when swiping up or top only.
          if (deltaY.abs() > threshold && deltaY < 0) {
            await dismiss();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 42.0),
                    child: icon,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 4.0,
                            right: 8.0,
                            bottom: 10,
                          ),
                          child: Text(
                            messageText,
                            key: WidgetKeys.customSnackBarMessage,
                            style: textStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: ZPColors.primary,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Row(
                      children: [
                        mainButton ?? const SizedBox.shrink(),
                        IconButton(
                          key: WidgetKeys.snackBarDismissButton,
                          onPressed: () async {
                            await dismiss();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: ZPColors.backgroundCloseButtonSnackBar,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
