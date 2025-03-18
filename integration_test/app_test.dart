import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:universal_io/io.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('end-to-end test', () {
    testWidgets('Login & logout test example', (WidgetTester tester) async {
      tester.printToConsole('Initial setup and run as DEV flavor');
      await initialSetup(flavor: Flavor.uat);

      await runAppWithCrashlyticsAndLocalization();

      // await tester.pumpWidget(const App());
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // expect(find.byKey(const Key('splashLoadingIndicator')), findsOneWidget);
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      //============================================================
      //  Login Test
      //
      //============================================================
      tester.printToConsole('Redirect to login page');
      final loginUsernameField = find.byKey(const Key('loginUsernameField'));
      expect(loginUsernameField, findsOneWidget);
      final loginPasswordField = find.byKey(const Key('loginPasswordField'));
      expect(loginPasswordField, findsOneWidget);
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      expect(loginSubmitButton, findsOneWidget);

      tester.printToConsole('Input username');
      await tester.tap(loginUsernameField);
      await tester.enterText(loginUsernameField, 'ezrxtest05');
      await tester.pumpAndSettle(const Duration(microseconds: 200));

      tester.printToConsole('Input password');
      await tester.tap(loginPasswordField);
      await tester.enterText(loginPasswordField, 'St@ysafe01');

      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Tap login button');
      await tester.tap(loginSubmitButton);

      await tester.pumpAndSettle(const Duration(seconds: 4));

      tester.printToConsole('Redirect to home page tabbar');
      expect(find.byKey(const Key('homeTabbar')), findsOneWidget);

      //============================================================
      //  Banner Test
      //
      //============================================================
      tester.printToConsole('Home Screen with banner appear');
      final homeBanner = find.byKey(WidgetKeys.homeBanner);
      expect(homeBanner, findsOneWidget);

      // tester.printToConsole('Swipe banner right to left');
      // await tester.drag(homeBanner, const Offset(500.0, 0.0));

      // tester.printToConsole('Tap Banner');
      // await tester.tap(homeBanner);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      //============================================================
      //  Announcement Test
      //
      //============================================================
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final announcementCloseIcon =
          find.byKey(const Key('announcementCloseIcon'));

      if (announcementCloseIcon.evaluate().isNotEmpty) {
        expect(announcementCloseIcon, findsOneWidget);
        await tester.pumpAndSettle(const Duration(milliseconds: 100));
        await tester.tap(announcementCloseIcon);
        await tester.pumpAndSettle(const Duration(seconds: 1));
        tester.printToConsole('Home Screen announcement Close');
      }

      //============================================================
      //  SalesOrg, Customer, Shipping Address Test
      //
      //============================================================

      //Sales Org Selectos Tests
      tester.printToConsole('Sales org selector test');
      final salesOrgSelector = find.byKey(const Key('salesOrgSelect')).first;
      expect(salesOrgSelector, findsOneWidget);

      tester.printToConsole('Click sales org selector');
      await tester.tap(salesOrgSelector);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final vnSalesOrg =
          find.byKey(const Key('salesOrgOption3050')); // VN select Test
      final sgSalesOrg =
          find.byKey(const Key('salesOrgOption2601')); // SG select Test
      final twSalesOrg =
          find.byKey(const Key('salesOrgOption2800')); // TW select Test
      final phSalesOrg =
          find.byKey(const Key('salesOrgOption2500')); // PH select Test

      expect(twSalesOrg, findsOneWidget);
      expect(sgSalesOrg, findsOneWidget);
      expect(vnSalesOrg, findsOneWidget);
      expect(phSalesOrg, findsOneWidget);
      await tester.tap(twSalesOrg);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(salesOrgSelector);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(phSalesOrg);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(salesOrgSelector);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(vnSalesOrg);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(salesOrgSelector);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(sgSalesOrg);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final customerCodeSelector =
          find.byKey(const Key('customerCodeSelect')).first;
      expect(customerCodeSelector, findsOneWidget);
      tester.printToConsole('Click Customer code selector');
      await tester.tap(customerCodeSelector);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final listFinder = find.byType(CustomScrollView);
      final itemFinder = find.text('0030033396');

      // Scroll until the item to be found appears
      await tester.dragUntilVisible(
        itemFinder,
        listFinder, // widget you want to scroll
        const Offset(0, -500), // delta to move
        duration: const Duration(seconds: 5),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.ensureVisible(itemFinder);

      await tester.tap(itemFinder);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedShipToCodeValue = find.text('0070043865');
      expect(selectedShipToCodeValue, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      tester.printToConsole('Click Customer code selector');
      await tester.tap(customerCodeSelector);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final textSearchField = find.byKey(const Key('customerCodeSearchField'));
      expect(textSearchField, findsOneWidget);
      await tester.tap(textSearchField);
      await tester.enterText(textSearchField, '5540');
      await tester.pumpAndSettle(const Duration(microseconds: 200));

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectItem = find.byKey(const Key('customerCodeOption0030035540'));
      await tester.tap(selectItem);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final selectedShipToCode = find.text('0070046018');
      expect(selectedShipToCode, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      tester.printToConsole('Click Customer code selector');
      await tester.tap(customerCodeSelector);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final searchButton = find.byKey(const Key('clearCustomerCodeSearch'));
      await tester.tap(searchButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final listTile = find.byKey(const Key('customerCodeOption0030031508'));
      await tester.tap(listTile);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final shipToCodeSelector =
          find.byKey(const Key('shipToCodeSelect')).first;
      expect(shipToCodeSelector, findsOneWidget);
      await tester.tap(shipToCodeSelector);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final backButton = find.byTooltip('Back');
      await tester.tap(backButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //============================================================
      //  Tabbar Test
      //
      //============================================================
      tester.printToConsole('Click account tabbar');
      final accountTabbar = find.byKey(const Key('accountTabbar'));
      await tester.tap(accountTabbar);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click setting tile');
      final settingsTile = find.byKey(const Key('settingsTile'));
      await tester.tap(settingsTile);

      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('Redirect to setting page');

      //============================================================
      //  Notification Test
      //
      //============================================================

      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('Click notification tile');
      final notificationTile = find.byKey(const Key('notificationTile'));
      await tester.tap(notificationTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final languagePicker =
          find.byKey(const Key('gestureDetectorForLanguagePicker'));
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click thaiLanguageTile tile');
      final thaiLanguageTile = find.byKey(const Key('thaiLanguageTile'));
      await tester.tap(thaiLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Set Up Email Notifications'), findsOneWidget);

      tester.printToConsole('Click language preferences');
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click mandarinLanguageTile tile');
      final mandarLanguageTile = find.byKey(const Key('mandarinLanguageTile'));
      await tester.tap(mandarLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Set Up Email Notifications'), findsOneWidget);

      tester.printToConsole('Click language preferences');
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click burmeseLanguageTile tile');
      final burmeseLanguageTile = find.byKey(const Key('burmeseLanguageTile'));
      await tester.tap(burmeseLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Set Up Email Notifications'), findsOneWidget);

      tester.printToConsole('Click language preferences');
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click vietnameseLanguageTile tile');
      final vietLanguageTile = find.byKey(const Key('vietnameseLanguageTile'));
      await tester.tap(vietLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Set Up Email Notifications'), findsOneWidget);

      tester.printToConsole('Click language preferences');
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click khmerLanguageTile tile');
      final khmerLanguageTile = find.byKey(const Key('khmerLanguageTile'));
      await tester.tap(khmerLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Set Up Email Notifications'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languagePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click englishLanguageTile tile');
      final englishLanguageTile = find.byKey(const Key('englishLanguageTile'));
      await tester.tap(englishLanguageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click order summary update switch on');
      final flutterSwitch = find.byKey(const Key('flutterSwitch'));
      await tester.tap(flutterSwitch);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click order summary update switch');
      await tester.tap(flutterSwitch);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      //============================================================
      //  Localization Test
      //
      //============================================================

      tester.printToConsole('Click languageTile tile');
      final languageTile = find.byKey(const Key('languageTile'));
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click thaiLanguageTile tile');
      await tester.tap(thaiLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ออกจากระบบ'), findsOneWidget);
      expect(find.text('ภาษา'), findsOneWidget);
      expect(find.text('การตั้งค่า'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click mandarinLanguageTile tile');
      await tester.tap(mandarLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('設定'), findsOneWidget);
      expect(find.text('語言'), findsOneWidget);
      expect(find.text('登出'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click burmeseLanguageTile tile');
      await tester.tap(burmeseLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ချိန်ညှိချက်များ'), findsOneWidget);
      expect(find.text('ဘာသာစကား'), findsOneWidget);
      expect(find.text('ထွက်ပါ'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click vietnameseLanguageTile tile');
      await tester.tap(vietLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Cài đặt'), findsOneWidget);
      expect(find.text('Ngôn ngữ'), findsOneWidget);
      expect(find.text('Thoát'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click khmerLanguageTile tile');
      await tester.tap(khmerLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ការកំណត់'), findsOneWidget);
      expect(find.text('ភាសា'), findsOneWidget);
      expect(find.text('ចាកចេញ'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click englishLanguageTile tile');
      await tester.tap(englishLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);

      //============================================================
      //  change password Test
      //
      //============================================================
      tester.printToConsole('Click the Change Password');
      final changePasswordTile = find.byKey(const Key('changePasswordTile'));
      await tester.tap(changePasswordTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      final oldPasswordField = find.byKey(const Key('oldPasswordTextField'));
      expect(oldPasswordField, findsOneWidget);
      final newPasswordField = find.byKey(const Key('newPasswordTextField'));
      expect(newPasswordField, findsOneWidget);
      final confrimPasswordField =
          find.byKey(const Key('confirmPasswordTextField'));
      expect(confrimPasswordField, findsOneWidget);

      tester.printToConsole('Old password input text');
      await tester.tap(oldPasswordField);
      await tester.enterText(oldPasswordField, 'Stays@fe2022!');
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      tester.printToConsole('New password input text');
      await tester.tap(newPasswordField);
      await tester.enterText(newPasswordField, 'Stays@fe2022');
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      tester.printToConsole('Confrim password input text');
      await tester.tap(confrimPasswordField);
      await tester.enterText(confrimPasswordField, 'Stays@fe2022');
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));
      expect(find.text('Settings'), findsOneWidget);

      //============================================================
      //  contact us Test
      //
      //============================================================

      tester.printToConsole('Click the Contact Us');
      final contactUsTile = find.byKey(const Key('contactUsTile'));
      await tester.tap(contactUsTile);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));
      expect(find.text('Settings'), findsOneWidget);

      //============================================================
      //  Accept Use Policy Test
      //
      //============================================================
      tester.printToConsole('Click the Tos');
      final tostile = find.byKey(const Key('tostile'));
      expect(tostile, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 200));
      await tester.tap(tostile);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final auptcappBar = find.byKey(const Key('auptcappBar'));
      expect(auptcappBar, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 8));
      if (Platform.isAndroid) {
        await tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
        await tester.pumpAndSettle(const Duration(seconds: 3));
        await tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
      }

      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byType(BackButton));

      await tester.pumpAndSettle(const Duration(milliseconds: 300));
      expect(find.text('Settings'), findsOneWidget);

      //============================================================
      //  privacy policy Test
      //
      //============================================================
      tester.printToConsole('Click the privacy policy');
      final privacyPolicyTile = find.byKey(const Key('Privacy_Policy'));
      expect(privacyPolicyTile, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      await tester.tap(privacyPolicyTile);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));
      expect(find.text('Settings'), findsOneWidget);

      //============================================================
      //  Logout Test
      //
      //============================================================

      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('Redirect to setting page and click logout tile');
      final logoutTile = find.byKey(const Key('logoutTile'));
      await tester.tap(logoutTile);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      tester.printToConsole('Redirect back to login page');
      expect(loginUsernameField, findsOneWidget);
      expect(loginPasswordField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
