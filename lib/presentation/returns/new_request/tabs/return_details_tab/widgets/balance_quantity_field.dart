import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceQuantityField extends StatelessWidget {
  const BalanceQuantityField({
    super.key,
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      fieldKey: WidgetKeys.returnBalanceQuantityField(data.uuid),
      labelText: context.tr('Balance quantity'),
      onChanged: (value) {},
      initValue: data.balanceQuantity.stringValue,
      isEnabled: false,
      decoration: const InputDecoration(
        fillColor: ZPColors.extraLightGrey3,
      ),
      textColor: ZPColors.disableTextColor,
    );
  }
}
