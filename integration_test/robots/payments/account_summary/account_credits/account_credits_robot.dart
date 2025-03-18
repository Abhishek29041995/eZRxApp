import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../common/common_robot.dart';
import '../../../common/extension.dart';

class AccountCreditsRobot extends CommonRobot {
  //initialize Finder
  final Finder _fileDownloadButtonFinder =
      find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final Finder _filterTuneIconFinder =
      find.byKey(WidgetKeys.accountSummaryFilterButton);
  final Finder _newPaymentButtonFinder =
      find.byKey(WidgetKeys.newPaymentButton);
  final Finder _searchBar = find.byKey(WidgetKeys.accountSummarySearchBar);
  final Finder _itemTile = find.byKey(WidgetKeys.creditsItemTile);
  final Finder _itemGroupDate = find.byKey(WidgetKeys.creditCreatedOn);

  AccountCreditsRobot(super.tester);

  //Robot Functions
  void verify() {
    expect(find.byKey(WidgetKeys.allCreditsPage), findsOneWidget);
  }

  void verifyCreditSearchBar() {
    expect(_searchBar, findsOneWidget);
  }

  Future<void> searchCredits(String input) async {
    await tester.enterText(_searchBar, input);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyFilterTuneIcon() {
    expect(_filterTuneIconFinder, findsOneWidget);
  }

  void verifyFilterAppliedCount(int count) {
    expect(find.byKey(WidgetKeys.creditFilterApplied(count)), findsOneWidget);
  }

  void verifyDownloadButton() {
    expect(_fileDownloadButtonFinder, findsOneWidget);
  }

  Future<void> tapDownloadButton() async {
    await tester.tap(_fileDownloadButtonFinder);
    await tester.pumpAndSettle();
  }

  void verifyNewPaymentButton() {
    expect(_newPaymentButtonFinder, findsOneWidget);
  }

  Future<void> tapFilterTuneIcon() async {
    await tester.tap(_filterTuneIconFinder);
    await tester.pumpAndSettle();
  }

  void verifyNoCreditFound() {
    expect(_itemTile, findsNothing);
    expect(find.byType(NoRecordFound), findsOne);
  }

  bool get noCreditFound => _itemTile.evaluate().isEmpty;

  void verifyCreditItem(String searchKey, String status, String price) {
    verifyCreditItemId(searchKey);
    _verifyCreditItemStatus(status);
    _verifyCreditItemPrice(price);
  }

  void verifyCreditItemForID(String searchKey, String price) {
    verifyCreditItemId(searchKey);
    _verifyCreditItemPrice(price);
  }

  void verifyCreditItemId(String searchKey) {
    _verifyOneCreditItem();
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byKey(WidgetKeys.creditItemId(searchKey)),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditItemGovNumberForVN(String searchKey, String govNumber) {
    verifyCreditItemId(searchKey);
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.governmentNumber &&
              widget is Text &&
              widget.data!.contains(govNumber),
        ),
      ),
      findsOneWidget,
    );
  }

  void _verifyCreditItemStatus(String status) {
    _verifyOneCreditItem();
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.text(status.tr()),
      ),
      findsOneWidget,
    );
  }

  void _verifyOneCreditItem() {
    expect(_itemGroupDate, findsOneWidget);
    expect(_itemTile, findsOneWidget);
  }

  void _verifyCreditItemPrice(String price) {
    _verifyOneCreditItem();
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditItemsList() {
    expect(_itemTile, findsAtLeastNWidgets(1));
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(StatusLabel),
      ),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(PriceComponent),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyCreditItemsListForID() {
    expect(_itemTile, findsAtLeastNWidgets(1));
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(StatusLabel),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(PriceComponent),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> tapPaymentButton() async {
    await tester.tap(_newPaymentButtonFinder);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstCreditItem() async {
    await tester.tap(_itemTile.first);
    await tester.pumpAndSettle();
  }

  void verifyCreditsCreatedGroupInDateRange({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    expect(_itemGroupDate, findsAtLeastNWidgets(1));
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: _itemGroupDate,
            matching: find.textContaining('Created on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Created on'.tr()} ');
      final date = DateFormat(DateTimeFormatString.displayDateFormat)
          .parse(dateText.last);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyCreditsItemListWithStatus(String status, {bool isVisible = true}) {
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: _itemTile,
            matching: find.text(status.tr()),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status.tr(), isVisible);
    }
  }

  void verifyCreditsInAmountRange({
    required double fromAmount,
    required double toAmount,
    required String currency,
  }) {
    expect(_itemGroupDate, findsAtLeastNWidgets(1));
    final dateText = tester
        .widgetList<RichText>(find.byKey(WidgetKeys.priceComponent))
        .map((e) => e.text.toPlainText());
    for (final text in dateText) {
      final price = text.split('$currency ').last.priceValue;
      expect(fromAmount <= price && price <= toAmount, true);
    }
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: _itemTile,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsWidgets,
      );
}
