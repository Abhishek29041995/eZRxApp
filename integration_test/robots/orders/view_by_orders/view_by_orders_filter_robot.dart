import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByOrdersFilterRobot {
  final WidgetTester tester;

  ViewByOrdersFilterRobot(this.tester);

  final fromDateFilter = find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey);
  final toDateFilter = find.byKey(WidgetKeys.viewByOrdersFilterToDateKey);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);

  void verifyDefaultFilterApplied() {
    verifyDateRangeFilterApplied(
      fromDate: '',
      toDate: '',
    );
  }

  void verifyDateRangeFilterApplied({
    required String fromDate,
    required String toDate,
  }) {
    expect(
      find.descendant(of: fromDateFilter, matching: find.text(fromDate)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: fromDateFilter, matching: find.text(toDate)),
      findsOneWidget,
    );
  }

  void verifyOrderTypeFilter({bool isVisible = true}) {
    expect(
      find.byKey(WidgetKeys.filterRadioTile('All', true)),
      isVisible ? findsOne : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.filterRadioTile('ZP orders', false)),
      isVisible ? findsOne : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.filterRadioTile('MP orders', false)),
      isVisible ? findsOne : findsNothing,
    );
  }

  Future<void> tapOrderTypeFilter(String type) async {
    await tester.tap(find.byKey(WidgetKeys.filterRadioTile(type, false)));
    await tester.pumpAndSettle();
  }

  void verifyApplyButtonVisible() {
    expect(applyButton, findsOneWidget);
  }

  void verifyResetButtonVisible() {
    expect(resetButton, findsOneWidget);
  }

  Future<void> tapCloseIcon() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapFromDateField() async {
    await tester.tap(fromDateFilter);
    await tester.pump();
  }

  Future<void> tapToDateField() async {
    await tester.tap(toDateFilter);
    await tester.pump();
  }

  Future<void> tapApplyButton() async {
    await tester.tap(applyButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(find.widgetWithText(CheckboxListTile, name));
    await tester.pump();
  }

  void verifyStatusFilterValue(String name, bool value) {
    expect(
      find.byKey(WidgetKeys.statusFilter(name, value)),
      findsOneWidget,
    );
  }
}
