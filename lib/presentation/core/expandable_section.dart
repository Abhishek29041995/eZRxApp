import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final Widget child;
  final String expandedTitle;
  final String collapseTitle;
  final bool haveDivider;
  final bool expanded;
  const ExpandableSection({
    super.key,
    required this.child,
    this.expandedTitle = 'Hide details',
    this.collapseTitle = 'Show details',
    this.haveDivider = false,
    this.expanded = false,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
   void initState() {
    super.initState();
    _isExpanded = widget.expanded;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            key: WidgetKeys.expandableSection,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.tr(
                    _isExpanded ? widget.expandedTitle : widget.collapseTitle,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ZPColors.extraDarkGreen,
                ),
              ],
            ),
          ),
        ),
        if (widget.haveDivider)
          const Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        if (_isExpanded) widget.child,
      ],
    );
  }
}
