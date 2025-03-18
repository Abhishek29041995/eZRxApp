part of 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';

class _ExpandableDetailSection extends StatefulWidget {
  const _ExpandableDetailSection({
    required this.isExpandable,
    required this.isExpanded,
    required this.expandWidget,
  });
  final bool isExpandable;
  final bool isExpanded;
  final Widget expandWidget;

  @override
  State<_ExpandableDetailSection> createState() =>
      __ExpandableDetailSectionState();
}

class __ExpandableDetailSectionState extends State<_ExpandableDetailSection> {
  late bool isExpanded;
  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isExpandable)
          InkWell(
            key: WidgetKeys.returnExpandableSection,
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              key: WidgetKeys.returnDetailShowDetailButton,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isExpanded
                      ? context.tr('Hide details')
                      : context.tr('Show details'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ZPColors.extraDarkGreen,
                ),
              ],
            ),
          ),
        if (isExpanded)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        if (widget.isExpandable ? isExpanded : true) widget.expandWidget,
      ],
    );
  }
}
