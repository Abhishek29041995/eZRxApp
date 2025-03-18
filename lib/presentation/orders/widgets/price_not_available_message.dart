import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class PriceNotAvailableMessage extends StatelessWidget {
  final EdgeInsets margin;
  const PriceNotAvailableMessage({
    super.key,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      key: WidgetKeys.priceNotAvailableMessageWidget,
      icon: const Icon(
        Icons.error,
        color: ZPColors.warning,
      ),
      margin: margin,
      mainColor: ZPColors.priceWarning,
      textValue: context.tr(
        'Price is not available for at least one item. Grand total reflected may not be accurate.',
      ),
    );
  }
}
