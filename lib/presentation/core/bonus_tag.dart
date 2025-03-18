import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BonusTag extends StatelessWidget {
  const BonusTag({super.key, this.margin = const EdgeInsets.all(0)});
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      margin: margin,
      decoration: const BoxDecoration(
        color: ZPColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        'Bonus'.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ZPColors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
