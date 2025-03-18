import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenSettingBottomSheet extends StatelessWidget {
  const OpenSettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.poAttachmentUploadBottomsheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              context.tr('eZRX+ would like to access our camera'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr('This allows you to take pictures and scan codes'),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: WidgetKeys.dontAllowAlertDialog,
                    onPressed: () {
                      context.maybePop();
                    },
                    child: Text(
                      context.tr("Don't allow"),
                      style: const TextStyle(color: ZPColors.primary),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.allowAlertDialog,
                    onPressed: () async {
                      await openAppSettings();

                      if (context.mounted) {
                        unawaited(context.maybePop());
                      }
                    },
                    child: Text(
                      context.tr('Allow'),
                      style: const TextStyle(color: ZPColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
