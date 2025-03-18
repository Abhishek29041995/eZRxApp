import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String data;
  final String title;
  final SalesOrganisationConfigs salesOrgConfig;
  final bool isNegativeColorDisplay;

  const PriceText({
    super.key,
    required this.data,
    required this.title,
    required this.salesOrgConfig,
    this.isNegativeColorDisplay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: WidgetKeys.priceText,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              data,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isNegativeColorDisplay
                        ? ZPColors.priceNegative
                        : ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
              key: WidgetKeys.priceTextData,
            ),
            Text(
              '${context.tr(title)} (${salesOrgConfig.currency.code})',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ZPColors.darkGray,
                  ),
              key: WidgetKeys.priceTextTitle,
            ),
          ],
        ),
      ),
    );
  }
}
