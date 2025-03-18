import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/info_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MarketPlaceTitleWithLogo extends StatelessWidget {
  final bool showToolTip;

  const MarketPlaceTitleWithLogo({
    super.key,
    this.showToolTip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      key: WidgetKeys.cartMPProductSectionLabel,
      children: [
        const MarketPlaceIcon(
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 2),
        Text(
          context.tr('Marketplace'),
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: ZPColors.neutralsBlack),
        ),
        if (showToolTip) ...[
          const SizedBox(width: 4),
          InfoIcon(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => InfoBottomSheet(
                title: context.tr('What\'s Marketplace ?'),
                description: context.tr(
                  'The products from the Marketplace that you\'ve selected below are sold by their respective sellers as mentioned below, and each will be processed as a separate order.',
                ),
                buttonTitle: context.tr('Close'),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
