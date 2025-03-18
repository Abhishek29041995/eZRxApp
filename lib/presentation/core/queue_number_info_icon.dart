import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/info_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class QueueNumberInfoIcon extends StatelessWidget {
  final Color iconColor;
  const QueueNumberInfoIcon({super.key, this.iconColor = ZPColors.primary});

  @override
  Widget build(BuildContext context) {
    return InfoIcon(
      iconColor: iconColor,
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_) => InfoBottomSheet(
          title: context.tr('What\'s this number?'),
          description: context.tr(
            'Your order has been placed on ezrx but has not yet been made on SAP, and it will be queued in the SAP system to be created.',
          ),
          buttonTitle: context.tr('Close'),
        ),
      ),
    );
  }
}
