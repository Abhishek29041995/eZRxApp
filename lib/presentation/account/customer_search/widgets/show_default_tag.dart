part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ShowDefaultTag extends StatelessWidget {
  const _ShowDefaultTag();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding6),
      child: Chip(
        label: Text(
          context.tr('Default'),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: ZPColors.neutralsDarkBlack,
          ),
        ),
        labelPadding:
            const EdgeInsets.symmetric(horizontal: padding6, vertical: -2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: ZPColors.orangeChipColor,
        visualDensity: const VisualDensity(
          vertical: -4,
        ),
      ),
    );
  }
}
