import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/extension.dart';

class CustomerSearchRobot {
  final WidgetTester tester;

  CustomerSearchRobot(this.tester);

  final confirmChangeAddress = find.byKey(WidgetKeys.confirmButton);
  final cancelChangeAddress = find.byKey(WidgetKeys.cancelButton);
  final customerCodeSearchField = find.byKey(WidgetKeys.searchBar);
  final changeSalesOrgButton = find.byKey(WidgetKeys.changeSalesOrgButton);
  final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);

  void verifyPage() {
    expect(customerSearchPage, findsOneWidget);
  }

  bool get isCustomerSearchPageVisible =>
      customerSearchPage.evaluate().isNotEmpty;

  Future<void> waitForCustomerCodePageToLoad({int maxIteration = 8}) async {
    await tester.pumpUntilVisible(
      customerSearchPage,
      maxIteration: maxIteration,
    );
  }

  Future<void> selectCustomerSearch(String shipToCode) async {
    findCustomerCodeSearchField();
    await search(shipToCode);
    findCustomerCode(shipToCode);
    await tapOnCustomerCode(shipToCode);
  }

  void findChangeSalesOrgButton() {
    expect(changeSalesOrgButton, findsOneWidget);
  }

  Future<void> tapChangeSalesOrgButton() async {
    await tester.tap(changeSalesOrgButton);
    await tester.pumpAndSettle();
  }

  Future<void> changeSalesOrgAndSelectCustomerSearch(
    String shipToCode,
    String salesOrg,
  ) async {
    findChangeSalesOrgButton();
    await tapChangeSalesOrgButton();
    findCustomerCodeSearchField();
    await search(salesOrg);
    findSalesOrgItem(salesOrg);
    await tapOnSalesOrgItem(salesOrg);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    findCustomerCodeSearchField();
    await search(shipToCode);
    findCustomerCode(shipToCode);
    await tapOnCustomerCode(shipToCode);
    if (confirmChangeAddress.hasFound) {
      await tapOnConfirmChangeAddressButton();
    }
  }

  void findCustomerCodeSearchField() {
    expect(customerCodeSearchField, findsOneWidget);
  }

  Future<void> search(String customerCode) async {
    await tester.tap(customerCodeSearchField);
    await tester.pump();
    await tester.enterText(customerCodeSearchField, customerCode);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void findCustomerCode(String shipToCode) {
    expect(
      find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first,
      findsOneWidget,
    );
  }

  void findSalesOrgItem(String salesOrg) {
    expect(
      find.byKey(WidgetKeys.salesOrgSearchOption(salesOrg)).first,
      findsOneWidget,
    );
  }

  Future<void> tapOnCustomerCode(String shipToCode) async {
    await tester
        .tap(find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnSalesOrgItem(String salesOrg) async {
    await tester
        .tap(find.byKey(WidgetKeys.salesOrgSearchOption(salesOrg)).first);
    await tester.pumpAndSettle();
  }

  void findCancelChangeAddressButton() {
    expect(cancelChangeAddress, findsOneWidget);
  }

  Future<void> tapOnCancelChangeAddressButton() async {
    await tester.tap(cancelChangeAddress);
    await tester.pump();
  }

  void findConfirmChangeAddressButton() {
    expect(confirmChangeAddress, findsOneWidget);
  }

  Future<void> tapOnConfirmChangeAddressButton() async {
    await tester.tap(confirmChangeAddress);
    await tester.pumpAndSettle();
  }

  void verifyCustomerCodeIsSelected(String code) {
    final customerCode = find.textContaining(code);
    expect(customerCode, findsOneWidget);
  }

  void verifySearchResults(String textSearch) {
    final customerCode = find.textContaining(textSearch);
    expect(customerCode, findsWidgets);
  }

  void verifySearchNotFound() {
    expect(
      find.text(
        '${'Check the location name or code you have entered for any errors'.tr()}.',
      ),
      findsWidgets,
    );
  }
}
