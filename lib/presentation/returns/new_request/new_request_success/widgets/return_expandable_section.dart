part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnExpandableSection extends StatefulWidget {
  final List<Widget> children;
  const _ReturnExpandableSection({
    required this.children,
  });

  @override
  State<_ReturnExpandableSection> createState() =>
      _ReturnExpandableSectionState();
}

class _ReturnExpandableSectionState extends State<_ReturnExpandableSection> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          key: WidgetKeys.returnExpandableSection,
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isExpanded ? 'Hide details'.tr() : 'Show details'.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.extraDarkGreen,
                      fontWeight: FontWeight.w800,
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
        _isExpanded
            ? Column(
                children: widget.children,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
