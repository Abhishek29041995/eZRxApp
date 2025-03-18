import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// three dates (initial, first and last) are required
/// initialDate: initial date from which you want to start
///               should be in bewtween firstDate and lastDate
/// firstDate: date from which you want to start
///             should not be before lastDate
/// lastDate: date where you want to stop
///
Future<DateTime?> showMonthPicker({
  required BuildContext context,
  required DateTime initialDate,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return _MonthPicker(
        key: WidgetKeys.monthPickerKey,
        initialDate: initialDate,
      );
    },
  );
}

class _MonthPicker extends StatefulWidget {
  final DateTime initialDate;

  const _MonthPicker({
    super.key,
    required this.initialDate,
  });

  @override
  State<_MonthPicker> createState() => __MonthPickerState();
}

class __MonthPickerState extends State<_MonthPicker> {
  final _pageViewKey = GlobalKey();
  late final PageController _pageController;
  late int _displayedPage;
  late DateTime _selectedDate;
  bool _isYearSelection = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime(widget.initialDate.year, widget.initialDate.month);
    _displayedPage = _selectedDate.year;
    _pageController = PageController(initialPage: _displayedPage);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 220,
            width: 300,
            child: PageView.builder(
              key: _pageViewKey,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) => setState(() => _displayedPage = index),
              pageSnapping: !_isYearSelection,
              itemBuilder: (context, page) {
                return GridView.count(
                  crossAxisCount: 4,
                  padding: const EdgeInsets.all(12.0),
                  physics: const NeverScrollableScrollPhysics(),
                  children: _isYearSelection
                      ? List<int>.generate(12, (i) => page * 12 + i)
                          .map(
                            (year) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: _getYearButton(year, theme.colorScheme),
                            ),
                          )
                          .toList()
                      : List<int>.generate(12, (i) => i + 1)
                          .map((month) => DateTime(page, month))
                          .map(
                            (date) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: _getMonthButton(date, theme.colorScheme),
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 24.0),
          _ButtonBar(
            selectedDate: _selectedDate,
          ),
        ],
      ),
    );

    return Dialog(
      backgroundColor: ZPColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              return MediaQuery.of(context).orientation == Orientation.portrait
                  ? IntrinsicWidth(
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: _Header(
                              displayedPage: _displayedPage,
                              isYearSelection: _isYearSelection,
                              pageController: _pageController,
                              selectedDate: _selectedDate,
                              yearSelectionChange: () =>
                                  setState(() => _isYearSelection = true),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          content,
                        ],
                      ),
                    )
                  : IntrinsicHeight(
                      child: Row(
                        children: [
                          _Header(
                            displayedPage: _displayedPage,
                            isYearSelection: _isYearSelection,
                            pageController: _pageController,
                            selectedDate: _selectedDate,
                            yearSelectionChange: () =>
                                setState(() => _isYearSelection = true),
                          ),
                          const SizedBox(width: 8.0),
                          content,
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  TextButton _getYearButton(int year, ColorScheme colorScheme) {
    final isSelected = year == _selectedDate.year;

    return TextButton(
      onPressed: () => setState(
        () {
          _pageController.jumpToPage(year);
          setState(() => _isYearSelection = false);
        },
      ),
      style: TextButton.styleFrom(
        foregroundColor: isSelected
            ? ZPColors.white
            : year == DateTime.now().year
                ? ZPColors.primary
                : colorScheme.onSurface.withOpacity(0.8),
        backgroundColor: isSelected ? ZPColors.primary : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        DateFormat.y().format(DateTime(year)),
      ),
    );
  }

  TextButton _getMonthButton(DateTime date, ColorScheme colorScheme) {
    final isSelected =
        date.month == _selectedDate.month && date.year == _selectedDate.year;

    void callback() =>
        setState(() => _selectedDate = DateTime(date.year, date.month));

    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
        foregroundColor: isSelected
            ? ZPColors.white
            : date.month == DateTime.now().month
                ? colorScheme.primary
                : colorScheme.onSurface.withOpacity(0.8),
        backgroundColor: isSelected ? colorScheme.primary : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        DateFormat.MMM().format(date).toUpperCase(),
      ),
    );
  }
}

class _ButtonBar extends StatelessWidget {
  final DateTime selectedDate;
  const _ButtonBar({
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return ButtonTheme(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text(localizations.cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, selectedDate),
            child: Text(localizations.okButtonLabel),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final DateTime selectedDate;
  final PageController pageController;
  final bool isYearSelection;
  final VoidCallback yearSelectionChange;
  final int displayedPage;
  const _Header({
    required this.selectedDate,
    required this.pageController,
    required this.isYearSelection,
    required this.yearSelectionChange,
    required this.displayedPage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: ZPColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Text(
                DateFormat.yMMM().format(selectedDate),
                style: theme.primaryTextTheme.titleMedium
                    ?.copyWith(color: ZPColors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: theme.primaryIconTheme.color,
                  ),
                  onPressed: () => pageController.animateToPage(
                    displayedPage - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  ),
                ),
                DefaultTextStyle(
                  style: theme.primaryTextTheme.headlineSmall!
                      .copyWith(color: ZPColors.white),
                  child: (isYearSelection)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat.y().format(
                                DateTime(displayedPage * 12),
                              ),
                            ),
                            const Text(' - '),
                            Text(
                              DateFormat.y().format(
                                DateTime(displayedPage * 12 + 11),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            yearSelectionChange();
                            pageController.jumpToPage(displayedPage ~/ 12);
                          },
                          child: Text(
                            DateFormat.y().format(DateTime(displayedPage)),
                          ),
                        ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: theme.primaryIconTheme.color,
                  ),
                  onPressed: () => pageController.animateToPage(
                    displayedPage + 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
