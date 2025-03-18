import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FilterCountButton extends StatelessWidget {
  final int filterCount;
  final VoidCallback onTap;
  const FilterCountButton({
    super.key,
    required this.filterCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            context.tr('Filter'),
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.kPrimaryColor,
                ),
          ).tr(),
          if (filterIsNotEmpty)
            Text(
              ' ($filterCount) '.tr(),
              key: const ValueKey('filterCount'),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ).tr(),
          const Icon(
            Icons.filter_alt_outlined,
            color: ZPColors.kPrimaryColor,
            size: 16,
          ),
        ],
      ),
    );
  }

  bool get filterIsNotEmpty => filterCount != 0;
}
