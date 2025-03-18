import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:flutter/material.dart';

mixin BottomsheetMixin on StatelessWidget {
  Future<bool?> showConfirmBottomSheet({
    required BuildContext context,
    String title = 'Remove item?',
    String content = 'This action cannot be undone',
    String confirmButtonText = 'Remove',
    bool isScrollControlled = true,
    bool enableDrag = false,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      builder: (_) =>  ConfirmBottomSheet(
        title: title,
        content: content,
        confirmButtonText: confirmButtonText,
      ),
    );
  }
}
