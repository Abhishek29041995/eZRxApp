import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ClaimManagementFilterRobot {
  final WidgetTester _tester;

  ClaimManagementFilterRobot(this._tester);

  //initialize Finder
  final Finder _resetButton = find.byKey(WidgetKeys.filterResetButton);
  final Finder _applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final Finder _filterPage = find.byKey(WidgetKeys.tempFilter);
  final String _p1Status = 'P1- Principal Deals';
  final String _p7Status = 'P7- Opening Support';

  //Robot Functions
  void verifyClaimFilter({bool isVisible = true}) {
    expect(_filterPage, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyDefaultFilterApplied() {
    verifyStatusFilter(_p1Status, false);
    verifyStatusFilter(_p7Status, false);
    _verifyResetButton();
    _verifyApplyButton();
  }

  void verifyStatusFilter(String data, bool value) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.genericKey(key: data) &&
            widget.value == value,
      ),
      findsOneWidget,
    );
  }

  Future<void> tapToChangeStatusCheckbox(String data) async {
    await _tester.tap(
      find.byWidgetPredicate(
        (widget) =>
            widget is CheckboxListTile &&
            widget.key == WidgetKeys.genericKey(key: data),
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
}
