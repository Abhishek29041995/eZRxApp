import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ValidationsFailedWarning extends StatelessWidget {
  const ValidationsFailedWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      textValue: context.tr(
        'Please ensure all requirements are met for your new password.',
      ),
      mainColor: ZPColors.lightRedStatusColor,
      margin: const EdgeInsets.fromLTRB(padding12, padding12, padding12, 0),
      key: WidgetKeys.errorRequirementsFillAllField,
    );
  }
}
