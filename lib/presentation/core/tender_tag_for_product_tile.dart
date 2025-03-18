import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TenderTagForProductTile extends StatelessWidget {
  const TenderTagForProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.tenderTagForProductTile,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(
        SvgImage.tenderIcon,
      ),
    );
  }
}
