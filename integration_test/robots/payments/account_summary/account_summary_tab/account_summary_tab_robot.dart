import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';
import '../../../common/extension.dart';

class AccountSummaryTabRobot extends CommonRobot {
  final _allSummaryPage = find.byKey(WidgetKeys.allSummaryPage);
  final _filterButton = find.byKey(WidgetKeys.accountSummaryFilterButton);
  final _downloadButton = find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final _summaryItem = find.byKey(
    WidgetKeys.invoiceCreditItem,
  );
  final _priceLabel = find.byKey(WidgetKeys.priceComponent);
  final _summaryDocumentDateLabel = find.byKey(
    WidgetKeys.invoiceCreditDocumentDate,
  );
  final _statusLabel = find.byKey(WidgetKeys.invoiceItemStatus);
  final _summaryId = find.byKey(WidgetKeys.invoiceCreditItemId);
  final _summaryExpandableSection = find.byKey(WidgetKeys.expandableSection);
  final _newPaymentButtonFinder = find.byKey(WidgetKeys.newPaymentButton);
  final _govNumber = find.byKey(WidgetKeys.governmentNumber);

  AccountSummaryTabRobot(super.tester);

  void verifyPage() {
    expect(_allSummaryPage, findsOneWidget);
  }

  bool get isNoRecordFound {
    final widget = find.descendant(
      of: _allSummaryPage,
      matching: find.byType(NoRecordFound),
    );

    return widget.evaluate().isNotEmpty;
  }

  void verifyFilterButton() {
    expect(_filterButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(_filterButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: _filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyDownloadButton() {
    expect(_downloadButton, findsOneWidget);
  }

  Future<void> tapDownloadButton() async {
    await tester.tap(_downloadButton);
    await tester.pumpAndSettle();
  }

  void verifyNewPaymentButton() {
    expect(
      find.descendant(of: _allSummaryPage, matching: _newPaymentButtonFinder),
      findsOneWidget,
    );
  }

  Future<void> tapNewPaymentButton() async {
    await tester.tap(
      find.descendant(of: _allSummaryPage, matching: _newPaymentButtonFinder),
    );
    await tester.pumpAndSettle();
  }

  void verifyNoRecordFound() {
    final widget = find.descendant(
      of: _allSummaryPage,
      matching: find.byType(NoRecordFound),
    );
    expect(widget, findsOneWidget);
    expect(
      find.descendant(
        of: widget,
        matching: find.text("That didn't match anything".tr()),
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

  @override
  Future<void> pullToRefresh() async {
    await tester.drag(
      find.descendant(
        of: _allSummaryPage,
        matching: find.byKey(WidgetKeys.scrollList),
      ),
      const Offset(0, 500),
    );
    await tester.pumpAndSettle();
  }

  void verifyItems({bool isVn = false}) {
    expect(_summaryItem, findsAtLeastNWidgets(1));
    final itemCount = _summaryItem.evaluate().length;
    expect(
      find.descendant(of: _summaryItem, matching: _summaryDocumentDateLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _summaryId),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _summaryExpandableSection),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _priceLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _statusLabel),
      findsAtLeastNWidgets(itemCount),
    );
    if (isVn) {
      expect(
        find.descendant(of: _summaryItem, matching: _govNumber),
        findsAtLeastNWidgets(itemCount),
      );
    }
  }

  void verifyItemWithId(String id, bool isCredit) {
    final itemId = '${isCredit ? 'Credit' : 'Debit'} #$id';
    expect(
      find.descendant(of: _summaryItem, matching: find.text(itemId)),
      findsOneWidget,
    );
  }

  Future<void> tapItemWithId(String id, bool isCredit) async {
    final itemId = '${isCredit ? 'Credit' : 'Debit'} #$id';
    await tester
        .tap(find.descendant(of: _summaryItem, matching: find.text(itemId)));
    await tester.pumpAndSettle();
  }

  void verifyExpandableDetailsButton() {
    expect(_summaryExpandableSection, findsWidgets);
  }

  Future<void> tapExpandableDetailsButton({int index = 0}) async {
    await tester.tap(_summaryExpandableSection.at(index));
    await tester.pumpAndSettle();
  }

  void displayDetails({
    bool isHidden = false,
    int index = 0,
    String referenceListString = '',
  }) {
    expect(
      find.descendant(
        of: _summaryExpandableSection.at(index),
        matching: find.text(
          isHidden
              ? 'Show Debit/Credit Ref. Number(s)'.tr()
              : 'Hide Debit/Credit Ref. Number(s)'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.summaryExpandableSectionDetails),
        matching: find.text(
          referenceListString,
        ),
      ),
      isHidden ? findsNothing : findsOneWidget,
    );
  }

  Future<void> tapFirstSummaryItem() async {
    await tester.tap(_summaryItem.first);
    await tester.pumpAndSettle();
  }

  void verifySummaryItemsDate({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    expect(_summaryDocumentDateLabel, findsAtLeastNWidgets(1));
    final dateText = tester
        .widgetList<Text>(
          _summaryDocumentDateLabel,
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(text);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyCreditsItemListWithStatus(String status, {bool isVisible = true}) {
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: _statusLabel,
            matching: find.text(status.tr()),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status.tr(), isVisible);
    }
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: _summaryItem,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsWidgets,
      );
}
