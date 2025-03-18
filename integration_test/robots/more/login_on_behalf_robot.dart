import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginOnBehalfRobot {
  final WidgetTester _tester;

  LoginOnBehalfRobot(this._tester);

  void verifySheet() {
    expect(find.byKey(WidgetKeys.proxyLoginSheet), findsOneWidget);
  }

  void verifyErrorMessageUsernameCannotBeEmpty() {
    final usernameCannotBeEmpty = find.text('Username cannot be empty.'.tr());
    expect(usernameCannotBeEmpty, findsOneWidget);
  }

  Future<void> enterUserNameField(String proxyUserName) async {
    await _tester.enterText(
      find.byKey(WidgetKeys.proxyLoginUserNameField),
      proxyUserName,
    );
    await _tester.pumpAndSettle();
  }

  Future<void> tapLoginButton() async {
    await _tester.tap(find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey));
    await _tester.pumpAndSettle();
  }
}
