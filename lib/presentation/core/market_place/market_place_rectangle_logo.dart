import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketPlaceRectangleLogo extends StatelessWidget {
  const MarketPlaceRectangleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 64,
      child: SvgPicture.asset(
        SvgImage.marketplaceRectangleLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
