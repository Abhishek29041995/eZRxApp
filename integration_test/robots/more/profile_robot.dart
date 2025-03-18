import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ProfileRobot {
  final WidgetTester tester;

  ProfileRobot(this.tester);

  final page = find.byKey(WidgetKeys.profilePage);
  final profilePageLanguageDropdown =
      find.byKey(WidgetKeys.profilePageLanguageDropdown);

  Finder profilePageLanguageDropdownItem(String languageString) => find.byKey(
        WidgetKeys.genericKey(
          key: 'language_$languageString',
        ),
      );

  void verifyPageVisible() {
    expect(page, findsOneWidget);
    _verifyTextVisible('Profile');
  }

  void _verifyTextVisible(String text) {
    final textWidget = find.textContaining(text.tr());
    expect(textWidget, findsOneWidget);
  }

  void _verifyInfoRowVisible(String name, String value) {
    final infoRow = find.byKey(WidgetKeys.balanceTextRow(name.tr(), value));
    expect(infoRow, findsOneWidget);
  }

  void _verifyLanguageDropdownLabelVisible() {
    expect(
      find.byKey(WidgetKeys.profilePageLanguageDropdownLabel),
      findsOneWidget,
    );
    expect(
      (tester.widget(find.byKey(WidgetKeys.profilePageLanguageDropdownLabel))
              as Text)
          .data,
      '${'Language'.tr()}:',
    );
  }

  void _verifyLanguageDropdownVisible(String text) {
    expect(
      find.byKey(WidgetKeys.profilePageLanguageDropdown),
      findsOneWidget,
    );
    // expect(
    //   (tester.widget(find.byKey(WidgetKeys.profilePageLanguageDropdown))as DropdownButtonFormField2<Language>)
    //       .initialValue,
    //   text,
    // );
  }

  String getLanguage() {
    return (tester.widget(find.byKey(WidgetKeys.profilePageLanguageDropdown))
            as DropdownButtonFormField2<Language>)
        .initialValue!
        .languageString;
  }

  void verifyAccountAndBusinessDetailsVisible({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String mobilePhone,
    required String language,
    String paymentTerms = '',
  }) {
    _verifyTextVisible('Account & business details:');
    final userDetails = find.byKey(WidgetKeys.profileUserDetails);
    expect(userDetails, findsOneWidget);
    _verifyInfoRowVisible('First name', firstName);
    _verifyInfoRowVisible('Last name', lastName);
    _verifyInfoRowVisible('Email', email);
    _verifyInfoRowVisible('Username', username);
    _verifyInfoRowVisible('Contact number', mobilePhone);
    if (paymentTerms.isNotEmpty) {
      _verifyInfoRowVisible(
        'Payment terms',
        paymentTerms,
      );
    }
    _verifyLanguageDropdownLabelVisible();
    _verifyLanguageDropdownVisible(language);
  }

  void verifyLicenseListVisible() {
    _verifyTextVisible('License information:'.tr());
    final noItemFound =
        find.byKey(WidgetKeys.noRecordsFoundSearchIcon).evaluate().isNotEmpty;
    if (noItemFound) {
      _verifyTextVisible("Looks like you don't have any license here".tr());
    } else {
      final licenseItems = find.byKey(WidgetKeys.profileLicenseTile);
      final itemCount = licenseItems.evaluate().length;
      expect(licenseItems, findsAtLeastNWidgets(1));
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseName),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseNo),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseDateRange),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseStatus),
        ),
        findsNWidgets(itemCount),
      );
    }
  }

  void verifyProfilePageLanguageDropdown(String languageString) {
    expect(profilePageLanguageDropdown, findsOneWidget);
    expect(profilePageLanguageDropdownItem(languageString), findsOneWidget);
  }

  Future<void> tapProfilePageLanguageDropdownAndChangeLanguage(
    String languageString,
  ) async {
    await tester.tap(profilePageLanguageDropdown);
    await tester.pumpAndSettle();
    await tester.tap(profilePageLanguageDropdownItem(languageString).first);
    await tester.pumpAndSettle();
  }

  void _verifyButtonDisabled(Key key) {
    final button = find.byKey(key);
    expect(button, findsOneWidget);
    final buttonWidget = tester.widget<ButtonStyleButton>(button);
    expect(buttonWidget.onPressed, null);
  }

  void verifyButtonsDisabled() {
    _verifyButtonDisabled(WidgetKeys.profileClearButton);
    _verifyButtonDisabled(WidgetKeys.profileSaveButton);
  }

  void _verifyButtonEnabled(Key key) {
    final button = find.byKey(key);
    expect(button, findsOneWidget);
    final buttonWidget = tester.widget<ButtonStyleButton>(button);
    expect(buttonWidget.enabled, true);
  }

  void verifyButtonsEnabled() {
    _verifyButtonEnabled(WidgetKeys.profileClearButton);
    _verifyButtonEnabled(WidgetKeys.profileSaveButton);
  }

  Future<void> tapSaveButton() async {
    await tester.tap(find.byKey(WidgetKeys.profileSaveButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapClearButton() async {
    await tester.tap(find.byKey(WidgetKeys.profileClearButton));
    await tester.pumpAndSettle();
  }
}
