import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OutsideReturnPolicyTag extends StatelessWidget {
  const OutsideReturnPolicyTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.outsideReturnPolicyTag,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.info,
            size: 20,
            color: ZPColors.skyBlueColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              context.tr('Outside return policy'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.skyBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
