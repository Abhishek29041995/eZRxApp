import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Key sheetKey;
  final String? headerText;
  final Widget child;

  const CustomBottomSheet({
    super.key,
    required this.sheetKey,
    required this.child,
    this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: sheetKey,
        children: <Widget>[
          if (headerText != null)
            AppBar(
              title: Text(
                context.tr(headerText!),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 0,
              actions: [
                IconButton(
                  key: WidgetKeys.closeButton,
                  onPressed: () => context.router.maybePop(),
                  icon: const Icon(
                    Icons.clear,
                    color: ZPColors.primary,
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
