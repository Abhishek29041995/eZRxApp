import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentSummaryRobot {
  final WidgetTester tester;

  PaymentSummaryRobot(this.tester);

  final page = find.byKey(WidgetKeys.paymentSummaryPage);
  final searchBar = find.byKey(WidgetKeys.paymentSummarySearchBar);
  final downloadButton = find.byKey(WidgetKeys.paymentSummaryDownloadButton);
  final scrollToTopButton =
      find.byKey(WidgetKeys.paymentSummaryScrollToTopButton);
  final progressIndicator =
      find.byKey(WidgetKeys.paymentSummaryDownloadInProgress);
  final downloadSuccessSnackbar =
      find.byKey(WidgetKeys.paymentSummaryDownloadSuccess);
  final filterButton = find.byKey(WidgetKeys.paymentSummaryFilterButton);
  final paymentSummaryItems = find.byKey(WidgetKeys.paymentSummaryItem);
  final item = find.byKey(WidgetKeys.paymentSummaryTile);
  final itemGroupDate = find.byKey(WidgetKeys.paymentSummaryGroupDate);
  final newPaymentButton = find.byKey(WidgetKeys.newPaymentButton);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);

  void verifyPageVisible() {
    expect(page, findsOneWidget);
  }

  bool get moreThanFiveItem => item.evaluate().length > 5;

  void verifyDownloadButtonVisible() {
    expect(downloadButton, findsOneWidget);
  }

  void verifyScrollToTopButtonVisible() {
    expect(scrollToTopButton, findsOneWidget);
  }

  void verifyScrollToTopButtonInvisible() {
    expect(scrollToTopButton, findsNothing);
  }

  void verifyProgressIndicatorVisible() {
    expect(progressIndicator, findsOneWidget);
  }

  void verifyDownloadSuccessSnackbarVisible() {
    expect(downloadSuccessSnackbar, findsOneWidget);
    expect(
      find.descendant(
        of: downloadSuccessSnackbar,
        matching: find.text('File downloaded successfully'.tr()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapDownloadButton() async {
    await tester.tap(downloadButton);
    await tester.pump();
    verifyProgressIndicatorVisible();
    await tester.pumpAndSettle();
  }

  Future<void> tapScrollToTopButton() async {
    await tester.tap(scrollToTopButton);
    await tester.pumpAndSettle();
  }

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyFilterButtonVisible() {
    expect(filterButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
    await tester.pumpAndSettle();
  }

  void verifyResetButton() {
    expect(resetButton, findsOneWidget);
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyNewPaymentButtonVisible() {
    expect(newPaymentButton, findsOneWidget);
  }

  Future<void> tapNewPaymentButton() async {
    await tester.tap(newPaymentButton);
    await tester.pumpAndSettle();
  }

  void verifyNoRecordFoundVisible() {
    expect(paymentSummaryItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text('No Payment Summary Found'.tr()), findsOneWidget);
  }

  Future<void> pullToRefresh() async {
    await tester.drag(find.byKey(WidgetKeys.scrollList), const Offset(0, 500));
    await tester.pumpAndSettle();
  }

  Future<void> scrollDown() async {
    await tester.drag(find.byKey(WidgetKeys.scrollList), const Offset(0, -500));
    await tester.pumpAndSettle();
  }

  Future<void> tapItem() async {
    await tester.tap(item);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstItem() async {
    await tester.tap(item.first);
    await tester.pumpAndSettle();
  }

  String getPaymentId(int index) => tester
      .widget<Text>(find.byKey(WidgetKeys.commonTileItemLabel).at(index))
      .data!
      .split('#')
      .last;

  double getPaymentIdPrice(int index) => double.parse(
        tester
            .widget<PriceComponent>(
              find.byKey(WidgetKeys.paymentSummaryAmountAndCurrency).at(index),
            )
            .price,
      );

  void verifyPaymentSummaryGroupListVisible() {
    final noItemFound = find.byType(NoRecordFound).evaluate().isNotEmpty;
    if (noItemFound) {
      verifyNoRecordFoundVisible();
    } else {
      expect(itemGroupDate, findsAtLeastNWidgets(1));
      expect(item, findsAtLeastNWidgets(1));
      final itemCount = item.evaluate().length;

      // Verify tile information
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.commonTileItemLabel),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.paymentSummaryTileStatus),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.paymentSummaryDateOrExpiry),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.paymentSummaryAmountAndCurrency),
        ),
        findsNWidgets(itemCount),
      );
    }
  }

  void verifyPaymentSummaryGroupListVisibleForID() {
    final noItemFound = find.byType(NoRecordFound).evaluate().isNotEmpty;
    if (noItemFound) {
      verifyNoRecordFoundVisible();
    } else {
      expect(itemGroupDate, findsAtLeastNWidgets(1));
      expect(item, findsAtLeastNWidgets(1));
      final itemCount = item.evaluate().length;

      // Verify tile information
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.commonTileItemLabel),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.paymentSummaryTileStatus),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: item,
          matching: find.byKey(WidgetKeys.paymentSummaryAmountAndCurrency),
        ),
        findsNWidgets(itemCount),
      );
    }
  }

  void verifyStatusValue(String valueExpected) {
    final status = find.textContaining(valueExpected);

    expect(
      status,
      findsAtLeastNWidgets(1),
    );
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: item,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsWidgets,
      );
}
