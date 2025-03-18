import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ToDueDateFilter extends StatefulWidget {
  final String dueDateTo;
  final DateTimeRange dueDateFilterDateRange;
  final Function(DateTimeRange) onDueDateChanged;

  const ToDueDateFilter({
    required this.dueDateTo,
    required this.dueDateFilterDateRange,
    required this.onDueDateChanged,
    super.key,
  });

  @override
  State<ToDueDateFilter> createState() => _ToDueDateFilterState();
}

class _ToDueDateFilterState extends State<ToDueDateFilter> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.dueDateTo;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToDueDateFilter oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (oldWidget.dueDateTo != widget.dueDateTo) {
        _controller.text = widget.dueDateTo;
      }
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autocorrect: false,
        key: WidgetKeys.toDueDateField,
        onTap: () async {
          final dueDateRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
            initialDateRange: widget.dueDateFilterDateRange,
          );
          if (dueDateRange == null) return;
          widget.onDueDateChanged(dueDateRange);
        },
        readOnly: true,
        controller: _controller,
        decoration: InputDecoration(
          hintText: context.tr('Date to'),
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.darkGray,
              ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.calendar_month,
              size: 20,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(maxWidth: 25),
          focusedBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
        ),
      ),
    );
  }
}
