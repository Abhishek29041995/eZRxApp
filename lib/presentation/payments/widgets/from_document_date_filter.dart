import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FromDocumentDateFilter extends StatefulWidget {
  final String documentDateFrom;
  final DateTimeRange documentDateFilterDateRange;
  final Function(DateTimeRange) onDocumentDateChanged;

  const FromDocumentDateFilter({
    required this.documentDateFrom,
    required this.documentDateFilterDateRange,
    required this.onDocumentDateChanged,
    super.key,
  });

  @override
  State<FromDocumentDateFilter> createState() => _FromDocumentDateFilterState();
}

class _FromDocumentDateFilterState extends State<FromDocumentDateFilter> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.documentDateFrom;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FromDocumentDateFilter oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (oldWidget.documentDateFrom != widget.documentDateFrom) {
        _controller.text = widget.documentDateFrom;
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
        key: WidgetKeys.fromDocumentDateField,
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
          hintText: context.tr('Date from'),
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
