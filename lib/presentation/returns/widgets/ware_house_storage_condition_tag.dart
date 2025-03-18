import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WareHouseStorageConditionTag extends StatelessWidget {
  final String wareHouseStorageCondition;
  const WareHouseStorageConditionTag({
    super.key,
    required this.wareHouseStorageCondition,
  });

  @override
  Widget build(BuildContext context) {
    return wareHouseStorageCondition.isNotEmpty
        ? Container(
            key: WidgetKeys.wareHouseStorageConditionTag,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: ZPColors.nextDiscountBG,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  SvgImage.deviceThermostatIcon,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    context.tr(wareHouseStorageCondition),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ZPColors.skyBlueColor),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
