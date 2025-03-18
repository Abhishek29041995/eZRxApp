import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';
import '../../../common/extension.dart';

class AccountInvoiceRobot extends CommonRobot {
  AccountInvoiceRobot(super.tester);

  final filterButton = find.byKey(WidgetKeys.accountSummaryFilterButton);
  final downloadButton = find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final newPaymentButton = find.byType(ScaleButton);
  final invoiceItem = find.byKey(WidgetKeys.invoiceItem);
  final priceLabel = find.byKey(WidgetKeys.priceComponent);
  final createdDateLabel = find.byKey(WidgetKeys.invoiceItemCreatedDate);
  final dueDateLabel = find.byKey(WidgetKeys.invoiceItemDueDate);
  final statusLabel = find.byKey(WidgetKeys.invoiceItemStatus);
  final idLabel = find.byKey(WidgetKeys.invoiceItemId);
  final orderIdLabel = find.byKey(WidgetKeys.invoiceItemOrderId);
  final govNumber = find.byKey(WidgetKeys.governmentNumber);

  void verifyFilterButton() {
    expect(filterButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
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

  void verifyDownloadButton() {
    expect(downloadButton, findsOneWidget);
  }

  Future<void> tapDownloadButton() async {
    await tester.tap(downloadButton);
    await tester.pumpAndSettle();
  }

  void verifyNewPaymentButton() {
    expect(newPaymentButton, findsOneWidget);
  }

  Future<void> tapNewPaymentButton() async {
    await tester.tap(newPaymentButton);
    await tester.pumpAndSettle();
  }

  void verifyNoRecordFound() {
    final widget = find.byType(NoRecordFound);
    expect(widget, findsOneWidget);
    expect(
      find.descendant(
        of: widget,
        matching: find.text('No invoice found'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: widget,
        matching: find.text(noRecordFoundDefaultSubTitle),
      ),
      findsOneWidget,
    );
  }

  bool get noRecordFound => find.byType(NoRecordFound).evaluate().isNotEmpty;

  void verifyItems({bool isVn = false}) {
    expect(invoiceItem, findsAtLeastNWidgets(1));
    expect(createdDateLabel, findsAtLeastNWidgets(1));
    final itemCount = invoiceItem.evaluate().length;
    expect(
      find.descendant(of: invoiceItem, matching: dueDateLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: invoiceItem, matching: idLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: invoiceItem, matching: orderIdLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: invoiceItem, matching: priceLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: invoiceItem, matching: statusLabel),
      findsAtLeastNWidgets(itemCount),
    );
    if (isVn) {
      expect(
        find.descendant(of: invoiceItem, matching: govNumber),
        findsAtLeastNWidgets(itemCount),
      );
    }
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: invoiceItem,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsWidgets,
      );

  void verifyItemsWithSearchKey(String searchKey) {
    verifyItems();
    expect(tester.widget<Text>(idLabel).data, contains(searchKey));
  }

  void verifyItemsInDocumentDateRange({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyItems();
    final dateText =
        tester.widgetList<Text>(createdDateLabel).map((e) => e.data!);

    for (final text in dateText) {
      final dateText = text.split('${'Created on'.tr()} ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyItemsInAmountRange({
    required double fromAmount,
    required double toAmount,
    required String currency,
  }) {
    verifyItems();
    final dateText = tester
        .widgetList<RichText>(priceLabel)
        .map((e) => e.text.toPlainText());
    for (final text in dateText) {
      final priceText = text.split('$currency ');
      final price = priceText[1].priceValue;
      expect(fromAmount <= price && price <= toAmount, true);
    }
  }

  void verifyItemsWithStatus(String statuses) {
    verifyItems();
    final statusText =
        find.descendant(of: statusLabel, matching: find.byType(Text));
    expect(statusText, findsWidgets);
  }

  Future<void> tapFirstItem() async {
    await tester.tap(invoiceItem.first);
    await tester.pumpAndSettle();
  }
}
