import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MarketPlaceSellerWithLogo extends StatelessWidget {
  final String sellerName;
  final Color? logoBackgroundColor;
  final Color? titleColor;

  const MarketPlaceSellerWithLogo(
    this.sellerName, {
    super.key,
    this.logoBackgroundColor,
    this.titleColor,
  });

  factory MarketPlaceSellerWithLogo.elevated(String sellerName) =>
      MarketPlaceSellerWithLogo(
        sellerName,
        logoBackgroundColor: ZPColors.white,
        titleColor: ZPColors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: logoBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const MarketPlaceRectangleLogo(),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: MarketPlaceSellerTitle(
            sellerName: sellerName,
            iconSize: 20,
            iconColor: titleColor ?? ZPColors.primary,
            textColor: titleColor ?? ZPColors.neutralsBlack,
          ),
        ),
      ],
    );
  }
}
