import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class SecurityRobot extends CommonRobot {
  SecurityRobot(super.tester);

  final currentPasswordField = find.byKey(WidgetKeys.currentPasswordField);
  final newPasswordTextField = find.byKey(WidgetKeys.newPasswordTextField);
  final confirmPasswordField = find.byKey(WidgetKeys.confirmPasswordField);
  final clearChangeButton = find.byKey(WidgetKeys.cancelButton);
  final saveButton = find.byKey(WidgetKeys.changePasswordButton);

  void verifyAllItemVisible() {
    expect(currentPasswordField, findsOneWidget);
    expect(newPasswordTextField, findsOneWidget);
    expect(confirmPasswordField, findsOneWidget);
    expect(clearChangeButton, findsOneWidget);
    expect(saveButton, findsOneWidget);
  }

  void verifyAllFieldEmpty() {
    verifyValueCurrentPasswordField('');
    verifyValueNewPasswordTextField('');
    verifyValueConfirmPasswordField('');
  }

  Future<void> tapToBackToMoreScreen() async {
    await tester.tap(find.byKey(WidgetKeys.backButton));
    await tester.pumpAndSettle();
  }

  Finder _obscureIconInField(Finder ancestorFinder, bool isPasswordVisible) {
    return find.descendant(
      of: ancestorFinder,
      matching: find.byKey(WidgetKeys.obscureIcon(isPasswordVisible)),
    );
  }

  void verifyRequireErrorMsgCurrentPassword(bool status) {
    final statusFinder = status ? findsOneWidget : findsNothing;
    expect(
      _errorMessageField(
        currentPasswordField,
        'Current password cannot be empty',
      ),
      statusFinder,
    );
  }

  void verifyRequireErrorMsgNewPassword(bool status) {
    final statusFinder = status ? findsOneWidget : findsNothing;
    expect(
      _errorMessageField(newPasswordTextField, 'New password cannot be empty.'),
      statusFinder,
    );
  }

  void verifySameOldPasswordErrorMsg(bool status) {
    final statusFinder = status ? findsOneWidget : findsNothing;
    expect(
      _errorMessageField(
        newPasswordTextField,
        'New password cannot be same as old password',
      ),
      statusFinder,
    );
  }

  void verifyRequireErrorMsgConfirmPassword(bool status) {
    final statusFinder = status ? findsOneWidget : findsNothing;
    expect(
      _errorMessageField(
        confirmPasswordField,
        'Confirm password cannot be empty.',
      ),
      statusFinder,
    );
  }

  void verifyPasswordMismatchErrorMsg() {
    expect(
      _errorMessageField(
        confirmPasswordField,
        'Please make sure your passwords match',
      ),
      findsOneWidget,
    );
  }

  void verifyErrorMessageAllFieldRequire() {
    expect(
      find.byType(InfoLabel),
      findsOneWidget,
    );
    expect(
      (tester.widget(find.byType(InfoLabel)) as InfoLabel).textValue,
      'Please ensure all requirements are met for your new password.'.tr(),
    );
  }

  Finder _errorMessageField(Finder ancestorFinder, String errorMessage) {
    return find.descendant(
      of: ancestorFinder,
      matching: find.text(errorMessage.tr()),
    );
  }

  void verifyConditionValidationPasswordMinimumLength(bool status) {
    verifyConditionValidationPassword(
      'Minimum length of 10 characters',
      status,
    );
  }

  void verifyConditionValidationPasswordContainUppercase(bool status) {
    verifyConditionValidationPassword(
      'At least 1 Upper case character (A to Z)',
      status,
    );
  }

  void verifyConditionValidationPasswordContainLowercase(bool status) {
    verifyConditionValidationPassword(
      'At least 1 Lower case character (a to z)',
      status,
    );
  }

  void verifyConditionValidationPasswordContainNumeric(bool status) {
    verifyConditionValidationPassword(
      'At least a numeric character (0 to 9)',
      status,
    );
  }

  void verifyConditionValidationPasswordContainSpecialCharacter(bool status) {
    verifyConditionValidationPassword(
      'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
      status,
    );
  }

  void
      verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
    bool status,
  ) {
    verifyConditionValidationPassword(
      'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
      status,
    );
  }

  void verifyConditionValidationPassword(String text, bool status) {
    expect(
      ((tester.widget<Text>(find.text(text.tr()))).style)?.color,
      status ? ZPColors.passwordValidationsColor : ZPColors.red,
    );
  }

  Future<void> fillToCurrentPasswordField(String currentPassword) async {
    await tester.tap(currentPasswordField);
    await tester.pump();
    await tester.enterText(currentPasswordField, currentPassword);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Durations.long2);
  }

  Future<void> fillToNewPasswordField(String password) async {
    await tester.tap(newPasswordTextField);
    await tester.pump();
    await tester.enterText(newPasswordTextField, password);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Durations.long2);
  }

  Future<void> tapToConfirmPasswordField() async {
    await tester.tap(confirmPasswordField);
    await tester.pumpAndSettle();
  }

  Future<void> fillToConfirmPasswordField(String password) async {
    await tester.tap(confirmPasswordField);
    await tester.pump();
    await tester.enterText(confirmPasswordField, password);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Durations.long2);
  }

  Future<void> tapToSaveButton() async {
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapToClearChangeButton() async {
    await tester.tap(clearChangeButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapToObscureIconInCurrentPasswordField(
    bool isPasswordVisible,
  ) async {
    await tester
        .tap(_obscureIconInField(currentPasswordField, !isPasswordVisible));
    await tester.pumpAndSettle();
  }

  Future<void> tapToObscureIconInNewPasswordField(
    bool isPasswordVisible,
  ) async {
    await tester
        .tap(_obscureIconInField(newPasswordTextField, !isPasswordVisible));
    await tester.pumpAndSettle();
  }

  Future<void> tapToObscureIconInConfirmPasswordField(
    bool isPasswordVisible,
  ) async {
    await tester
        .tap(_obscureIconInField(confirmPasswordField, !isPasswordVisible));
    await tester.pumpAndSettle();
  }

  void verifyValueCurrentPasswordField(String password) {
    expect(_getValueTextFormField(currentPasswordField), password);
  }

  void verifyValueNewPasswordTextField(String password) {
    expect(_getValueTextFormField(newPasswordTextField), password);
  }

  void verifyValueConfirmPasswordField(String password) {
    expect(_getValueTextFormField(confirmPasswordField), password);
  }

  void verifyObscureTextCurrentPassword(bool status) {
    expect(_getStatusObscureTextFormField(currentPasswordField), status);
  }

  void verifyObscureTextNewPassword(bool status) {
    expect(_getStatusObscureTextFormField(newPasswordTextField), status);
  }

  void verifyObscureTextConfirmPassword(bool status) {
    expect(_getStatusObscureTextFormField(confirmPasswordField), status);
  }

  String _getValueTextFormField(Finder finder) {
    final editableText = find.descendant(
      of: finder,
      matching: find.byType(EditableText),
    );
    return tester.widget<EditableText>(editableText).controller.text;
  }

  bool _getStatusObscureTextFormField(Finder finder) {
    final editableText = find.descendant(
      of: finder,
      matching: find.byType(EditableText),
    );
    return tester.widget<EditableText>(editableText).obscureText;
  }
}
