import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

const _defaultPadding = EdgeInsets.symmetric(horizontal: 15);

class FilterSectionLabel extends StatelessWidget {
  final String text;
  const FilterSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _defaultPadding,
      child: Text(
        context.tr(text),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}
