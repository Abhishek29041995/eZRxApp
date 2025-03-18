import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZPColors.accentColor,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 25),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/ezrx+logo.svg',
              height: 40,
              width: 120,
              fit: BoxFit.scaleDown,
            ),
            const VerticalDivider(
              width: 15,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: Text(
                context.tr(title),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
