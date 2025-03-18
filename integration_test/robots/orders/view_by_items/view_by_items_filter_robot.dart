import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ViewByItemsFilterRobot extends CommonRobot {
  ViewByItemsFilterRobot(super.tester);

  final fromDateFilter = find.byKey(WidgetKeys.viewByItemsFilterFromDateKey);
  final toDateFilter = find.byKey(WidgetKeys.viewByItemsFilterToDateKey);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final statusFilterOptions = [
    'Order created',
    'Pending',
    'Order packed and ready for delivery',
    'Picking in progress',
    'Out for delivery',
    'Delivered',
    'Cancelled',
    'Failed',
  ];

  void verifyDefaultFilterApplied() {
    verifyNoStatusFilterApplied();
    verifyDateRangeFilterApplied('', '');
  }

  void verifyNoStatusFilterApplied() {
    for (final option in statusFilterOptions) {
      expect(
        find.byKey(WidgetKeys.viewByItemsFilterStatusKey(option, true)),
        findsNothing,
      );
    }
  }

  void verifyDateRangeFilterApplied(String fromDate, String toDate) {
    expect(
      find.descendant(of: fromDateFilter, matching: find.text(fromDate)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: toDateFilter, matching: find.text(toDate)),
      findsOneWidget,
    );
  }

  void verifyOrderTypeFilter({bool isVisible = true}) {
    expect(
      find.byKey(WidgetKeys.filterRadioTile('All', true)),
      isVisible ? findsOne : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.filterRadioTile('ZP items', false)),
      isVisible ? findsOne : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
      isVisible ? findsOne : findsNothing,
    );
  }

  Future<void> tapOrderTypeFilter(String type) async {
    await tester.tap(find.byKey(WidgetKeys.filterRadioTile(type, false)));
    await tester.pumpAndSettle();
  }

  void verifyApplyButton() {
    expect(applyButton, findsOneWidget);
  }

  void verifyResetButton() {
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
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapStatusCheckbox(String name) async {
    final widget = find.widgetWithText(CheckboxListTile, name);
    await scrollEnsureFinderVisible(widget);
    await tester.tap(widget);
    await tester.pump();
  }

  void verifyStatusFilterValue(String name, bool value) {
    expect(
      find.byKey(WidgetKeys.viewByItemsFilterStatusKey(name, value)),
      findsOneWidget,
    );
  }
}
