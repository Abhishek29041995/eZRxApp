import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ContactUsRobot extends CommonRobot {
  ContactUsRobot(super.tester);

  final scrollView = find.byKey(WidgetKeys.scrollList);
  final userNameKey = find.byKey(WidgetKeys.userNameKey);
  final phoneNumberKey = find.byKey(WidgetKeys.phoneNumberKey);
  final emailKey = find.byKey(WidgetKeys.emailKey);
  final contactMessageKey = find.byKey(WidgetKeys.contactMessageKey);
  final sendMessageButtonKey = find.byKey(WidgetKeys.sendMessageButtonKey);

  Future<void> enterUserNameField(String name) async {
    await scrollEnsureFinderVisible(userNameKey);
    await _enterText(userNameKey, name);
  }

  Future<void> enterPhoneNumberField(String phoneNumber) async {
    await scrollEnsureFinderVisible(phoneNumberKey);
    await _enterText(phoneNumberKey, phoneNumber);
  }

  Future<void> enterEmailField(String email) async {
    await scrollEnsureFinderVisible(emailKey);
    await _enterText(emailKey, email);
  }

  Future<void> enterMessageField(String message) async {
    await scrollEnsureFinderVisible(contactMessageKey);
    await _enterText(contactMessageKey, message);
  }

  Future<void> tapToSendMessage() async {
    await scrollEnsureFinderVisible(sendMessageButtonKey);
    await tester.pumpAndSettle();
    await tester.tap(sendMessageButtonKey);
    await tester.pumpAndSettle();
  }

  void verifyContactDetailHtml() {
    expect(
      find.byKey(WidgetKeys.contactDetailsSectionKey),
      findsOneWidget,
    );
  }

  void verifyAllFieldVisible() {
    expect(userNameKey, findsOneWidget);
    expect(phoneNumberKey, findsOneWidget);
    expect(emailKey, findsOneWidget);
    expect(contactMessageKey, findsOneWidget);
    expect(sendMessageButtonKey, sendMessageButtonKey);
  }

  void verifyInitValueField({required String userName, required String email}) {
    expect(_getValueTextFormField(userNameKey), userName);
    expect(_getValueTextFormField(emailKey), email);
  }

  String _getValueTextFormField(Finder finder) {
    final editableText = find.descendant(
      of: finder,
      matching: find.byType(EditableText),
    );

    return tester.widget<EditableText>(editableText).controller.text;
  }

  void verifyUserNameRequireErrorMsg() {
    expect(
      _errorMessageField(userNameKey, 'Name is required.'),
      findsOneWidget,
    );
  }

  void verifyPhoneNumberInValidErrorMsg() {
    expect(
      _errorMessageField(phoneNumberKey, 'Enter a valid contact number.'),
      findsOneWidget,
    );
  }

  void verifyEmailInValidErrorMsg() {
    expect(
      _errorMessageField(emailKey, 'Enter a valid email address.'),
      findsOneWidget,
    );
  }

  void verifyEmailRequireErrorMsg() {
    expect(
      _errorMessageField(emailKey, 'Email is required.'),
      findsOneWidget,
    );
  }

  void verifyMessageFieldRequireErrorMsg() {
    expect(
      _errorMessageField(contactMessageKey, 'Message is required.'),
      findsOneWidget,
    );
  }

  void verifyContactUsSuccessMessage() =>
      verifyCustomSnackBar(message: 'Message has been received.'.tr());

  Finder _errorMessageField(Finder ancestorFinder, String errorMessage) {
    return find.descendant(
      of: ancestorFinder,
      matching: find.text(errorMessage.tr()),
    );
  }

  Future<void> _enterText(Finder target, String text) async {
    await tester.tap(target);
    await tester.pumpAndSettle();
    await tester.enterText(target, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }
}
