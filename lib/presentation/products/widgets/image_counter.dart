import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ImageCounter extends StatelessWidget {
  final int total;
  final int selected;
  const ImageCounter({
    super.key,
    required this.total,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.materialDetailsImageCounter,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ZPColors.lightGray2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: ZPColors.white),
          children: <TextSpan>[
            TextSpan(
              text: '$selected',
            ),
            const TextSpan(
              text: '/',
            ),
            TextSpan(
              text: '$total',
            ),
          ],
        ),
      ),
    );
  }
}
