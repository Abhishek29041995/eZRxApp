import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketPlaceSellerTitle extends StatelessWidget {
  final String sellerName;
  final double iconSize;
  final Color iconColor;
  final Color textColor;

  const MarketPlaceSellerTitle({
    super.key,
    required this.sellerName,
    this.iconSize = 18,
    this.iconColor = ZPColors.primary,
    this.textColor = ZPColors.neutralsBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          key: WidgetKeys.marketplaceSellerIcon,
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(
            SvgImage.marketplaceSellerIcon,
            fit: BoxFit.fill,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            sellerName,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ],
    );
  }
}
