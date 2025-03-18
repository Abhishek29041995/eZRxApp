import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class PrivacyConsentRobot {
  final WidgetTester tester;

  PrivacyConsentRobot(this.tester);

  final page = find.byKey(WidgetKeys.privacyConsentPage);
  final automatedPersonalisation =
      find.byKey(WidgetKeys.automatedPersonalisationTile);
  final viaEmail = find.byKey(WidgetKeys.viaEmailTile);
  final viaPushNotification = find.byKey(WidgetKeys.viaPushNotificationTile);
  final viaSMS = find.byKey(WidgetKeys.viaSMSTile);
  final clearButton = find.byKey(WidgetKeys.privacyConsentClearButton);
  final submitButton = find.byKey(WidgetKeys.privacyConsentSubmitButton);

  void verifyPageContentVisible() {
    expect(page, findsOneWidget);
    _verifyCheckBoxesVisible();
    _verifyButtonVisible();
  }

  void _verifyCheckBoxesVisible() {
    expect(automatedPersonalisation, findsOneWidget);
    expect(viaEmail, findsOneWidget);
    expect(viaPushNotification, findsOneWidget);
    expect(viaSMS, findsOneWidget);
  }

  void _verifyButtonVisible() {
    expect(clearButton, findsOneWidget);
    expect(submitButton, findsOneWidget);
    // expect the initial state of submitButton is disabled when no changed
    _verifySubmitButtonDisabled();
  }

  Future<void> verifyCheckBoxesTap() async {
    await _verifyAutomatedCheckBoxTap();
    await _verifyViaEmailTap();
    await _verifyViaNotificationTap();
    await _verifyViaSMSTap();
    _verifySubmitButtonEnabled();
  }

  Future<void> _verifyAutomatedCheckBoxTap() async {
    expect(
      tester.widget<CheckboxListTile>(automatedPersonalisation).value,
      true,
    );
    await tester.tap(automatedPersonalisation);
    await tester.pumpAndSettle();
    expect(
      tester.widget<CheckboxListTile>(automatedPersonalisation).value,
      false,
    );
  }

  Future<void> _verifyViaEmailTap() async {
    expect(tester.widget<CheckboxListTile>(viaEmail).value, true);
    await tester.tap(viaEmail);
    await tester.pumpAndSettle();
    expect(tester.widget<CheckboxListTile>(viaEmail).value, false);
  }

  Future<void> _verifyViaNotificationTap() async {
    expect(tester.widget<CheckboxListTile>(viaPushNotification).value, true);
    await tester.tap(viaPushNotification);
    await tester.pumpAndSettle();
    expect(tester.widget<CheckboxListTile>(viaPushNotification).value, false);
  }

  Future<void> _verifyViaSMSTap() async {
    expect(tester.widget<CheckboxListTile>(viaSMS).value, true);
    await tester.tap(viaSMS);
    await tester.pumpAndSettle();
    expect(tester.widget<CheckboxListTile>(viaSMS).value, false);
  }

  void _verifySubmitButtonDisabled() {
    final buttonWidget = tester.widget<ButtonStyleButton>(submitButton);
    expect(buttonWidget.enabled, false);
  }

  void _verifySubmitButtonEnabled() {
    final buttonWidget = tester.widget<ButtonStyleButton>(submitButton);
    expect(buttonWidget.enabled, true);
  }

  Future<void> tapClearChangeButton() async {
    await tester.tap(clearButton);
    await tester.pumpAndSettle();
    _verifySubmitButtonDisabled();
    expect(
      tester.widget<CheckboxListTile>(automatedPersonalisation).value,
      true,
    );
    expect(tester.widget<CheckboxListTile>(viaEmail).value, true);
    expect(tester.widget<CheckboxListTile>(viaPushNotification).value, true);
    expect(tester.widget<CheckboxListTile>(viaSMS).value, true);
  }
}
