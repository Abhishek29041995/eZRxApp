import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TenderTag extends StatelessWidget {
  const TenderTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: const BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      key: WidgetKeys.tenderTag,
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: SvgPicture.asset(
              SvgImage.tenderIcon,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            context.tr('Tender Available'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
