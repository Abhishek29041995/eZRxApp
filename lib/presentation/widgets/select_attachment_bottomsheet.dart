import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class SelectAttachmentBottomsheet extends StatelessWidget {
  final Function(UploadOptionType) onUploadOptionSelected;
  const SelectAttachmentBottomsheet({
    super.key,
    required this.onUploadOptionSelected,
  });

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
              context.tr('Upload attachment'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            ...ListTile.divideTiles(
              context: context,
              color: ZPColors.tenderUnselectBorder,
              tiles: UploadOptionType.values.map(
                (option) => ListTile(
                  key: WidgetKeys.poAttachmentOption(option.name),
                  onTap: () {
                    onUploadOptionSelected(option);
                    context.maybePop();
                  },
                  leading: option.icon,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  title: Text(
                    context.tr(option.displayName),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.closeAlertDialog,
                    onPressed: () {
                      context.maybePop();
                    },
                    child: Text(
                      context.tr('Close'),
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
