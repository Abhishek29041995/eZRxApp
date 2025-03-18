import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';
import '../../../common/extension.dart';

class AccountInvoiceFilterRobot extends CommonRobot {
  AccountInvoiceFilterRobot(super.tester);

  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final documentDateFrom = find.byKey(WidgetKeys.fromDocumentDateField);
  final documentDateTo = find.byKey(WidgetKeys.toDocumentDateField);
  final dueDateTo = find.byKey(WidgetKeys.toDueDateField);
  final dueDateFrom = find.byKey(WidgetKeys.fromDueDateField);
  final amountTo = find.byKey(WidgetKeys.amountValueTo);
  final amountFrom = find.byKey(WidgetKeys.amountValueFrom);

  final List<String> statusFilterOptions = [
    'Open',
    'In progress',
    'Overdue',
    'Cleared',
  ];

  void verifyDefaultFilterApplied() {
    verifyNoStatusFilterApplied();
    verifyDocumentDateRangeApplied(
      DateTime.now().subtract(const Duration(days: 90)).displayDate,
      DateTime.now().displayDate,
    );
    verifyDueDateRangeApplied('', '');
    verifyAmountRangeApplied('', '');
    verifyResetButton();
    verifyApplyButton();
  }

  void verifyNoStatusFilterApplied() {
    for (final option in statusFilterOptions) {
      verifyStatusFilterValue(option, false);
    }
  }

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(find.widgetWithText(CheckboxListTile, name.tr()));
    await tester.pump();
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

  Future<void> enterFromAmount(String text) async {
    await tester.tap(amountFrom);
    await tester.enterText(amountFrom, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterToAmount(String text) async {
    await tester.tap(amountTo);
    await tester.enterText(amountTo, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyAmountRangeApplied(String fromAmount, String toAmount) {
    expect(
      find.byWidgetPredicate(
        (widget) {
          return widget is TextFormField &&
              widget.key == WidgetKeys.amountValueFrom &&
              widget.initialValue == fromAmount;
        },
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextFormField &&
            widget.key == WidgetKeys.amountValueTo &&
            widget.initialValue == toAmount,
      ),
      findsOneWidget,
    );
  }

  void verifyInvalidAmountErrorVisible() {
    expect(find.byKey(WidgetKeys.amountRangeFilterError), findsOneWidget);
  }

  void verifyDocumentDateRangeApplied(String fromDate, String toDate) {
    expect(
      find.descendant(
        of: documentDateFrom,
        matching: find.text(fromDate),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: documentDateTo,
        matching: find.text(toDate),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapDocumentDateField() async {
    await tester.tap(documentDateFrom);
    await tester.pump();
  }

  void verifyDueDateRangeApplied(String fromDate, String toDate) {
    expect(
      find.descendant(
        of: dueDateFrom,
        matching: find.text(fromDate),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: dueDateTo,
        matching: find.text(toDate),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapDueDateField() async {
    await tester.tap(dueDateFrom);
    await tester.pump();
  }

  Future<void> tapCloseIcon() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  void verifyApplyButton() {
    expect(applyButton, findsOneWidget);
  }

  void verifyResetButton() {
    expect(resetButton, findsOneWidget);
  }

  Future<void> tapApplyButton() async {
    await tester.tap(applyButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }
}
