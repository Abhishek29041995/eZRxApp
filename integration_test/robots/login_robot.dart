import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common/common_robot.dart';
import 'common/extension.dart';

class LoginRobot extends CommonRobot {
  LoginRobot(super.tester);
  final loginPage = find.byKey(WidgetKeys.loginMobileScreen);
  final rememberMeCheckbox =
      find.byKey(WidgetKeys.loginRememberPasswordCheckbox);
  final forgotPasswordLink = find.byKey(WidgetKeys.forgotPasswordButton);
  final marketSelector = find.byKey(WidgetKeys.appMarketSelector);
  final loginUsernameField = find.byKey(WidgetKeys.loginUsernameField);
  final loginPasswordField = find.byKey(WidgetKeys.loginPasswordField);
  final loginSubmitButton = find.byKey(WidgetKeys.loginSubmitButton);
  final skipIntroButton = find.byKey(WidgetKeys.introSkipButton);
  final introGetStartedButton = find.byKey(WidgetKeys.introGetStartedButton);
  final signUp = find.byKey(WidgetKeys.createAccountButton);
  final loginWithSSO = find.byKey(WidgetKeys.ssoLoginButton);
  final closeAnnouncementBanner =
      find.byKey(WidgetKeys.closeAnnouncementBanner);

  Future<void> loginToHomeScreen(
    String username,
    String password,
    String market,
  ) async {
    await tapToCloseAnnouncementBanner();
    //select market
    await findMarketSelector();
    await tapToMarketSelector();
    await selectMarket(market);

    //login
    await login(username, password);
    await skipIntroIfHas();
  }

  Future<void> skipIntroIfHas() async {
    await tester.pumpUntilVisible(
      find.byType(IntroPage),
      maxIteration: 5,
    );
    while (introGetStartedButton.evaluate().isNotEmpty) {
      await tapIntroGetStartedButton();
    }
  }

  Future<void> login(String username, String password) async {
    await tapToCloseAnnouncementBanner();
    await findUsernameField();
    await tester.enterText(loginUsernameField, username);
    await findPasswordField();
    await tester.enterText(loginPasswordField, password);
    await findSubmitButton();

    expect(loginSubmitButton, findsOneWidget);
    await tester.tap(loginSubmitButton);
    await tester.pumpAndSettle();
  }

  Future<void> findUsernameField() async {
    await scrollEnsureFinderVisible(loginUsernameField);
    expect(loginUsernameField, findsOneWidget);
  }

  Future<void> findPasswordField() async {
    await scrollEnsureFinderVisible(loginPasswordField);
    expect(loginPasswordField, findsOneWidget);
  }

  Future<void> findSubmitButton() async {
    await scrollEnsureFinderVisible(loginSubmitButton);
    expect(loginSubmitButton, findsOneWidget);
  }

  Future<void> findRememberMeCheckbox() async {
    await scrollEnsureFinderVisible(rememberMeCheckbox);
    expect(rememberMeCheckbox, findsOneWidget);
  }

  Future<void> verifyRememberMeCheckboxUnchecked() async {
    await scrollEnsureFinderVisible(rememberMeCheckbox);
    final checkbox = tester.firstWidget<Checkbox>(rememberMeCheckbox);
    expect(checkbox.value, false);
  }

  Future<void> tapToRememberMe() async {
    await scrollEnsureFinderVisible(rememberMeCheckbox);
    await tester.tap(rememberMeCheckbox);
    await tester.pumpAndSettle();
  }

  Future<void> findForgotPasswordLink() async {
    await scrollEnsureFinderVisible(forgotPasswordLink);
    expect(forgotPasswordLink, findsOneWidget);
  }

  Future<void> tapToForgotPassword() async {
    await scrollEnsureFinderVisible(forgotPasswordLink);
    await tester.tap(forgotPasswordLink);
    await tester.pumpAndSettle();
  }

  Future<void> findMarketSelector() async {
    await scrollEnsureFinderVisible(marketSelector);
    expect(marketSelector, findsOneWidget);
  }

  void findSkipIntroButton() {
    expect(skipIntroButton, findsOneWidget);
  }

  Future<void> tapSkipIntroButton() async {
    await tester.tap(skipIntroButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void findIntroGetStartedButton() {
    expect(introGetStartedButton, findsOneWidget);
  }

  Future<void> tapIntroGetStartedButton() async {
    await tester.tap(introGetStartedButton.last);
    await tester.pumpAndSettle();
  }

  void verifyDefaultValueSelector(String marketValue) {
    final dropdownItemValue = find.text(marketValue).last;
    expect(dropdownItemValue, findsOneWidget);
  }

  Future<void> verifyDefaultUsernameField() async {
    await scrollEnsureFinderVisible(loginUsernameField);
    final inputUsername = tester.widget<TextFormField>(loginUsernameField);
    expect(inputUsername.initialValue, isEmpty);
  }

  Future<void> verifyDefaultPasswordField() async {
    await scrollEnsureFinderVisible(loginPasswordField);
    final inputPassword = tester.widget<TextFormField>(loginPasswordField);
    expect(inputPassword.initialValue, isEmpty);
  }

  Future<void> tapToMarketSelector() async {
    await scrollEnsureFinderVisible(marketSelector);
    await tester.tap(marketSelector);
    await tester.pumpAndSettle();
  }

  Future<void> selectMarket(String market) async {
    final dropdownItemToSelect = find.text(market).last;
    await scrollEnsureFinderVisible(dropdownItemToSelect);
    await tester.tap(dropdownItemToSelect);
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await tester.pumpAndSettle();
  }

  Future<void> verifySelectedMarket(String market) async {
    await scrollEnsureFinderVisible(marketSelector);
    expect(find.text(market).last, findsOneWidget);
  }

  void verifyErrorMessageWithoutPassword() {
    final userNameCannotEmpty = find.text('Password cannot be empty.'.tr());
    expect(userNameCannotEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithoutUsername() {
    final usernameCannotBeEmpty = find.text('Username cannot be empty.'.tr());
    expect(usernameCannotBeEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithInvalidUsernameOrPassword() {
    final incorrectUsername = find.text('Invalid username or password'.tr());
    expect(incorrectUsername, findsOneWidget);
  }

  Future<void> findSignUpLink({bool isVisible = true}) async {
    if (isVisible) {
      await scrollEnsureFinderVisible(loginWithSSO);
    }
    expect(signUp, isVisible ? findsOneWidget : findsNothing);
  }

  Future<void> findLoginWithSSOButton({bool isVisible = true}) async {
    if (isVisible) {
      await scrollEnsureFinderVisible(loginWithSSO);
    }
    expect(loginWithSSO, isVisible ? findsOneWidget : findsNothing);
  }

  Future<void> findAnnouncementBanner(String market) async {
    final announcementBanner = find.byKey(WidgetKeys.announcementBanner);
    await scrollEnsureFinderVisible(announcementBanner.first);
    expect(announcementBanner, findsAtLeastNWidgets(1));
    // TODO: handle another market here if needed
  }

  Future<void> tapToCloseAnnouncementBanner() async {
    var closeButtonFinder = find.byKey(WidgetKeys.closeAnnouncementBanner);

    await tester.pump(const Duration(seconds: 1));
    while (closeButtonFinder.evaluate().isNotEmpty) {
      await tester.ensureVisible(closeButtonFinder.first);
      await tester.tap(closeButtonFinder.first);
      await tester.pumpAndSettle(Durations.long3);
      closeButtonFinder = find.byKey(WidgetKeys.closeAnnouncementBanner);
    }
    final announcementBanner = find.byKey(WidgetKeys.announcementBanner);
    if (announcementBanner.evaluate().isNotEmpty &&
        find.byKey(WidgetKeys.closeAnnouncementBanner).evaluate().isEmpty) {
      await scrollEnsureFinderVisible(announcementBanner.last);
    }
  }

  bool get isLoginPage => loginPage.evaluate().isNotEmpty;
}
