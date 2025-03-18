import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class PaymentSummaryFilterRobot {
  final WidgetTester tester;

  PaymentSummaryFilterRobot(this.tester);

  final fromDateFilter = find.byKey(WidgetKeys.fromDocumentDateField);
  final toDateFilter = find.byKey(WidgetKeys.toDocumentDateField);
  final fromAmountFilter = find.byKey(WidgetKeys.amountValueFrom);
  final toAmountFilter = find.byKey(WidgetKeys.amountValueTo);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final statusFilterOptions = [
    'In Progress',
    'Failed',
    'Processed',
    'Successful',
  ];
  final statusFilterOptionsForID = [
    'In Progress',
    'Expired',
    'Successful',
    'Cancelled',
  ];

  void verifyDefaultFilterApplied(
    List<String> statuses,
  ) {
    verifyRadioListTileFilter(statuses);
    verifyDateRangeFilterApplied(
      fromDate: DateTime.now().subtract(const Duration(days: 90)).displayDate,
      toDate: DateTime.now().displayDate,
    );
    verifyAmountRangeFilterApplied(
      fromAmount: '',
      toAmount: '',
    );
  }

  void verifyDefaultFilterAppliedForID() {
    verifyRadioListTileFilterForID();
    verifyDateRangeFilterApplied(
      fromDate: DateTime.now().subtract(const Duration(days: 90)).displayDate,
      toDate: DateTime.now().displayDate,
    );
    verifyAmountRangeFilterApplied(
      fromAmount: '',
      toAmount: '',
    );
  }

  void verifyRadioListTileFilter(List<String> statuses) {
    for (final option in statuses) {
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus(option)),
        findsOneWidget,
      );
    }
  }

  void verifyRadioListTileFilterForID() {
    for (final option in statusFilterOptionsForID) {
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus(option)),
        findsOneWidget,
      );
    }
  }

  Future<void> enterFromAmount(String text) async {
    await tester.tap(fromAmountFilter);
    await tester.pump();
    await tester.enterText(fromAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  Future<void> enterToAmount(String text) async {
    await tester.tap(toAmountFilter);
    await tester.pump();
    await tester.enterText(toAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  void verifyAmountRangeFilterApplied({
    required String fromAmount,
    required String toAmount,
  }) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.amountValueFrom),
        matching: find.text(fromAmount),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.amountValueTo),
        matching: find.text(toAmount),
      ),
      findsOneWidget,
    );
  }

  void verifyDateRangeFilterApplied({
    required String fromDate,
    required String toDate,
  }) {
    expect(
      find.descendant(
        of: fromDateFilter,
        matching: find.text(
          fromDate,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: toDateFilter,
        matching: find.text(
          toDate,
        ),
      ),
      findsOneWidget,
    );
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
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.paymentSummaryFilterStatus(name),
      ),
    );
    await tester.pump();
  }

  void verifyStatusFilterValue(String name) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.paymentSummaryFilterStatus(name) &&
            widget.value == true,
      ),
      findsOneWidget,
    );
  }
}
