import 'package:ezrxmobile/presentation/aup_tc/aup_tc_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class AupTCRobot extends CommonRobot {
  AupTCRobot(super.tester);

  final page = find.byType(AupTCPage);
  final tncContent = find.byKey(WidgetKeys.tncContentBox);
  final tncCheckBox = find.byKey(WidgetKeys.tncCheckBox);
  final privacyContent = find.byKey(WidgetKeys.privacyContentBox);
  final privacyCheckBox = find.byKey(WidgetKeys.privacyCheckBox);
  final acceptButton = find.byKey(WidgetKeys.tncDialogAcceptButton);
  final declineButton = find.byKey(WidgetKeys.tncDialogCancelButton);

  void verifyPage({bool isVisible = true}) =>
      expect(page, isVisible ? findsOneWidget : findsNothing);

  bool get isPageVisible => page.evaluate().isNotEmpty;

  Future<void> acceptTnC() async {
    if (!isPageVisible) return;
    await tapPrivacyCheckBox();
    await tapTnCCheckBox();
    await tapAcceptButton();
  }

  void verifyDefaultComponents() {
    expect(tncContent, findsOneWidget);
    expect(privacyContent, findsOneWidget);
    expect(tncCheckBox, findsOneWidget);
    expect(tester.widget<CheckboxListTile>(tncCheckBox).value, false);
    expect(privacyCheckBox, findsOneWidget);
    expect(tester.widget<CheckboxListTile>(privacyCheckBox).value, false);
    expect(acceptButton, findsOneWidget);
    expect(declineButton, findsOneWidget);
  }

  void verifyConsentAllWarning() {
    expect(find.byKey(WidgetKeys.consentAllWarningMessage), findsOneWidget);
  }

  Future<void> tapAcceptButton() async {
    await tester.tap(acceptButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapDeclineButton() async {
    await tester.tap(declineButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapPrivacyCheckBox() async {
    await tester.tap(privacyCheckBox);
    await tester.pumpAndSettle();
  }

  Future<void> tapTnCCheckBox() async {
    await tester.tap(tncCheckBox);
    await tester.pumpAndSettle();
  }
}
