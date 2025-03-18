import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/extension.dart';

class AccountSummaryTabFilterRobot {
  final WidgetTester _tester;
  AccountSummaryTabFilterRobot(this._tester);

  final _applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final _resetButton = find.byKey(WidgetKeys.filterResetButton);
  final _documentDateFrom = find.byKey(WidgetKeys.fromDocumentDateField);
  final _documentDateTo = find.byKey(WidgetKeys.toDocumentDateField);
  final _dueDateTo = find.byKey(WidgetKeys.toDueDateField);
  final _dueDateFrom = find.byKey(WidgetKeys.fromDueDateField);
  final Finder _filterPage = find.byKey(WidgetKeys.tempFilter);

  final List<String> statusFilterOptions = [
    'Open',
    'In progress',
    'Overdue',
    'Cleared',
    'Outstanding',
  ];

  void verifyCreditsFilter({bool isVisible = true}) {
    expect(_filterPage, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyDefaultFilterApplied() {
    verifyNoStatusFilterApplied();
    verifyDocumentDateRangeApplied(
      DateTime.now().subtract(const Duration(days: 90)).displayDate,
      DateTime.now().displayDate,
    );
    verifyDueDateRangeApplied('', '');
    verifyResetButton();
    verifyApplyButton();
  }

  void verifyNoStatusFilterApplied() {
    for (final option in statusFilterOptions) {
      verifyStatusFilterValue(option, false);
    }
  }

  Future<void> tapStatusCheckbox(String name) async {
    await _tester.tap(find.widgetWithText(CheckboxListTile, name.tr()));
    await _tester.pump();
  }

  void verifyStatusFilterValue(String name, bool value) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.genericKey(key: name) &&
            widget.value == value,
      ),
      findsOneWidget,
    );
  }

  void verifyDocumentDateRangeApplied(String fromDate, String toDate) {
    expect(
      find.descendant(
        of: _documentDateFrom,
        matching: find.text(fromDate),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _documentDateTo,
        matching: find.text(toDate),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapDocumentDateField() async {
    await _tester.tap(_documentDateFrom);
    await _tester.pump();
  }

  void verifyDueDateRangeApplied(String fromDate, String toDate) {
    expect(
      find.descendant(
        of: _dueDateFrom,
        matching: find.text(fromDate),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _dueDateTo,
        matching: find.text(toDate),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapDueDateField() async {
    await _tester.tap(_dueDateFrom);
    await _tester.pump();
  }

  void verifyInvalidDateRangeError() {
    expect(find.text('Invalid range.'), findsOneWidget);
  }

  void verifyDateOutOfRangeRangeError() {
    expect(find.text('Out of range.'), findsOneWidget);
  }

  Future<void> tapCloseIcon() async {
    await _tester.tap(find.byKey(WidgetKeys.closeButton));
    await _tester.pumpAndSettle();
  }

  void verifyApplyButton() {
    expect(_applyButton, findsOneWidget);
  }

  void verifyResetButton() {
    expect(_resetButton, findsOneWidget);
  }

  Future<void> tapApplyButton() async {
    await _tester.tap(_applyButton);
    await _tester.pumpAndSettle();
  }

  Future<void> tapResetButton() async {
    await _tester.tap(_resetButton);
    await _tester.pumpAndSettle();
  }
}
