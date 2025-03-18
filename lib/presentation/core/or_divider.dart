import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            indent: 0,
            thickness: 0.5,
            color: ZPColors.darkGray,
          ),
        ),
        Text(
          context.tr('or'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ZPColors.darkGray,
              ),
        ),
        const Expanded(
          child: Divider(
            endIndent: 0,
            thickness: 0.5,
            color: ZPColors.darkGray,
          ),
        ),
      ],
    );
  }
}
