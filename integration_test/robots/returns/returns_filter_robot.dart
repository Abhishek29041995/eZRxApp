import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class ReturnsFilterRobot {
  final WidgetTester tester;

  ReturnsFilterRobot(this.tester);

  abstract final List<String> statusFilterOptions;
  final fromDateFilter = find.byKey(WidgetKeys.fromReturnDateField);
  final toDateFilter = find.byKey(WidgetKeys.toReturnDateField);
  final fromAmountFilter = find.byKey(WidgetKeys.amountValueFrom);
  final toAmountFilter = find.byKey(WidgetKeys.amountValueTo);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);

  void verifyDefaultFilterApplied() {
    verifyNoStatusFilterApplied();
    verifyDateRangeFilterApplied(
      fromDate: '',
      toDate: '',
    );
    verifyAmountRangeFilterApplied(
      fromAmount: '',
      toAmount: '',
    );
  }

  void verifyNoStatusFilterApplied() {
    for (final option in statusFilterOptions) {
      expect(
        find.byKey(WidgetKeys.returnStatusFilter(option, true)),
        findsNothing,
      );
    }
  }

  void verifyReturnTypeFilter({bool isVisible = true}) {
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

  Future<void> tapReturnTypeFilter(String type) async {
    await tester.tap(find.byKey(WidgetKeys.filterRadioTile(type, false)));
    await tester.pumpAndSettle();
  }

  Future<void> enterFromAmount(String text) async {
    await tester.tap(fromAmountFilter);
    await tester.pump();
    await tester.enterText(fromAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Durations.long2);
  }

  Future<void> enterToAmount(String text) async {
    await tester.tap(toAmountFilter);
    await tester.pump();
    await tester.enterText(toAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Durations.long2);
    await tapToAmount();
  }

  Future<void> tapToAmount() async {
    await tester.tap(toAmountFilter);
    await tester.pumpAndSettle();
  }

  void verifyAmountRangeFilterApplied({
    required String fromAmount,
    required String toAmount,
  }) {
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
    expect(find.text('Invalid Amount range!'.tr()), findsOneWidget);
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
      find.descendant(of: toDateFilter, matching: find.text(toDate)),
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
    await tester.pumpAndSettle();
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(find.widgetWithText(CheckboxListTile, name.tr()));
    await tester.pump();
  }

  void verifyStatusFilterValue(String name, bool value) {
    expect(
      find.byKey(WidgetKeys.returnStatusFilter(name.tr(), value)),
      findsOneWidget,
    );
  }
}
