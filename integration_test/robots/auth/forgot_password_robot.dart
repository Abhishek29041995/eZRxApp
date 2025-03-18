import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class ForgotPasswordRobot {
  final WidgetTester tester;

  ForgotPasswordRobot(this.tester);

  final backToLoginButton = find.byKey(WidgetKeys.loginSubmitButton);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final forgotUsernameField = find.byKey(WidgetKeys.forgotUsernameField);

  void verifyBackToLoginButton() {
    expect(backToLoginButton, findsOneWidget);
  }

  Future<void> tapToBackToLogin() async {
    await tester.tap(backToLoginButton);
    await tester.pumpAndSettle();
  }

  void verifyNextButton() {
    expect(nextButton, findsOneWidget);
  }

  Future<void> tapToNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyForgotUsernameField() {
    expect(forgotUsernameField, findsOneWidget);
  }

  Future<void> enterTextToUsernameField(String username) async {
    await tester.tap(forgotUsernameField);
    await tester.enterText(forgotUsernameField, username);
    await tester.pump();
  }

  void verifyErrorMessageWithInvalidUsername() {
    final incorrectUsername = find.text('Incorrect username'.tr());
    expect(incorrectUsername, findsOneWidget);
  }

  void verifyMessageSentEmail() {
    final emailSendToYou = find.text('Email sent to you!'.tr());
    expect(emailSendToYou, findsOneWidget);
  }
}
