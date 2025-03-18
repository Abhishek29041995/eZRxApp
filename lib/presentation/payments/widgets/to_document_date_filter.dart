import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ToDocumentDateFilter extends StatefulWidget {
  final String documentDateTo;
  final DateTimeRange documentDateFilterDateRange;
  final Function(DateTimeRange) onDocumentDateChanged;

  const ToDocumentDateFilter({
    required this.documentDateTo,
    required this.documentDateFilterDateRange,
    required this.onDocumentDateChanged,
    super.key,
  });

  @override
  State<ToDocumentDateFilter> createState() => _ToDocumentDateFilterState();
}

class _ToDocumentDateFilterState extends State<ToDocumentDateFilter> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.documentDateTo;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToDocumentDateFilter oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (oldWidget.documentDateTo != widget.documentDateTo) {
        _controller.text = widget.documentDateTo;
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
        key: WidgetKeys.toDocumentDateField,
        onTap: () async {
          final documentDateRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            initialDateRange: widget.documentDateFilterDateRange,
          );
          if (documentDateRange == null) return;
          widget.onDocumentDateChanged(documentDateRange);
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
