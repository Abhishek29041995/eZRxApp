import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/extension.dart';

class AccountCreditsFilterRobot {
  final WidgetTester _tester;

  AccountCreditsFilterRobot(this._tester);

  //initialize Finder
  final Finder _fromDocumentDate = find.byKey(WidgetKeys.fromDocumentDateField);
  final Finder _toDocumentDate = find.byKey(WidgetKeys.toDocumentDateField);
  final Finder _fromAmountValue = find.byKey(WidgetKeys.amountValueFrom);
  final Finder _toAmountValue = find.byKey(WidgetKeys.amountValueTo);
  final Finder _resetButton = find.byKey(WidgetKeys.filterResetButton);
  final Finder _applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final Finder _filterPage = find.byKey(WidgetKeys.tempFilter);
  final String _openStatus = 'Open';
  final String _clearStatus = 'Cleared';

  //Robot Functions
  void verifyCreditsFilter({bool isVisible = true}) {
    expect(_filterPage, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyDefaultFilterApplied() {
    verifyDateRangeFilterApplied(
      fromDate: DateTime.now().subtract(const Duration(days: 90)).displayDate,
      toDate: DateTime.now().displayDate,
    );
    verifyAmountRangeFilterApplied(fromAmount: '', toAmount: '');
    verifyStatusFilter(_openStatus, false);
    verifyStatusFilter(_clearStatus, false);
    _verifyResetButton();
    _verifyApplyButton();
  }

  void verifyDefaultFilterAppliedForID() {
    verifyDateRangeFilterApplied(
      fromDate: DateTime.now().subtract(const Duration(days: 90)).displayDate,
      toDate: DateTime.now().displayDate,
    );
    verifyAmountRangeFilterApplied(fromAmount: '', toAmount: '');
    _verifyResetButton();
    _verifyApplyButton();
  }

  void verifyDateRangeFilterApplied({
    required String fromDate,
    required String toDate,
  }) {
    expect(
      find.descendant(
        of: _fromDocumentDate,
        matching: find.text(fromDate),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _toDocumentDate,
        matching: find.text(toDate),
      ),
      findsOneWidget,
    );
  }

  void verifyAmountRangeFilterApplied({
    required String fromAmount,
    required String toAmount,
  }) {
    expect(
      find.descendant(
        of: _fromAmountValue,
        matching: find.text(
          fromAmount,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _toAmountValue,
        matching: find.text(
          toAmount,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyStatusFilter(String name, bool value) {
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

  Future<void> tapToChangeStatusCheckbox(String name) async {
    await _tester.tap(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.genericKey(key: name),
      ),
    );
    await _tester.pump();
  }

  void _verifyResetButton() {
    expect(_resetButton, findsOneWidget);
  }

  Future<void> tapResetButton() async {
    await _tester.tap(_resetButton);
    await _tester.pumpAndSettle();
  }

  void _verifyApplyButton() {
    expect(_applyButton, findsOneWidget);
  }

  Future<void> tapApplyButton() async {
    await _tester.tap(_applyButton);
    await _tester.pumpAndSettle();
  }

  Future<void> tapCloseButton() async {
    await _tester.tap(find.byKey(WidgetKeys.closeButton));
    await _tester.pumpAndSettle();
  }

  Future<void> tapFromDateField() async {
    await _tester.tap(_fromDocumentDate);
    await _tester.pump();
  }

  void verifyInvalidDateRangeError() {
    expect(find.text('Invalid range.'), findsOneWidget);
  }

  Future<void> enterFromAmount(String text) async {
    await _tester.tap(_fromAmountValue);
    await _tester.enterText(_fromAmountValue, text);
    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pumpAndSettle(Durations.medium2);
  }

  Future<void> enterToAmount(String text) async {
    await _tester.tap(_toAmountValue);
    await _tester.enterText(_toAmountValue, text);
    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pumpAndSettle(Durations.medium4);
  }

  void verifyInvalidAmountError() {
    expect(
      find.text('${'Invalid'.tr()} ${'Amount'.tr()} ${'range'.tr()}!'),
      findsOneWidget,
    );
  }
}
